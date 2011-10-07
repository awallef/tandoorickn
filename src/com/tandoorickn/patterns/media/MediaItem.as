package com.tandoorickn.patterns.media
{
	public class MediaItem
	{
		
		public var currentLevel:uint;
		
		private var _level:Array;
		
		public function MediaItem(file:String, bitrate:Number, width:Number, streamer:String = "") {
			
			_level = new Array();
			currentLevel = 0;
			_level[0] = new MediaItemLevel(file, bitrate, width, streamer);
			
		}
		
		public function addLevel(file:String, bitrate:Number, width:Number, streamer:String = "") {
			
			_level[_level.length] = new MediaItemLevel(file, bitrate, width, streamer);
			_level.sortOn( "bitrate", Array.NUMERIC | Array.DESCENDING );
		}
		
		public function get level():MediaItemLevel
		{
			return _level;
		}
		
		public function get levelLength():uint
		{
			return _level.length;
		}
		
		public function get file():String
		{
			return (_level[currentLevel] as MediaItemLevel).file;
		}
		
		public function get bitrate():Number
		{
			return (_level[currentLevel] as MediaItemLevel).bitrate;
		}
		
		public function get width():Number
		{
			return (_level[currentLevel] as MediaItemLevel).width;
		}
		
		public function get streamer():String
		{
			return (_level[currentLevel] as MediaItemLevel).streamer;
		}
		
	}
}