package com.tandoorickn.ui.css.core
{
	import flash.display.Sprite;
	
	public class CoreCssSimpleSprite extends Sprite
	{
		protected var 	_w				:Number,
						_h				:Number;
		
		public function CoreCssSimpleSprite()
		{
			super();
		}
		
		override public function get width():Number 		{ return _w; }
		override public function set width(w:Number):void
		{
			_w = w;
		}
		
		override public function get height():Number 		{ return _h; }
		override public function set height(h:Number):void
		{
			_h = h;
		}
	}
}