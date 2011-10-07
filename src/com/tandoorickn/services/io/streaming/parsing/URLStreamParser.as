package com.tandoorickn.services.io.streaming.parsing
{
	import com.tandoorickn.patterns.media.MediaItem;
	import com.tandoorickn.services.io.streaming.model.MediaProviderType;

	public class URLStreamParser
	{
		public static function getType(url:MediaItem):String
		{
			return MediaProviderType.RTMP;
		}
	}
}