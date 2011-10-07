package com.tandoorickn.patterns.media
{
	public class MediaItemLevel
	{
		public var file:String = "";
		public var bitrate:Number = 0;
		public var width:Number = 0;
		public var streamer:String = "";
		public var badStream:Boolean = false;
		
		public function MediaItemLevel(file:String, bitrate:Number, width:Number, streamer:String = "") {
			this.file = file;
			this.streamer = streamer;
			this.bitrate = bitrate;
			this.width = width;
			return;
		}
	}
}