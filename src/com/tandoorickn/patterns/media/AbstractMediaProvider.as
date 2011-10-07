package com.tandoorickn.patterns.media
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import com.tandoorickn.services.io.streaming.model.MediaProviderState;
	
	public class AbstractMediaProvider extends EventDispatcher
	{
		protected var 	_state				:String,
						_volume				:Number;
		
		public function AbstractMediaProvider(target:IEventDispatcher=null)
		{
			super(target);
			
			_state = MediaProviderState.EMPTY;
			_volume = 1;
		}
		
		public function kill():void
		{
			
		}
		
		public function preload(/*param1:PlaylistItem*/) : uint
		{
			return 0;
		}
		
		public function load(/*param1:PlaylistItem*/) : void
		{
			return 0;
		}
		
		public function play() : void {
			
		}
		
		public function pause() : void {
			
		}
		
		public function set seek(value:Number) : void
		{
			
		}
		
		public function get seek():Number
		{
			return 0;
		}
		public function stop() : void {
			
		}
		
		public function mute(value:Boolean) : void {
			
		}
		
		public function get display():DisplayObject {
			return null;
		}
		
		public function get provider() : String {
			return null;
		}
		
		public function get state() : String {
			return _state;
		}
		
		public function get volume() : Number {
			return _volume;
		}
		
		public function set volume(value:Number) : void {
			_volume = value;
		}
	}
}