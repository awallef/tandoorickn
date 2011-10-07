package com.tandoorickn.services.io.streaming.model
{
	import com.tandoorickn.patterns.media.AbstractMediaProvider;
	import com.tandoorickn.patterns.media.MediaItem;
	import com.tandoorickn.patterns.proxy.AbstractProxy;
	import com.tandoorickn.services.io.streaming.mp.RtmpMP;
	import com.tandoorickn.services.io.streaming.parsing.URLStreamParser;
	
	import flash.display.DisplayObject;
	
	
	public class StreamEngineProxy extends AbstractProxy
	{
		
		public var NAME:String 				= "StreamEngineProxy";
		
		private var _streams				:Array,
					_current				:uint;
		
		public function StreamEngineProxy(proxyName:String=null, data:Object=null)
		{
			if(proxyName != "") StreamEngineProxy.NAME = proxyName;
			super(proxyName, data);
			
			_streams = new Array();
		}
		
		public function preload(mediaItem:MediaItem) : uint
		{
			var id:uint = this.createItem(mediaItem);
			(_streams[id] as AbstractMediaProvider).preload();
			return id;
		}
		
		public function load(mediaItem:MediaItem) : uint
		{
			var id:uint = this.createItem(mediaItem);
			(_streams[id] as AbstractMediaProvider).load();
			_current = id;
			return id;
		}
		
		private function createItem(mediaItem):uint
		{
			var id:uint = _streams.length;
			var type:String = URLStreamParser.getType(mediaItem);
			switch(type)
			{
				case MediaProviderType.RTMP:
					_streams[id] = new RtmpMP(mediaItem);
					break;
			}
				
			return id;
		}
		
		public function play() : void {
			( this._streams[this._current] as AbstractMediaProvider).play();
		}
		public function pause() : void {
			
		}
		public function set seek(value:Number) : void
		{
			( this._streams[this._current] as AbstractMediaProvider).seek = value;
		}
		
		public function get seek():Number
		{
			return ( this._streams[this._current] as AbstractMediaProvider).seek;
		}
		public function stop() : void {
			( this._streams[this._current] as AbstractMediaProvider).stop();
		}
		
		public function mute(value:Boolean) : void {
			( this._streams[this._current] as AbstractMediaProvider).mute(value);
		}
		
		public function get display() : DisplayObject {
			return null;
		}
		public function get provider() : AbstractMediaProvider {
			return  this._streams[this._current] ? ( this._streams[this._current] as AbstractMediaProvider) : null;
		}
		public function get state() : String {
			return ( this._streams[this._current] as AbstractMediaProvider).state;
		}
		/*public function get item() : PlaylistItem {
			return this._item;
		}*/
		public function get position() : Number {
			return 0;
		}
		public function get volume() : Number {
			return 0;
		}
		
		public function set volume(param1:Number) : void {
			
		}
	}
}