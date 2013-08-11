<?php
// SOFTWARE NAME: Noven Image Cropper
// SOFTWARE RELEASE: 1.1.2
// COPYRIGHT NOTICE: Copyright (C) 1999-2009 Noven
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

class novenimagecropperInfo
{
    static function info()
    {
        return array( 'Name' => '<a href="http://projects.ez.no/novenimagecropper" target="_blank">Noven Image Cropper</a>',
                      'Version' => "1.1.2",
        			  'Author'	=> 'Jérôme Vieilledent',
                      'Copyright' => "Copyright © 2009 NOVEN",
                      'License' => "GNU General Public License v2.0",
                      'Includes the following libraries'              => array( 'jQuery' => 'v1.9.1 http://jquery.com',
                                                                              'jQuery UI' => 'v1.10.3 http://jqueryui.com',
                                                                              'jCrop' => 'v0.9.12 http://deepliquid.com/content/Jcrop.html',
                                                                              'Ajax Upload' => 'v3.9 http://valums.com/ajax-upload/',
                                                                              'eZ Components' => 'http://ezcomponents.org/')
                      );
    }
}
?>
