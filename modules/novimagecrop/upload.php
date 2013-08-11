<?php

//
// ## BEGIN COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
// SOFTWARE NAME: Noven Image Cropper
// SOFTWARE RELEASE: 1.1.1
// COPYRIGHT NOTICE: Copyright (C) 2009 - Jerome Vieilledent, Noven.
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of version 2.0  of the GNU General
//   Public License as published by the Free Software Foundation.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of version 2.0 of the GNU General
//   Public License along with this program; if not, write to the Free
//   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//   MA 02110-1301, USA.
//
//
// ## END COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
//

$Module = $Params["Module"];
$http = eZHTTPTool::instance();
$httpFile = eZHTTPFile::fetch( 'imageFile' );

$attributeID = $http->postVariable('AttributeID');
$baseName = $http->postVariable('BaseName');
$contentObjectVersion = $http->postVariable('ContentObjectVersion');
$contentObjectID = $http->postVariable('ContentObjectID');

$imageAttribute = eZContentObjectAttribute::fetch($attributeID, $contentObjectVersion);
$imageHandler = $imageAttribute->content();
$imageHandler->initializeFromHTTPFile($httpFile, '');
$imageHandler->store($imageAttribute);

$Result['pagelayout'] = '';
$Result['content'] = '';

echo 'success';

// Clean exit to avoid debug to display
eZDB::checkTransactionCounter();
eZExecution::cleanExit();