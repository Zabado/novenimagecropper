{if is_set($error_message)}
	{$error_message}
{else}
	<img src="{concat($cropPreviewSrc|ezroot('no'), '?', currentdate())}" />
{/if}