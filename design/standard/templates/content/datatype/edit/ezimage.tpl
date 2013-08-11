{ezcss_require( array( 'novenimagecropper.css', 'jquery-ui-novenimagecropper.css', 'jquery.Jcrop.css' ) )}
{ezscript_require( array( 'ezjsc::jquery', 'ezjsc::jqueryio', 'jquery-ui-novenimagecropper.min.js', 'jquery.Jcrop.min.js', 'ajaxupload.js', 'novenimagecropper.js' ) )}

{default attribute_base='ContentObjectAttribute'}
{let attribute_content=$attribute.content}

{* Current image. *}
<div class="block">
<label>{'Current image'|i18n( 'design/standard/content/datatype' )}:</label>

<div id="imageinfos_{$attribute.id}">
	{section show=$attribute_content.original.is_valid}
	
	<table class="list" cellspacing="0">
		<tr>
		    <th class="tight">{'Preview'|i18n( 'design/standard/content/datatype' )}</th>
		    <th>{'Filename'|i18n( 'design/standard/content/datatype' )}</th>
		    <th>{'MIME type'|i18n( 'design/standard/content/datatype' )}</th>
		    <th>{'Size'|i18n( 'design/standard/content/datatype' )}</th>
		</tr>
		<tr>
		    <td class="imageinfos_image">{attribute_view_gui image_class=ezini( 'ImageSettings', 'DefaultEditAlias', 'content.ini' ) attribute=$attribute}</td>
		    <td class="imageinfos_filename">{$attribute.content.original.original_filename|wash( xhtml )}</td>
		    <td class="imageinfos_mimetype">{$attribute.content.original.mime_type|wash( xhtml )}</td>
		    <td class="imageinfos_filesize">{$attribute.content.original.filesize|si( byte )}</td>
		</tr>
	</table>
	{section-else}
	<p>{'There is no image file.'|i18n( 'design/standard/content/datatype' )}</p>
	{/section}
</div>

{section show=$attribute_content.original.is_valid}
<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_delete_image]" id="delete_image_{$attribute.id}" value="{'Remove image'|i18n( 'design/standard/content/datatype' )}" />
{section-else}
<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_delete_image]" id="delete_image_{$attribute.id}" value="{'Remove image'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />
{/section}
{* Image crop button *}
<input type="button" class="button{if $attribute_content.original.is_valid|not}-disabled{/if} novenimagecropper_trigger" id="novimagecroptrigger_{$attribute.id}_{$attribute.version}_{$attribute.contentobject_id}" value="{'Crop image'|i18n('extension/novenimagecropper')}"{if $attribute_content.original.is_valid|not} disabled="disabled"{/if} />
</div>

{* New image file for upload. *}
<div class="block">
    <div id="novenimageloading_{$attribute.id}" style="display:none;"><img src={"noven-image-ajax-loader.gif"|ezimage}/></div>
    <div id="novenimagemimetypeerror_{$attribute.id}" class="novenerror" style="display:none;">{"Uploaded file is not a supported image file (PNG/JPG/GIF)"|i18n('extension/novenimagecropper/error')}</div>
    <input type="hidden" name="MAX_FILE_SIZE" value="{$attribute.contentclass_attribute.data_int1|mul( 1024, 1024 )}" />
    <label>{'New image file for upload'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_file" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier} novenimageuploader" name="{$attribute_base}_data_imagename_{$attribute.id}" ez_contentobject_version="{$attribute.version}" ez_contentobject_id="{$attribute.contentobject_id}" type="file" />
</div>

{* Alternative image text. *}
<div class="block">
    <label>{'Alternative image text'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_alttext" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_imagealttext_{$attribute.id}" type="text" value="{$attribute_content.alternative_text|wash(xhtml)}" />
</div>

{* Image cropping dialog *}
<div id="novimagecropdialog_{$attribute.id}" class="novenimagecropdialog" title="{"Image cropping interface"|i18n('extension/novenimagecropper')}">
	<div class="loading"><img src={"noven-image-ajax-loader.gif"|ezimage}/></div>
	<div class="novenimagecropper_mainarea">
		<div id="novimagecroprefarea_{$attribute.id}">
			<div id="novimagecropreference_{$attribute.id}" class="novenimagecropreference novenimagecroparea"></div>
			<div class="novenimagecropper_menu">
				{* Aspect Ration Menu *}
				{def $aAspectRatio = ezini('CropSettings', 'AspectRatio', 'novenimagecropper.ini')}
				
				<label for="novimagecrop_ar_{$attribute.id}"><strong>{"Aspect Ratio"|i18n('extension/novenimagecropper')} :</strong></label>
				<select class="novenimagecropper_aspectratio" id="novimagecrop_ar_{$attribute.id}">
					<option value="0">{"No aspect ratio"|i18n('extension/novenimagecropper')}</option>
					{foreach $aAspectRatio as $label => $ratio}
						
						{def $width = 0
							 $height = 0}
						{if ezini_hasvariable($label, 'Width', 'novenimagecropper.ini')}{set $width = ezini($label, 'Width', 'novenimagecropper.ini')}{/if}
						{if ezini_hasvariable($label, 'Height', 'novenimagecropper.ini')}{set $height = ezini($label, 'Height', 'novenimagecropper.ini')}{/if}
					<option value="{$ratio}" width="{$width}" height="{$height}">{$label}</option>
						{undef $width $height}
					{/foreach}
				</select>
				<p>
					<input type="button" value="{"Preview"|i18n('extension/novenimagecropper')}" class="button novenimagecropper_previewbutton"/>
					<input type="button" value="{"Cancel"|i18n('extension/novenimagecropper')}" class="button novenimagecropper_cancelbutton"/>
				</p>
			</div>
		</div>
		<div id="novimagecroppreviewarea_{$attribute.id}" class="novenimagecroppreviewarea">
			<div id="novimagecroppreview_{$attribute.id}" class="novenimagecroppreview novenimagecroparea"></div>
			<div class="novenimagecropper_menu">
				<p>
					<input type="button" value="{"Save"|i18n('extension/novenimagecropper')}" class="button novenimagecropper_savebutton"/>
					<input type="button" value="{"Back to selection"|i18n('extension/novenimagecropper')}" class="button novenimagecropper_backbutton"/>
				</p>
			</div>
		</div>
	</div>
	
	<div style="clear:both;"></div>
	
	<input type="hidden" name="novimagecrop_{$attribute.id}[attribute]" value="{$attribute.id}"/>
	<input type="hidden" name="novimagecrop_{$attribute.id}[version]" value="{$attribute.version}"/>
	<input type="hidden" name="novimagecrop_{$attribute.id}[objectid]" value="{$attribute.contentobject_id}"/>
	<input type="hidden" name="novimagecrop_{$attribute.id}[x]" value=""/>
	<input type="hidden" name="novimagecrop_{$attribute.id}[y]" value=""/>
	<input type="hidden" name="novimagecrop_{$attribute.id}[w]" value=""/>
	<input type="hidden" name="novimagecrop_{$attribute.id}[h]" value=""/>
</div>

{/let}
{/default}


