<?xml version='1.0' encoding='ISO-8859-1' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>Footprint.cc</name>
    <path>/Users/rhl/LSST/detection/include/lsst/detection/</path>
    <filename>include_2lsst_2detection_2_footprint_8cc</filename>
    <member kind="typedef">
      <type>std::vector&lt; boost::shared_ptr&lt; Startspan &gt; &gt;</type>
      <name>StartspanPtrT</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>8971b5890561e5e1925b6835cea74439</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>DIRECTION</name>
      <anchor>a268a41a13430b18e933ed40207178d0</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DOWN</name>
      <anchor>a268a41a13430b18e933ed40207178d09b0b4a95b99523966e0e34ffdadac9da</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>UP</name>
      <anchor>a268a41a13430b18e933ed40207178d0ba595d8bca8bc5e67c37c0a9d89becfa</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>RESTART</name>
      <anchor>a268a41a13430b18e933ed40207178d0262553c759e1d1a9398bc406b1fadcb7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DONE</name>
      <anchor>a268a41a13430b18e933ed40207178d09c954bcf443428c80b0f107b3bc48749</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>id</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>7441ef0865bcb3db9b8064dd7375c1ea</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>y</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>0a2f84ed7838f07779ae24c5a9086d33</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>x0</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>97650a9c1395589a56789a90b5bf8d0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>x1</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>97fcb0e1731b36905e90757f211b1340</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const boost::shared_ptr&lt; lsst::detection::Span &gt;</type>
      <name>_span</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>decc9896549717f1a2cf9dbb0fc3a616</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>DIRECTION</type>
      <name>_direction</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>1d9c148d357538bb42f9970e40dd8f52</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>_stop</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>084e883de8dae10a26a45bbe7d5921a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const lsst::fw::Image&lt; ImagePixelType &gt; *</type>
      <name>_image</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>07d56f193a1db60cb13a912eeb586778</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>lsst::fw::Mask&lt; MaskPixelType &gt; *</type>
      <name>_mask</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>3ce5280a82affe0fcc0bb6d427f6b859</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; typename Startspan&lt; MaskPixelType &gt;::StartspanPtrT &gt; &amp;</type>
      <name>_spans</name>
      <anchorfile>include_2lsst_2detection_2_footprint_8cc.html</anchorfile>
      <anchor>74e9fc78b4210806e21c4f13958ec3b3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Footprint.cc</name>
    <path>/Users/rhl/LSST/detection/src/</path>
    <filename>src_2_footprint_8cc</filename>
    <includes id="_peak_8h" name="Peak.h" local="yes" imported="no">lsst/detection/Peak.h</includes>
    <includes id="_footprint_8h" name="Footprint.h" local="yes" imported="no">lsst/detection/Footprint.h</includes>
  </compound>
  <compound kind="file">
    <name>Footprint.h</name>
    <path>/Users/rhl/LSST/detection/include/lsst/detection/</path>
    <filename>_footprint_8h</filename>
    <includes id="_peak_8h" name="Peak.h" local="no" imported="no">lsst/detection/Peak.h</includes>
    <includes id="include_2lsst_2detection_2_footprint_8cc" name="Footprint.cc" local="yes" imported="no">Footprint.cc</includes>
    <namespace>lsst</namespace>
    <namespace>lsst::detection</namespace>
    <class kind="class">lsst::detection::Span</class>
    <class kind="class">lsst::detection::Footprint</class>
    <class kind="class">lsst::detection::DetectionSet</class>
    <member kind="define">
      <type>#define</type>
      <name>LSST_DETECTION_FOOTPRINT_H</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>d37e918db572c0ee94f7b85913702ecf</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>boost::shared_ptr&lt; Span &gt;</type>
      <name>SpanPtrT</name>
      <anchorfile>namespacelsst_1_1detection.html</anchorfile>
      <anchor>6e29620cc9b0b82f2d92e48c32abee56</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>boost::shared_ptr&lt; Footprint &gt;</type>
      <name>FootprintPtrT</name>
      <anchorfile>namespacelsst_1_1detection.html</anchorfile>
      <anchor>40ac147f49a4de7be6516678a199c628</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; boost::shared_ptr&lt; Startspan &gt; &gt;</type>
      <name>StartspanPtrT</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>8971b5890561e5e1925b6835cea74439</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>id</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>7441ef0865bcb3db9b8064dd7375c1ea</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>y</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>0a2f84ed7838f07779ae24c5a9086d33</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>x0</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>97650a9c1395589a56789a90b5bf8d0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>x1</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>97fcb0e1731b36905e90757f211b1340</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const boost::shared_ptr&lt; lsst::detection::Span &gt;</type>
      <name>_span</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>decc9896549717f1a2cf9dbb0fc3a616</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>DIRECTION</type>
      <name>_direction</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>1d9c148d357538bb42f9970e40dd8f52</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>_stop</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>084e883de8dae10a26a45bbe7d5921a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const lsst::fw::Image&lt; ImagePixelType &gt; *</type>
      <name>_image</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>07d56f193a1db60cb13a912eeb586778</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>lsst::fw::Mask&lt; MaskPixelType &gt; *</type>
      <name>_mask</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>3ce5280a82affe0fcc0bb6d427f6b859</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; typename Startspan&lt; MaskPixelType &gt;::StartspanPtrT &gt; &amp;</type>
      <name>_spans</name>
      <anchorfile>_footprint_8h.html</anchorfile>
      <anchor>74e9fc78b4210806e21c4f13958ec3b3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Peak.h</name>
    <path>/Users/rhl/LSST/detection/include/lsst/detection/</path>
    <filename>_peak_8h</filename>
    <includes id="_peak_8h" name="Peak.h" local="no" imported="no">lsst/detection/Peak.h</includes>
    <namespace>lsst</namespace>
    <namespace>lsst::detection</namespace>
    <class kind="class">lsst::detection::Peak</class>
    <member kind="define">
      <type>#define</type>
      <name>LSST_DETECTION_PEAK_H</name>
      <anchorfile>_peak_8h.html</anchorfile>
      <anchor>c87b5e2d61e67e891d7face7cc2f1f5f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>boost::shared_ptr&lt; Peak &gt;</type>
      <name>PeakPtrT</name>
      <anchorfile>namespacelsst_1_1detection.html</anchorfile>
      <anchor>a58cbaf913c14cbe7b6324adff491324</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>__init__.py</name>
    <path>/Users/rhl/LSST/detection/python/lsst/detection/</path>
    <filename>____init_____8py</filename>
    <namespace>detection::__init__</namespace>
  </compound>
  <compound kind="file">
    <name>detectionLib.py</name>
    <path>/Users/rhl/LSST/detection/python/lsst/detection/</path>
    <filename>detection_lib_8py</filename>
    <namespace>detection::detectionLib</namespace>
    <class kind="class">detection::detectionLib::_object</class>
    <class kind="class">detection::detectionLib::PySwigIterator</class>
    <class kind="class">detection::detectionLib::ios_base</class>
    <class kind="class">detection::detectionLib::ios</class>
    <class kind="class">detection::detectionLib::ostream</class>
    <class kind="class">detection::detectionLib::istream</class>
    <class kind="class">detection::detectionLib::iostream</class>
    <class kind="class">detection::detectionLib::floatArray</class>
    <class kind="class">detection::detectionLib::doubleArray</class>
    <class kind="class">detection::detectionLib::Peak</class>
    <class kind="class">detection::detectionLib::Span</class>
    <class kind="class">detection::detectionLib::Footprint</class>
    <class kind="class">detection::detectionLib::PeakPtrT</class>
    <class kind="class">detection::detectionLib::PeakContainerT</class>
    <class kind="class">detection::detectionLib::SpanPtrT</class>
    <class kind="class">detection::detectionLib::SpanContainerT</class>
    <class kind="class">detection::detectionLib::FootprintPtrT</class>
    <class kind="class">detection::detectionLib::FootprintContainerT</class>
    <class kind="class">detection::detectionLib::DetectionSetD</class>
    <member kind="function">
      <type>def</type>
      <name>ios_base_sync_with_stdio</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>6f21da989da38cd85ef005bad78c7711</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>ios_base_xalloc</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>5ede5e072266a967c242055539a1517e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>floatArray_frompointer</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>256f09636e68ebdca3440797898ea0fb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>doubleArray_frompointer</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>16481e915b7c8dbc012a20655cde717d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>version</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>c4a6ad3d7b5d7895ea98847ce964f1d1</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Peak.cc</name>
    <path>/Users/rhl/LSST/detection/src/</path>
    <filename>_peak_8cc</filename>
    <includes id="_peak_8h" name="Peak.h" local="yes" imported="no">lsst/detection/Peak.h</includes>
  </compound>
  <compound kind="file">
    <name>Footprint_1.cc</name>
    <path>/Users/rhl/LSST/detection/tests/</path>
    <filename>_footprint__1_8cc</filename>
    <includes id="_footprint_8h" name="Footprint.h" local="yes" imported="no">lsst/detection/Footprint.h</includes>
    <namespace>lsst::fw</namespace>
    <member kind="typedef">
      <type>float</type>
      <name>ImagePixelT</name>
      <anchorfile>_footprint__1_8cc.html</anchorfile>
      <anchor>36547cf6a43b8da6c57b14aaf198066c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>char</type>
      <name>MaskPixelT</name>
      <anchorfile>_footprint__1_8cc.html</anchorfile>
      <anchor>991252c09f303b61015ac31ca6714a71</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>_footprint__1_8cc.html</anchorfile>
      <anchor>e66f6b31b5ad750f1fe042a706a4e3d4</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Footprint_1.py</name>
    <path>/Users/rhl/LSST/detection/tests/</path>
    <filename>_footprint__1_8py</filename>
    <namespace>Footprint_1</namespace>
    <class kind="class">Footprint_1::FootprintTestCase</class>
    <class kind="class">Footprint_1::DetectionSetTestCase</class>
    <class kind="class">Footprint_1::DetectionSetTestCase::Object</class>
    <member kind="function">
      <type>def</type>
      <name>toString</name>
      <anchorfile>namespace_footprint__1.html</anchorfile>
      <anchor>e87600ddb5012a46c4743eeb6e02ca30</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>suite</name>
      <anchorfile>namespace_footprint__1.html</anchorfile>
      <anchor>6f515daf49881e24bf6e1d6e91c38d12</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Peak_1.py</name>
    <path>/Users/rhl/LSST/detection/tests/</path>
    <filename>_peak__1_8py</filename>
    <namespace>Peak_1</namespace>
    <class kind="class">Peak_1::PeakTestCase</class>
    <member kind="function">
      <type>def</type>
      <name>suite</name>
      <anchorfile>namespace_peak__1.html</anchorfile>
      <anchor>f4d4f30e1a73fde45dd3e090db2af780</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>detection</name>
    <filename>namespacedetection.html</filename>
    <namespace>detection::__init__</namespace>
    <namespace>detection::detectionLib</namespace>
  </compound>
  <compound kind="namespace">
    <name>detection::__init__</name>
    <filename>namespacedetection_1_1____init____.html</filename>
  </compound>
  <compound kind="namespace">
    <name>detection::detectionLib</name>
    <filename>namespacedetection_1_1detection_lib.html</filename>
    <class kind="class">detection::detectionLib::_object</class>
    <class kind="class">detection::detectionLib::PySwigIterator</class>
    <class kind="class">detection::detectionLib::ios_base</class>
    <class kind="class">detection::detectionLib::ios</class>
    <class kind="class">detection::detectionLib::ostream</class>
    <class kind="class">detection::detectionLib::istream</class>
    <class kind="class">detection::detectionLib::iostream</class>
    <class kind="class">detection::detectionLib::floatArray</class>
    <class kind="class">detection::detectionLib::doubleArray</class>
    <class kind="class">detection::detectionLib::Peak</class>
    <class kind="class">detection::detectionLib::Span</class>
    <class kind="class">detection::detectionLib::Footprint</class>
    <class kind="class">detection::detectionLib::PeakPtrT</class>
    <class kind="class">detection::detectionLib::PeakContainerT</class>
    <class kind="class">detection::detectionLib::SpanPtrT</class>
    <class kind="class">detection::detectionLib::SpanContainerT</class>
    <class kind="class">detection::detectionLib::FootprintPtrT</class>
    <class kind="class">detection::detectionLib::FootprintContainerT</class>
    <class kind="class">detection::detectionLib::DetectionSetD</class>
    <member kind="function">
      <type>def</type>
      <name>ios_base_sync_with_stdio</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>6f21da989da38cd85ef005bad78c7711</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>ios_base_xalloc</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>5ede5e072266a967c242055539a1517e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>floatArray_frompointer</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>256f09636e68ebdca3440797898ea0fb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>doubleArray_frompointer</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>16481e915b7c8dbc012a20655cde717d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>version</name>
      <anchorfile>namespacedetection_1_1detection_lib.html</anchorfile>
      <anchor>c4a6ad3d7b5d7895ea98847ce964f1d1</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::_object</name>
    <filename>classdetection_1_1detection_lib_1_1__object.html</filename>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::PySwigIterator</name>
    <filename>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>ba6bd4b3fbb4dd3ae2ef66764deb6a4a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>value</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>6a8b3d3b40eacf732a87cd23f89c0c38</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>incr</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>7969a54b5c0ae1f93c421e556ffe081a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>decr</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>d581a2dbe4ad6c99f7ad23066b711ddf</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>distance</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>6bce754745ccc916b415cb2540d370db</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>equal</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>9f75769c9b06efd3cf3350672201c77a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>copy</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>3da2cc700cee62a9ea953b0eb30d6354</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>next</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>74b79d4e4a93063deafdc8fce20f1c39</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>previous</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>662fe68ea698c9dbd61410cc7dff748f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>advance</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>7e451c75c2e8b03c316a4663e9382ffb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__eq__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>83083e1149bf78ca0603e044de570a44</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__ne__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>089c0fdd5c2551343670f728b292c399</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__iadd__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>80f29ba0780b3807be95515745ec136f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__isub__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>a42ab1624e52fe37ad2c5fa02d44cbac</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__add__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>dee7fb6c06b7555a1df4d3ab719c29aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__sub__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>1cfbc82daaeb28eeadacc1ce9e12c5de</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__iter__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_py_swig_iterator.html</anchorfile>
      <anchor>6eb5810e0832b7ffdea8aceee8729a39</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::ios_base</name>
    <filename>classdetection_1_1detection_lib_1_1ios__base.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>413d46417c57dc46cbe93c384b1ffb65</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>register_callback</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>793915b9c1150b77c8380867a01434ac</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>flags</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>027c967bdada676c1278a67fc575d281</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>setf</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>11e7efcf0a0a2adb24f74bb93e0a0250</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>unsetf</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>61802a3f9db42d1fa2acc56e1d067912</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>precision</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>a0d592c2352cb13893d34eb444657c70</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>width</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>93cfcf31730be377828e93e73a58e3b1</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>sync_with_stdio</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>ead617ad7196a58d05ad4b79f33e5b43</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>imbue</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>6f0c180fb7664a3696bb4222debc7d8d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getloc</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>cc3d67139d977d924f3dc4da7d1b3121</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>xalloc</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>3a259a83fb63b7498bea8bc9ff0c70d9</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>iword</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>d7ce70794a8d8cc84a0c9c1e9ca31f04</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pword</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>24347a093837a3bd3c813c9605cda584</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type></type>
      <name>erase_event</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>ceda6f6f2ca7049d9af46b4775b4b302</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type></type>
      <name>imbue_event</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>74a535175665dd186e367f0784dd2f3f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type></type>
      <name>copyfmt_event</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios__base.html</anchorfile>
      <anchor>da6564f1a4687409fec6798a2c98e258</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::ios</name>
    <filename>classdetection_1_1detection_lib_1_1ios.html</filename>
    <base>detection::detectionLib::ios_base</base>
    <member kind="function">
      <type>def</type>
      <name>rdstate</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>62ff9aa08e567dbfc5dfc8b35d480b85</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>clear</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>ea29b2dfcab837cd59244569343aaf81</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>setstate</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>7c036fb37075ed9d1f26eda2c08803dd</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>good</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>0f679002b40ace996ed2dc5541c15b1c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>eof</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>01ec9a28a960540f6f4eddcef37b71cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>fail</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>d092e30d627e5a49aa7efaf63a4a3a92</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>bad</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>51fd83dae611eea2bd243debf2b74934</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>exceptions</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>7a9d3eebef0a3cdbb20a68e90773691d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>3b99f03260b322acd3b000c2db29cd58</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>tie</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>02dd4c3132190ef4235529dec548469f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>rdbuf</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>7f124275d0ab635e0ab29a95df47bd4c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>copyfmt</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>b2c01f3de01ce432ec245f75f7296306</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>fill</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>795c305aaf0c9dc6534150a318889c7e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>imbue</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>affa1bad313d7bd6e2b62a6805f58fd0</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>narrow</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>401ab826eb7cf3a2f9b3c36cfb3a6d91</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>widen</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ios.html</anchorfile>
      <anchor>491a72ec9c9477cda597dd0505c4a2ec</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::ostream</name>
    <filename>classdetection_1_1detection_lib_1_1ostream.html</filename>
    <base>detection::detectionLib::ios</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ostream.html</anchorfile>
      <anchor>7c9ea86ff232578efd875edae4863bcf</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__lshift__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ostream.html</anchorfile>
      <anchor>86a3a4e9101809320ca231ff2ff5c094</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>put</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ostream.html</anchorfile>
      <anchor>fe98bb6df5a8a851e81d57ffb99858d8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>write</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ostream.html</anchorfile>
      <anchor>8973ff9f2d2206045ba78b305bc41a53</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>flush</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ostream.html</anchorfile>
      <anchor>9163d5e9193820c1966c8c742db8b708</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>tellp</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ostream.html</anchorfile>
      <anchor>3c1d8fad445b021959eb004481fcf853</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>seekp</name>
      <anchorfile>classdetection_1_1detection_lib_1_1ostream.html</anchorfile>
      <anchor>acc710bc6b650e379cc641179faa4859</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::istream</name>
    <filename>classdetection_1_1detection_lib_1_1istream.html</filename>
    <base>detection::detectionLib::ios</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>10e8d24119d3332d1224df955ccd9ca2</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__rshift__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>1cf3bc7d5fc30959e954408863fa3cab</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>gcount</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>f9b2dc1f5c5c4163d005643ae04ba5c0</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>get</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>b2d10d46748bb23887b075bf9617d188</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getline</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>2b02743abdf8341bc3e965c9785d47b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>ignore</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>aaf0babf44da59cacfb86964a0b41160</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>peek</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>ab4271dc53bd56420f4c366fd9e71b29</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>read</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>172f8a139043eb22d9e8969b42bed0aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>readsome</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>aed06835175d141729f902e5c6502c38</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>putback</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>e5418adbd5d88ec818cd5ec22fc0f68b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>unget</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>711bd36401175a6661d5d6cee43687ad</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>sync</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>79d895a1769ed3b910c2738d9a02a766</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>tellg</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>0f138f41642468e395bc78427c31bc79</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>seekg</name>
      <anchorfile>classdetection_1_1detection_lib_1_1istream.html</anchorfile>
      <anchor>240bedc1b79f41991dc1fcd08738c144</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::iostream</name>
    <filename>classdetection_1_1detection_lib_1_1iostream.html</filename>
    <base>detection::detectionLib::istream</base>
    <base>detection::detectionLib::ostream</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1iostream.html</anchorfile>
      <anchor>6c7199363d9fb78e15385d3444e102b0</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::floatArray</name>
    <filename>classdetection_1_1detection_lib_1_1float_array.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1float_array.html</anchorfile>
      <anchor>f1d96d2c2b197b175ec7c7aa10edc1da</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__getitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1float_array.html</anchorfile>
      <anchor>27d61e5e8973469c4e08ff661e6ec7a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__setitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1float_array.html</anchorfile>
      <anchor>e73d88e4271b02e99117210edf1ee0f4</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>cast</name>
      <anchorfile>classdetection_1_1detection_lib_1_1float_array.html</anchorfile>
      <anchor>cae3d126abdf09bc40b2562ff2fbded5</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>frompointer</name>
      <anchorfile>classdetection_1_1detection_lib_1_1float_array.html</anchorfile>
      <anchor>2483cd54b064e9c28a111921aa9bcc70</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::doubleArray</name>
    <filename>classdetection_1_1detection_lib_1_1double_array.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1double_array.html</anchorfile>
      <anchor>fee49411cd70c33dc7c8b435d20f70c6</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__getitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1double_array.html</anchorfile>
      <anchor>ab30bb2e8a6f086390a3d72a0b78e824</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__setitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1double_array.html</anchorfile>
      <anchor>9952edf41ae3d109ff48d63e2cc3aa12</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>cast</name>
      <anchorfile>classdetection_1_1detection_lib_1_1double_array.html</anchorfile>
      <anchor>64175d6a74d14df8054609695ec0331e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>frompointer</name>
      <anchorfile>classdetection_1_1detection_lib_1_1double_array.html</anchorfile>
      <anchor>c5e5cdb1cd493dadb0c7f478f71c1e18</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::Peak</name>
    <filename>classdetection_1_1detection_lib_1_1_peak.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak.html</anchorfile>
      <anchor>de0155d62f8f25a836706294c2f895b7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getId</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak.html</anchorfile>
      <anchor>c6fcf697c5f8567d4147c3fdb995623d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getIx</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak.html</anchorfile>
      <anchor>b31b8f11691ba21208b95042b82c1fc8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getIy</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak.html</anchorfile>
      <anchor>93a25819c7cb7ffbf4e13534c6db09ea</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getFx</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak.html</anchorfile>
      <anchor>e8c16d2a24c6ddc9c5613ed50c0606d6</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getFy</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak.html</anchorfile>
      <anchor>40d90f37a40db73bfca60b3fc98528e4</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>toString</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak.html</anchorfile>
      <anchor>6fa661c1a4d808ef8311277fe0a919c1</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::Span</name>
    <filename>classdetection_1_1detection_lib_1_1_span.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span.html</anchorfile>
      <anchor>e02d27d993a91b9c22e7b0d71f94dbea</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getX0</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span.html</anchorfile>
      <anchor>dfe487e2c7d73008d673e33085892a8c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getX1</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span.html</anchorfile>
      <anchor>45786f958af75292727d6dfbc68fa7eb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getY</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span.html</anchorfile>
      <anchor>c31485990dd7431f73b82e11d396dbc9</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>toString</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span.html</anchorfile>
      <anchor>a9e62ba55fd40194fa540d2807fd60d0</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>compareByYX</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span.html</anchorfile>
      <anchor>2f280d3588347dda67098d8112fac4f6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::Footprint</name>
    <filename>classdetection_1_1detection_lib_1_1_footprint.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>1b52c7a7909f53bb71805a2e065c8506</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getId</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>675c6fd91e4fdb5385de74349f6dd740</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getSpans</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>bc447a4bc4e183ba1ab6a86b12cdcfcd</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getPeaks</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>fae52469aba4f944bb4dd3bbdbc3b6da</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getNpix</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>a2b75c0a7692cbf147837d897239309a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>addSpan</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>92243cdedf40dae2839f23b2dc1156b3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getBBox</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>482a1dfaf6c60ee4d2bc9cb1170a0bb7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getRegion</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>c118f919aa0bf8cf227b39f46648750e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>normalize</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>5ca3281e415dc839cb0b4b83dd91a3b9</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>setNpix</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>e06e46ffe7749f8f35ff84ea8bcf0214</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>setBBox</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>d1aa81736091c4d294f452cfc67af92e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>insertIntoImage</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint.html</anchorfile>
      <anchor>fb7737cfecf531034515575e72b489a5</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::PeakPtrT</name>
    <filename>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>3a548040860fedc74a98bea9ab528bee</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__deref__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>ce0e0f257c725bd03a4ecf0a55a08729</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>use_count</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>6efa2ebb9649401037aafb6f86e3660c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>get</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>8c11ccea7e975b8add02290e6bc3fdee</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getId</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>336d343a4621c6c5fd4261e820fe8a93</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getIx</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>a1537fab999f821981b8acdc64145c45</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getIy</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>27adc462e77ad5a7cb3fdc2157985673</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getFx</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>b99bbe30a4fd95a632168143e41898db</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getFy</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>f4052c9cfbc8c6ac4ee33ba4a2280148</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>toString</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_ptr_t.html</anchorfile>
      <anchor>8696fa4fc2324c418351f9f259dafb2a</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::PeakContainerT</name>
    <filename>classdetection_1_1detection_lib_1_1_peak_container_t.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>iterator</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>e226b7dd040a7852c866ef3c882753f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__iter__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>980e0609c15bb65671bbb4e14323655e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__nonzero__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>9e95ac5fe6a97bbb8dfcd4761ca43da4</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__len__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>4eaddc87ab6b88ac88dae210072b7e4d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>ad6be73ea8ff769bef9f02d5464dedf0</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__getslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>1af84592cdbadfc72911fa6ad42142e8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__setslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>0076fe410896f4a4bec0355ff4421909</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__delslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>6254cf262f69b1c4608ac5af3cf756a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__delitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>6501a429130b34a910d4bf60ca2bce15</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__getitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>c7e789cae4901cacecaee9510fe12d70</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__setitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>3e0791c1aa97f5fe3d3074de65982e17</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>append</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>598dbba5499e4641f7b9882b2d55dc31</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>empty</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>da0ca6368b79a6151535247051523366</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>size</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>361ec07fc30373987eca1b883345629a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>clear</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>1ae5acf03810e35a94822ed9464b0b51</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>swap</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>c89384e4dd5134c5de1f6f0c06a197ef</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>get_allocator</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>e453083198766af407007260d3422b2f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>begin</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>cbeee382b51197c07ccd5dc702cc2c3c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>end</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>c0cb4269d99ae2bc13e688a2253479b8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>rbegin</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>48d2f1f9eb7c96a8a76dbf0305a35155</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>rend</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>d1884e141af5826dec5d035635712526</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop_back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>681b59ec5488f26056299ed1b3ac4142</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>erase</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>627eb5ceb569d57c4984d18a1620520f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>a56624dfdabb9a2606e94db511721258</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>push_back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>0f5443a7ce15d769996593a5eb560308</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>19fd696b3f630cbb201eb44125e8e692</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>9a312bcaa29ed6143d5da7ffd39db7f4</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>assign</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>a0f649d2969af6a5e91948ae27f76e07</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>resize</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>8435c9b95d5e1cce11d812b381ec8425</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>insert</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>1ca75f9b2257aa23b1e2bd437d5abaf2</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop_front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>60b8fcc68932fa40018580d663a81967</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>push_front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>0460151d826d228e489a93cafb589657</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>reverse</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_peak_container_t.html</anchorfile>
      <anchor>c76a7362c174054f1d72b6533d7c9e94</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::SpanPtrT</name>
    <filename>classdetection_1_1detection_lib_1_1_span_ptr_t.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>9aeb014454600be61b099e75bd4f1a77</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__deref__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>8299c7279f68c360bcbf4393e174e3e7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>use_count</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>35d9d85bf5c0ef442e380486d3df540e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>get</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>9afa9817581502e37d07d6741d3b7387</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getX0</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>004d93893e4277651d84f5ccd26963a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getX1</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>814265ef634d4b8294fa202f6c3117b7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getY</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>368a1469b393ace312a2085f27588715</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>toString</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>d9f8a153a32f444985ea771e627f8df9</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>compareByYX</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_ptr_t.html</anchorfile>
      <anchor>c9f0ca62b66e4c5740fd9960985ff466</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::SpanContainerT</name>
    <filename>classdetection_1_1detection_lib_1_1_span_container_t.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>iterator</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>8ae7961b00ddb71ec9c94c1569a69909</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__iter__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>14f818f0c71df0ace4d60c5722920734</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__nonzero__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>e6a761d8cab984f9af4ee108c6c6834a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__len__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>af98a93fc5cfecaba47037ed86e65912</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>d135dbfbe95508a909130f5cd69834a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__getslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>33329f0244b37fdda5c7703829dd06b1</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__setslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>c1a5a50d066f1c8ece54da817284c837</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__delslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>0271035fd46b67df9c511e30e835b506</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__delitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>b86cdd84fce728ce3e064b145c222ed8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__getitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>f0c2adafbd9cb0c8ac347be9f78bbfeb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__setitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>97a08684e5028f4c27bc3a776194836c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>append</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>2b19d3e4e0a0119212d1a9344ae3f155</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>empty</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>14c9db2914b799706d3426981eaa153d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>size</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>89665c9807733c55560f6f3f4760bc73</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>clear</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>988faa13cc4dd82f2fc5dafd876b4d3b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>swap</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>b6cfafb154622faa93e1d01a3efc6217</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>get_allocator</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>91007faa7b709ae5d2e0f71e95a8dc6f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>begin</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>dec2812862b6a12059398291104a891d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>end</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>c87c9995955c65073e4195401e605e5f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>rbegin</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>b0e042d8b0e33468be71ee1367e293ce</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>rend</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>0e94be871b48b8b0443e0be43e66575a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop_back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>5149f968eba92403449a96bf77fdc05f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>erase</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>ebb3da3e6173264fd37171bd4afe5577</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>41825f232e2b2d07c59cf7feebef8aa2</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>push_back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>11e4d9f5f820c1a3710bfb52e116ef0a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>a770a8dab2e41f4e0588dd5f8f53cc10</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>59c7307d3f62927d3ef8ee8068a7043b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>assign</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>450e89980140bfe1e49666fc0e897b22</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>resize</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>f263197c641a73b868e900323ac5fcd5</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>insert</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>6944188e1015b16ae50721eb6fba686c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop_front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>715e6fc9cf4a5fb81c407877e5a16c08</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>push_front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>13bbd86782c9fa58cce4867c48889ed1</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>reverse</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_span_container_t.html</anchorfile>
      <anchor>0c97f8289f7d24af92254d1e8343bb63</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::FootprintPtrT</name>
    <filename>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>356e145303d64f44686c42a99faeb1ae</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__deref__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>b6deea52c3724f3ca67890fad5d7141f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>use_count</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>b9bd8f6dfe4bb60734c93f3a9b407ceb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>get</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>9d3c37dae77d56eb4c43f7e45f2f6cbd</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getId</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>1fe46ccc9f5935bf535b58e502bbb849</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getSpans</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>2dde9917581db54a4db227d3008c507b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getPeaks</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>ffa767c58847071b0f28641953c166df</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getNpix</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>d3af0e968fe646085910cc5ca232b1a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>addSpan</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>8feade760dde5b5f5762d558fb3789b7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getBBox</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>2658af868375a8b8c09c4376fcf6be70</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getRegion</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>c5bf34e386ecd18974c152e3e341c4e7</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>normalize</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>12be5773ecb1ca075bc62aed0106760a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>setNpix</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>4547726e46af9d62ee4ce400d7426cb6</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>setBBox</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>8d6044101a2491cc4905c84a76431be1</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>insertIntoImage</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_ptr_t.html</anchorfile>
      <anchor>35ad5eae7827dd3d4d5fb3fb131443e2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::FootprintContainerT</name>
    <filename>classdetection_1_1detection_lib_1_1_footprint_container_t.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>iterator</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>3395c548f1f182487a7e495688aff72d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__iter__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>3fc86a3986d8066d6de4b77ee7c41f8c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__nonzero__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>baba281fec9c244634c1b11d17b305d8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__len__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>b0300da7ace119c3102d2b6c64e5c649</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>eeffb48d043887e8d3f0293b5f951df3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__getslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>4729d915678475e7df5ebe4b2c49bc13</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__setslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>667bb0692374ee8f55f3617a0863852b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__delslice__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>eec5c2d113d5c835b01fae8db27f77aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__delitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>0b86cf7ea953131eeb247ba671f56ee2</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__getitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>047e812f0ef0d380845f31a8788566c3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__setitem__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>daa7b85539cc4ac1b0c9048f66b4de1c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>append</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>d5da8c2ce95a180ddaf0073aafa2dc4f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>empty</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>637bd68f04339111ad74810a948f94cf</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>size</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>d5e1b35c959654d15a86726cb67b2064</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>clear</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>c65905cb7c31f75f6c7d5ba638ebb163</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>swap</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>deb07f1612306021bfbb5f623864ff10</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>get_allocator</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>cedc237f9ffbe101d1bf2b79b93dae7b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>begin</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>efc0c304669180e349c69c40dd658ea2</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>end</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>a71a434318f049323687388a966902fa</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>rbegin</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>6ff2d91809b5418bfbf4fe8830b19003</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>rend</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>fcac5f8dd048a87991aabc7c7564f984</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop_back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>aeb9720a2c4b82618d071d10a6276b35</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>erase</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>de986531acfd6606e4b75db37c6da8df</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>6a371b19496f1b7da0dab6acc87a2da8</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>push_back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>fc975528e2af430f0fcf9202483cd365</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>4bebecdff94d4d138046566535b34f2f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>back</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>eb461953ad165856a8223ea4e9b4b9de</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>assign</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>6913bbd1c681459d4359bca3e2400789</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>resize</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>0c58445cb2e71f5c9216719aa67e1a23</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>insert</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>b635a158990c9cdf80243c83d176a16c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>pop_front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>7f4ec6ebaf0f07974ee6d1302c4907cd</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>push_front</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>ec783ed209159b6143f972388a0044b4</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>reverse</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_footprint_container_t.html</anchorfile>
      <anchor>707b527278299a67dd7130352b0a433f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>detection::detectionLib::DetectionSetD</name>
    <filename>classdetection_1_1detection_lib_1_1_detection_set_d.html</filename>
    <base>detection::detectionLib::_object</base>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_detection_set_d.html</anchorfile>
      <anchor>f9b8029451d134220c6301cb0553f11d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getFootprints</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_detection_set_d.html</anchorfile>
      <anchor>7633e94c2adb5955517386277e8b8d9f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>getRegion</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_detection_set_d.html</anchorfile>
      <anchor>e220d479bd9d9836620962287605e90c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>insertIntoImage</name>
      <anchorfile>classdetection_1_1detection_lib_1_1_detection_set_d.html</anchorfile>
      <anchor>48761cc07f17b227cd6a31c487357404</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>Footprint_1</name>
    <filename>namespace_footprint__1.html</filename>
    <class kind="class">Footprint_1::FootprintTestCase</class>
    <class kind="class">Footprint_1::DetectionSetTestCase</class>
    <member kind="function">
      <type>def</type>
      <name>toString</name>
      <anchorfile>namespace_footprint__1.html</anchorfile>
      <anchor>e87600ddb5012a46c4743eeb6e02ca30</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>suite</name>
      <anchorfile>namespace_footprint__1.html</anchorfile>
      <anchor>6f515daf49881e24bf6e1d6e91c38d12</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Footprint_1::FootprintTestCase</name>
    <filename>class_footprint__1_1_1_footprint_test_case.html</filename>
    <member kind="function">
      <type>def</type>
      <name>setUp</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>9bc7b947bd6e88effd59edec2164d62c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>tearDown</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>d2bfd6ec813219b5d63e8d82979d2efb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testToString</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>4eb1fd58931f981bf1108c15bab8a50c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testBbox</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>aeae615af8e98bc8e2775ca4149af4cc</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testGC</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>38b2242596d39471d553b5c7eb263595</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testId</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>b8c4e125f9eee46657a8f2b389090050</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testAddSpans</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>4a602c4a1525da213e7155c58374c496</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testBbox</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>aeae615af8e98bc8e2775ca4149af4cc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type></type>
      <name>foot</name>
      <anchorfile>class_footprint__1_1_1_footprint_test_case.html</anchorfile>
      <anchor>33b86bc914ea5ccc824a15cb899575fd</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Footprint_1::DetectionSetTestCase</name>
    <filename>class_footprint__1_1_1_detection_set_test_case.html</filename>
    <member kind="function">
      <type>def</type>
      <name>setUp</name>
      <anchorfile>class_footprint__1_1_1_detection_set_test_case.html</anchorfile>
      <anchor>920d6aa0425257ab2381235e65c61920</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type></type>
      <name>ms</name>
      <anchorfile>class_footprint__1_1_1_detection_set_test_case.html</anchorfile>
      <anchor>4199e3bdf842f6146d6931476d41aa7d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type></type>
      <name>objects</name>
      <anchorfile>class_footprint__1_1_1_detection_set_test_case.html</anchorfile>
      <anchor>78d8ad044c4e7de77ecca5110e612af2</anchor>
      <arglist></arglist>
    </member>
    <class kind="class">Footprint_1::DetectionSetTestCase::Object</class>
  </compound>
  <compound kind="class">
    <name>Footprint_1::DetectionSetTestCase::Object</name>
    <filename>class_footprint__1_1_1_detection_set_test_case_1_1_object.html</filename>
    <member kind="function">
      <type>def</type>
      <name>__init__</name>
      <anchorfile>class_footprint__1_1_1_detection_set_test_case_1_1_object.html</anchorfile>
      <anchor>adeb2dc6447bf93bd6ea4b1aacb3158e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>insert</name>
      <anchorfile>class_footprint__1_1_1_detection_set_test_case_1_1_object.html</anchorfile>
      <anchor>db133bb865b6116ff08c39abb1a94bc0</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>__eq__</name>
      <anchorfile>class_footprint__1_1_1_detection_set_test_case_1_1_object.html</anchorfile>
      <anchor>b26d23ba635fcdff76f9933bef17384c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type></type>
      <name>val</name>
      <anchorfile>class_footprint__1_1_1_detection_set_test_case_1_1_object.html</anchorfile>
      <anchor>05932bea9e2621b8c6e814aca5e327f0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type></type>
      <name>spans</name>
      <anchorfile>class_footprint__1_1_1_detection_set_test_case_1_1_object.html</anchorfile>
      <anchor>b29ed28c9a855711e65fe3bf2d8a95d3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>lsst</name>
    <filename>namespacelsst.html</filename>
    <namespace>lsst::detection</namespace>
  </compound>
  <compound kind="namespace">
    <name>lsst::detection</name>
    <filename>namespacelsst_1_1detection.html</filename>
    <class kind="class">lsst::detection::Span</class>
    <class kind="class">lsst::detection::Footprint</class>
    <class kind="class">lsst::detection::DetectionSet</class>
    <class kind="class">lsst::detection::Peak</class>
    <member kind="typedef">
      <type>boost::shared_ptr&lt; Span &gt;</type>
      <name>SpanPtrT</name>
      <anchorfile>namespacelsst_1_1detection.html</anchorfile>
      <anchor>6e29620cc9b0b82f2d92e48c32abee56</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>boost::shared_ptr&lt; Footprint &gt;</type>
      <name>FootprintPtrT</name>
      <anchorfile>namespacelsst_1_1detection.html</anchorfile>
      <anchor>40ac147f49a4de7be6516678a199c628</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>boost::shared_ptr&lt; Peak &gt;</type>
      <name>PeakPtrT</name>
      <anchorfile>namespacelsst_1_1detection.html</anchorfile>
      <anchor>a58cbaf913c14cbe7b6324adff491324</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>lsst::detection::Span</name>
    <filename>classlsst_1_1detection_1_1_span.html</filename>
    <member kind="typedef">
      <type>boost::shared_ptr&lt; Span &gt;</type>
      <name>SpanPtrT</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>b99179fce2d8c7960a12261c4572d8a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Span</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>b570970601618886c850189926807dda</anchor>
      <arglist>(int y, int x0, int x1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Span</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>87c0d4c88c38733989148edda9258fbb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getX0</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>39928c78429386bb4dbf04355f63fae1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getX1</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>4d6c669db9be31f6514cdc273c177ada</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getY</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>6f6350279d426c158a923a9cbfb8971d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>toString</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>6de6e9bb2ad88a886b8079c1ed813850</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>compareByYX</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>a67b901ea03a9bc14aedb4b0dd3adb53</anchor>
      <arglist>(const void **a, const void **b)</arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>Footprint</name>
      <anchorfile>classlsst_1_1detection_1_1_span.html</anchorfile>
      <anchor>ccd9c9c23795c28b8bca27d261069dd5</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>lsst::detection::Footprint</name>
    <filename>classlsst_1_1detection_1_1_footprint.html</filename>
    <member kind="function">
      <type></type>
      <name>Footprint</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>50f028a3af55fd5a107458642a036184</anchor>
      <arglist>(int nspan=0, const vw::BBox2i region=vw::BBox2i(0, 0, 0, 0))</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Footprint</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>d3999f8b5111579b300f97fbc3c51f06</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getId</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>249d992b0d276ead4e58ee3e667e3040</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; SpanPtrT &gt; &amp;</type>
      <name>getSpans</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>cab337170346fcad0040e1f4ab86e46d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; PeakPtrT &gt; &amp;</type>
      <name>getPeaks</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>3ca9e8ee9d5dd9e7ee806fe996a354a9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getNpix</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>5458a08eac9a494cd98017c2f14ecd95</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Span &amp;</type>
      <name>addSpan</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>a4e3f07f0cff77602504d250886724f1</anchor>
      <arglist>(const int y, const int x0, const int x1)</arglist>
    </member>
    <member kind="function">
      <type>const vw::BBox2i &amp;</type>
      <name>getBBox</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>3d127393c9b7ba2febf25125c7383b77</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const vw::BBox2i &amp;</type>
      <name>getRegion</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>ced21e3ea779865992bbf6777a8fcfca</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>normalize</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>31b333a9f3bb95365223667438a3b5fd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>setNpix</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>ec9cda3a9b664d610fc241294a211fcd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setBBox</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>56b89146adbe2d5225e3eaae6625f13a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>insertIntoImage</name>
      <anchorfile>classlsst_1_1detection_1_1_footprint.html</anchorfile>
      <anchor>004a07b793be19a960cbaaed54368ca5</anchor>
      <arglist>(lsst::fw::Image&lt; int &gt; &amp;idImage, const int id) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>lsst::detection::DetectionSet</name>
    <filename>classlsst_1_1detection_1_1_detection_set.html</filename>
    <templarg>ImagePixelT</templarg>
    <templarg>MaskPixelT</templarg>
    <member kind="function">
      <type></type>
      <name>DetectionSet</name>
      <anchorfile>classlsst_1_1detection_1_1_detection_set.html</anchorfile>
      <anchor>139a30e487a187bdf3dc1dd485cd6807</anchor>
      <arglist>(const lsst::fw::MaskedImage&lt; ImagePixelT, MaskPixelT &gt; &amp;img, const float threshold, const std::string &amp;planeName=&quot;&quot;, const int npixMin=1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DetectionSet</name>
      <anchorfile>classlsst_1_1detection_1_1_detection_set.html</anchorfile>
      <anchor>c702bda46fbea389fa5ba358167e694d</anchor>
      <arglist>(const lsst::fw::MaskedImage&lt; ImagePixelT, MaskPixelT &gt; &amp;img, const float threshold, int x, int y, const vector&lt; Peak &gt; *peaks=NULL)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DetectionSet</name>
      <anchorfile>classlsst_1_1detection_1_1_detection_set.html</anchorfile>
      <anchor>69d3d4776197037815d88d21b46e8b88</anchor>
      <arglist>(const DetectionSet &amp;set, int r=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DetectionSet</name>
      <anchorfile>classlsst_1_1detection_1_1_detection_set.html</anchorfile>
      <anchor>29e7b9e9fa7616e173abd27b53619ee5</anchor>
      <arglist>(const DetectionSet &amp;footprints1, const DetectionSet &amp;footprints2, const int includePeaks)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~DetectionSet</name>
      <anchorfile>classlsst_1_1detection_1_1_detection_set.html</anchorfile>
      <anchor>4bfe480751218e1c813a780f23b76fd6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; FootprintPtrT &gt; &amp;</type>
      <name>getFootprints</name>
      <anchorfile>classlsst_1_1detection_1_1_detection_set.html</anchorfile>
      <anchor>ed5c6567d196ca0c058adc68792fb3b5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const vw::BBox2i &amp;</type>
      <name>getRegion</name>
      <anchorfile>classlsst_1_1detection_1_1_detection_set.html</anchorfile>
      <anchor>eddd1ef80907321dc2dbcf43bfee7d0f</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>boost::shared_ptr&lt; lsst::fw::Image&lt; int &gt; &gt;</type>
      <name>insertIntoImage</name>
      <anchorfile>classlsst_1_1detection_1_1_detection_set.html</anchorfile>
      <anchor>d30feb82a576d78d955f07500faff3c3</anchor>
      <arglist>(const bool relativeIDs)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>lsst::detection::Peak</name>
    <filename>classlsst_1_1detection_1_1_peak.html</filename>
    <member kind="function">
      <type></type>
      <name>Peak</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>ba389d775612a9763c6bfcee6b263dd4</anchor>
      <arglist>(int ix, int iy)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Peak</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>feb5e200b4ae546c08fae79ad3b019e6</anchor>
      <arglist>(float fx=NAN, float fy=NAN)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Peak</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>83155f025a81ae903330d99091e22ef4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getId</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>6a2b09ce4c07f418b2b8ef0487857689</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getIx</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>12e1972bf12d7ca488c9deefe5910251</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getIy</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>6d6407dfa89079dddf844199c4b986e0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>float</type>
      <name>getFx</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>7e369f3039c02e50ed0f4bb7895e26e0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>float</type>
      <name>getFy</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>9ff1a2d563debf9a165f92db96ba7160</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>toString</name>
      <anchorfile>classlsst_1_1detection_1_1_peak.html</anchorfile>
      <anchor>9f0a309b72a2dc706f71978360275763</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>lsst::fw</name>
    <filename>namespacelsst_1_1fw.html</filename>
  </compound>
  <compound kind="namespace">
    <name>Peak_1</name>
    <filename>namespace_peak__1.html</filename>
    <class kind="class">Peak_1::PeakTestCase</class>
    <member kind="function">
      <type>def</type>
      <name>suite</name>
      <anchorfile>namespace_peak__1.html</anchorfile>
      <anchor>f4d4f30e1a73fde45dd3e090db2af780</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Peak_1::PeakTestCase</name>
    <filename>class_peak__1_1_1_peak_test_case.html</filename>
    <member kind="function">
      <type>def</type>
      <name>setUp</name>
      <anchorfile>class_peak__1_1_1_peak_test_case.html</anchorfile>
      <anchor>b74b06b1df63db2d79d4ac277c0edc7a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>tearDown</name>
      <anchorfile>class_peak__1_1_1_peak_test_case.html</anchorfile>
      <anchor>089bf70878f9fc54d921903bf8e687fd</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testGC</name>
      <anchorfile>class_peak__1_1_1_peak_test_case.html</anchorfile>
      <anchor>db8ac90c8be8eb2c272f3775f684b923</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testToString</name>
      <anchorfile>class_peak__1_1_1_peak_test_case.html</anchorfile>
      <anchor>b96eeb89e303dd725e64de07179ed4ff</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testCentroidInt</name>
      <anchorfile>class_peak__1_1_1_peak_test_case.html</anchorfile>
      <anchor>444c48979f3c3b5bd16811938c42785e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testCentroidFloat</name>
      <anchorfile>class_peak__1_1_1_peak_test_case.html</anchorfile>
      <anchor>15ee07797d5dbc5b460081f4e18b064c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>def</type>
      <name>testId</name>
      <anchorfile>class_peak__1_1_1_peak_test_case.html</anchorfile>
      <anchor>2556a0d9553669405e97bb2e36e413e5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type></type>
      <name>peak</name>
      <anchorfile>class_peak__1_1_1_peak_test_case.html</anchorfile>
      <anchor>60dfee6d59e370fe5352586cac5bad46</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="dir">
    <name>/Users/rhl/LSST/detection/python/lsst/detection/</name>
    <path>/Users/rhl/LSST/detection/python/lsst/detection/</path>
    <filename>dir_4f0f03dfc4b1954dbddc23b10ce5d068.html</filename>
    <file>__init__.py</file>
    <file>detectionLib.py</file>
  </compound>
  <compound kind="dir">
    <name>/Users/rhl/LSST/detection/include/lsst/detection/</name>
    <path>/Users/rhl/LSST/detection/include/lsst/detection/</path>
    <filename>dir_21d93ba57b424a3a8060e750e66a8a23.html</filename>
    <file>Footprint.cc</file>
    <file>Footprint.h</file>
    <file>Peak.h</file>
  </compound>
  <compound kind="dir">
    <name>/Users/rhl/LSST/detection/include/</name>
    <path>/Users/rhl/LSST/detection/include/</path>
    <filename>dir_1686431c10714583d0a6b5a931806ce7.html</filename>
    <dir>/Users/rhl/LSST/detection/include/lsst/</dir>
  </compound>
  <compound kind="dir">
    <name>/Users/rhl/LSST/detection/python/lsst/</name>
    <path>/Users/rhl/LSST/detection/python/lsst/</path>
    <filename>dir_1fd26d1f5b7d7394ec39c1db77bbd206.html</filename>
    <dir>/Users/rhl/LSST/detection/python/lsst/detection/</dir>
  </compound>
  <compound kind="dir">
    <name>/Users/rhl/LSST/detection/include/lsst/</name>
    <path>/Users/rhl/LSST/detection/include/lsst/</path>
    <filename>dir_11864e12d97a441f19f01711623d00d7.html</filename>
    <dir>/Users/rhl/LSST/detection/include/lsst/detection/</dir>
  </compound>
  <compound kind="dir">
    <name>/Users/rhl/LSST/detection/python/</name>
    <path>/Users/rhl/LSST/detection/python/</path>
    <filename>dir_b8fac709bea3b176534c87775b5847b0.html</filename>
    <dir>/Users/rhl/LSST/detection/python/lsst/</dir>
  </compound>
  <compound kind="dir">
    <name>/Users/rhl/LSST/detection/src/</name>
    <path>/Users/rhl/LSST/detection/src/</path>
    <filename>dir_43fb887e3d3736c6dcc591ead1d43e9d.html</filename>
    <file>Footprint.cc</file>
    <file>Peak.cc</file>
  </compound>
  <compound kind="dir">
    <name>/Users/rhl/LSST/detection/tests/</name>
    <path>/Users/rhl/LSST/detection/tests/</path>
    <filename>dir_63ec2c5fea51f9d88913ec001cbae627.html</filename>
    <file>Footprint_1.cc</file>
    <file>Footprint_1.py</file>
    <file>Peak_1.py</file>
  </compound>
</tagfile>
