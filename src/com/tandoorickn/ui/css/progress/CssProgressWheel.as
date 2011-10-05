package com.tandoorickn.ui.css.progress
{
	import com.tandoorickn.ui.css.CssSprite;
	import com.tandoorickn.ui.css.core.CoreCssStyle;
	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class CssProgressWheel extends CssSprite
	{
		private var _wheel			:Sprite,
					_points			:uint,
					_corner			:Number,
					_timer			:Timer;
		
		public function CssProgressWheel(id:String=null, classes:Array=null, css:CoreCssStyle=null, overCss:Object=null)
		{
			super(id, classes, css, overCss);
			
			_wheel = new Sprite();
			this.addChild(_wheel);
			_points = 6;
			_corner = 30;
			
			_timer = new Timer(100,0);
			_timer.addEventListener(TimerEvent.TIMER,rotate);
			drawWheel();
		}
		
		public function set corner(value:Number):void
		{
			_corner = value;
			refresh();
		}
		
		public function set points(value:uint):void
		{
			_points = value;
			refresh();
		}
		
		public function start():void
		{
			_timer.start();
		}
		
		public function stop():void
		{
			_timer.stop();
		}
		
		override public function refresh():void
		{
			_wheel.visible = false;
			super.refresh();
			removeWheel();
			drawWheel();
			_wheel.x = ( _w - (_corner / 2) ) / 2;
			_wheel.y = ( _h - (_corner / 2) ) / 2;
			_wheel.visible = true;
		}
		
		public function rotate(e:TimerEvent):void
		{
			_wheel.rotation += 360 *  (1 / (_points + 1 ));
		}
		
		private function removeWheel():void
		{
			for( var i:uint = _wheel.numChildren; i > 0; i-- )
			{
				_wheel.removeChildAt(i - 1);
			}
		}
		
		private function drawWheel():void
		{
			
			var numWheels:uint = _points;
			
			for(var i:uint = 0; i < numWheels + 1; i++)
			{
				var sh:Shape = new Shape();
				var g:Graphics = sh.graphics;
				
				var posAlpha:Number = (2 * Math.PI ) * (i / (numWheels + 1 ));
				
				var posX:Number = Math.sin(posAlpha) * (_corner / 2);
				var posY:Number = Math.cos(posAlpha) * (_corner / 2);
				
				g.beginFill(this.style.color, 1 - (i / numWheels));
				g.drawCircle(posX,posY,7);
				g.endFill();
				
				_wheel.addChild(sh);
				
			}
		}
	}
}