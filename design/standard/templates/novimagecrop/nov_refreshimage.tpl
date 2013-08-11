<table class="list" cellspacing="0">
	<tr>
	    <th class="tight">{'Preview'|i18n( 'design/standard/content/datatype' )}</th>
	    <th>{'Filename'|i18n( 'design/standard/content/datatype' )}</th>
	    <th>{'MIME type'|i18n( 'design/standard/content/datatype' )}</th>
	    <th>{'Size'|i18n( 'design/standard/content/datatype' )}</th>
	</tr>
	{def $defaultAlias = ezini( 'ImageSettings', 'DefaultEditAlias', 'content.ini' )}
	<tr id="imageinfos_{$attribute.id}">
	    <td class="imageinfos_image"><img src={concat($attribute.content[$defaultAlias].url, '?', currentdate())|ezroot} /></td>
	    <td class="imageinfos_filename">{$attribute.content.original.original_filename|wash( xhtml )}</td>
	    <td class="imageinfos_mimetype">{$attribute.content.original.mime_type|wash( xhtml )}</td>
	    <td class="imageinfos_filesize">{$attribute.content.original.filesize|si( byte )}</td>
	</tr>
</table>