===================================
 Noven Image Cropper Documentation
===================================

---------------------------------
 2009 Jerome Vieilledent - Noven
---------------------------------


Introduction
============

This extension adds 2 main new features for the ezimage attributes :
  - **Ajax Upload**. You don't need to publish your content object to preview your uploaded image. Note that this feature is not currently supported on IE6 (works on IE7 and IE8)
  - **Interactive Cropping interface**. A new Crop Image button has been added. Clicking on it will show you an inline popup dialog with an interface to select your crop area. Then preview the render and save it if it suits you !

This extension has been developped on top of ezjscore extension (http://projects.ez.no/ezjscore)


Install
=======

This extension has a dependency on ezjscore extension
(http://projects.ez.no/ezjscore). It **MUST** be properly installed 
Note that this extension is bundled with eZ Publish 4.2 with *ezwebin*

  - Be sure that *ezjscore* has been properly installed and activated
    (NovenImageCropper uses *jQuery* as default framework)
  - Download the compressed file under *extension/* directory and uncompress it.
  - Activate the extension
  - Regenerate the autoload array for the extensions : *php
    bin/php/ezpgenerateautoloads.php -e*
  - Clear the caches
  - Give access to **novimagecrop** module to your contributors


Usage
=====

  - Edit an object which have an *ezimage* attribute
  - Choose a new image for your ezimage attribute. The upload will be done in AJAX (doesn't seem to work on IE6, so you'll have to publish your object)
  - To display the crop interface, clic on the **Crop image** button.
  - Make your crop selection. 
  - You can force an aspect ratio with the **Aspect Ratio** dropdown menu (16/9, 4/3 or none by default).
  - Once your selection is made, click the **Preview** button
  - If the render suits you, click the **Save** button. You can go back to your
    selection by clicking the **Back to selection** button

Note that you can customize the **Aspect Ratio** dropdown menu by making an
override of *novenimagecropper.ini* (see the comments in the file).


Update image attribute externally
=================================

NovenImageCropper embeds a JS callback function *updateImage()* which allows you to update the ezimage attribute externally.
This allows you cross attribute editing.
When called, the function updates the right ezimage attribute and sends a jQuery event on the parent of the image when update process is finished. 
Name of the event is **novimgcrop.image_updated**.
A **cropData** property is added on the jQuery event. It embeds various infos concerning the attribute that has been updated :
  - attributeId
  - contentObjectVersion
  - contentObjectId

To get these infos : 
::
  $('.imageinfos_image').bind('novimgcrop.image_updated', function(event) {
    var attributeData = event.cropData;
    var attributeId = event.attributeId;
    var contentObjectVersion = event.contentObjectVersion;
    var contentObjectId = event.contentObjectId;
  });


Issues
======

Cluster Mode
------------
If you use the cluster mode (*eZDB*), there is an issue on the script
rendering images. Please refer to this ezpublish issue :
http://issues.ez.no/IssueView.php?Id=15459 . Until this issue is not fixed,
you'll have to patch your *index_image_mysql.php* file (or the one matching your cluster backend)

AJAX Upload and IE6
-------------------
Ajax upload is not currently supported on IE6 due to a limitation on the Ajax Upload library.
So you'll have to select your file and, publish your object (as you should be used to), 
and then re-edit your object to be able to crop your brand new uploaded image


Feel free to report any issue or feedback on the forum : http://projects.ez.no/novenimagecropper/forum

