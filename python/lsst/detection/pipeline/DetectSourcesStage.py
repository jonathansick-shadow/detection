from lsst.pex.harness.Stage import Stage

import lsst.pex.harness.Utils
from lsst.pex.logging import Log

import lsst.daf.base as dafBase
from lsst.daf.base import *

import lsst.afw.detection as afwDet
import lsst.afw.image as afwImg


class DetectSourcesStage(Stage):
    """
    Description:
        This stage wraps the detection of sources on an exposure.
        The exposure to detect should be in the clipboard. The key for the
        exposure can be specified in the policy file. If not specified,
        the default key is 'ExposureForDetection'.

        The required policy components are 'thresholValue' (which specifies
        the threshold for detection) and 'minPixelsPerSource' (which specifies
        the minimum size of sources to consider in number of pixels). 
        
        See below for optional policy components.

    Policy Input: 
    (see detection/pipeline/DetectSourcesStageDictionary.paf)
    - thresholdValue (double): REQUIRED specify threshold value
    - minPixelsPerSource (int): REQUIRED specify minimum source size
    - runMode (string): optional, default "process"    
    - exposureName (string): optional, default "ExposureForDetection"
    - exposurePixelType (string): optional, default "float"
    - thresholdType (string): optional, default "value"
    - thresholdPolarity (string): optional, default "positive"

    Clipboard Input:
    - Exposure with key name specified in policy ("exposureName")

    ClipboardOutput:
    - Input exposure with same key name
    - PositiveDetectionSet (DetectionSet): if thresholdPolarity policy 
        is "positive" or "both"
    - NegativeDetectionSet (DetectionSet): if threholdPolarity policy 
        is "negative" or "both"
    """

    def __init__(self, stageId = -1, policy = None):
        # call base constructor
        lsst.pex.harness.Stage.Stage.__init__(self,stageId, policy)
        # initialize a log
        self.log = Log(Log.getDefaultLog(), "DetectSourcesStage")

    def preprocess(self):
        """
        Detect sources in the master process before any processing
        """
        if self._policy.exists('runMode') and \
                self._policy.getString('runMode') == 'preprocess':
            self.log.log(Log.INFO, "Detecting Sources in preprocess")
            self._detectSources()
        

    def process(self):
        """
        Detect sources in the worker process
        """
        if not self._policy.exists('runMode') or \
                self._policy.getString('runMode') == 'process':
            self.log.log(Log.INFO, "Detecting Sources in process")
            self._detectSources()

    
    def postprocess(self):
        """
        Detect sources in the master process after any processing
        """
        if self._policy.exists('runMode') and \
                self._policy.getString('runMode') == 'postprocess':
            self.log.log(Log.INFO, "Detecting Sources in postprocess")
            self._detectSources()


    def _detectSources(self):
        #may raise exception
        exposureName = self._validateInput()
        self.log.log(Log.DEBUG, ("exposure's clipboard key: %s"%exposureName))

        queueSize = self.inputQueue.size()       
        self.log.log(Log.INFO, ("%d Datasets found in inputQueue" % queueSize))

        for i in xrange(queueSize):
            clipboard = self.inputQueue.getNextDataset()
            exposure = clipboard.get(exposureName)
            if exposure != None:
                self.log.log(Log.INFO, ("Detecting Sources in dataset %d of %d"\
                        %(i,queueSize)))
                maskedImage = exposure.getMaskedImage()
                if self.negativeThreshold != None:            
                    dsNegative = self.detectionSetType(maskedImage, \
                                                       self.negativeThreshold, \
                                                       "FP-", \
                                                       self.minPixels)
                    clipboard.put("NegativeDetectionSet", dsPositive)

                if self.positiveThreshold != None:            
                    #detect positive sources
                    dsPositive = self.detectionSetType(maskedImage, \
                                                       self.positiveThreshold, \
                                                       "FP+", \
                                                       self.minPixels)
                clipboard.put("PositiveDetectionSet", dsPositive)
                self.outputQueue.addDataSet(clipboard)
            else:
                self.log.log(Log.WARN, ("Dataset %d of %d contained no data"\
                        % (i, queueSize)))
   
    def _validatePolicy(self):
        """
        Validates the policy object.
        Returns the name of the exposure on the clipboard.
        """
        #Required policy components:
        # minPixelsPerSource: defines the minimum source size
        # thresholdValue: defines the detection threshold
        self.minPixels = self._policy.getInt("minPixelsPerSource")
        thresholdValue = self._policy.getPolicy("thresholdValue")

        if not self._policy.exists("exposurePixelType"):
            self.log.log(Log.WARN, "Using default \
                    'exposurePixelType'=\"float\"")    
            self.detectionSetType = afwDet.DetectionSetF
        else:
            exposurePixelType = self.policy.getString("exposurePixelType")
            if exposurePixelType == "int":
                self.detectionSetType = afwDet.DetectionSetI
            elif exposurePixelType == "double":
                self.detectionSetType = afwDet.DetectionSetD
            else:
                if exposurePixelType != "float":
                    self.log.log(Log.WARN, ("Illegal pixel type: %s \
                            specified for policy component 'exposurePixelType'"\
                            % exposurePixelType))
                    self.log.log(Log.WARN, "Using default \
                           'exposurePixelType'=\"float\"")                                          self.detectionSetType = afwDet.DetectionSetF

        #Look for a threshold type
        #Default to "value"
        if not self._policy.exists("thresholdType"):
            thresholdType = "value"
            self.log.log(Log.WARN, "Using default \
                    'thresholdType'=\"value\"")
        else:
            thresholdType = self._policy.getString("thresholdType")
            
        #Look for a threshold polarity.
        #Default to positive
        if not self._policy.exists("thresholdPolarity"):
            polarity = "positive"
            self.log.log(Log.WARN, "Using default \
                    'thresholdPolarity'=\"positive\"")       
        else:
            polarity = self._policy.getString("thresholdPolarity")

        self.negativeThreshold = None
        if polarity == "negative" or polarity == "both":
            #create a Threshold for negative detections
            policy.set("polarity", False)
            self.negativeThreshold = afwDet.createThreshold(thresholdValue,\
                                                            thresholdType,\
                                                            False)

        self.positiveThreshold = None
        if polarity != "negative":
            #This conditional catches:
            # polarity == "positive"
            # polarity == "both"
            # and malformed polarity values
            # create a Threshold for positive detections
            policy.set("polarity", True)
            self.positiveThreshold = afwDet.createThreshold(thresholdValue,\
                                                            thresholdType,\
                                                            True)

        if self._policy.exists("exposureName")
            self.log.log(Log.WARN, "Using default \
                    'exposureName'=\"ExposureForDetection\"")       
            return self._policy.getString("exposureName")
        else:
            return "ExposureForDetection"
