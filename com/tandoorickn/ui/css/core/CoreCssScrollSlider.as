package com.tandoorickn.ui.css.core
{
	import com.tandoorickn.events.ui.css.CssScrollEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class CoreCssScrollSlider extends CoreCssSimpleSprite
	{
		private var		_slider				:Sprite,
						_bg					:Sprite,
						_blockArrowMin		:Sprite,
						_blockArrowMax		:Sprite,
						_ratio				:Number,
						_style				:CoreCssStyle;
						
		public var relationship				:Number;
		
		public function CoreCssScrollSlider(css:CoreCssStyle = null)
		{
			_style = new CoreCssStyle();
			if(css != null) _style = css;
			_ratio = 0;
			
			relationship = 0;
			
			//super();
			_bg = new Sprite();
			this.addChild(_bg);
			
			_slider = new Sprite();
			this.addChild(_slider);
			
			_slider.addEventListener(MouseEvent.MOUSE_DOWN, startSlide );
			
		}
		
		public function startSlide(e:Event):void
		{
			var length:Number;
			_slider.addEventListener(MouseEvent.MOUSE_OUT, stopSlide );
			_slider.addEventListener(MouseEvent.MOUSE_UP, stopSlide );
			
			if(isVertical)
			{
				length = Math.max(_h - (_h * relationship), _style.scrollSliderMinLength);
				_slider.startDrag(false, new Rectangle(0,0,0,length) );
			}
			
			if(isHorizontal)
			{
				length = Math.max(_w - (_w * relationship), _style.scrollSliderMinLength);
				_slider.startDrag(false, new Rectangle(0,0,length,0) );
			}
			
			this.addEventListener(Event.ENTER_FRAME,loop);
			
		}
		
		private function loop(e:Event):void
		{
			var length:Number;
			
			if(isVertical)
			{
				length = Math.max(_h * relationship, _style.scrollSliderMinLength);
				_ratio = _slider.y / ( _h - length );
			}
			
			if(isHorizontal)
			{
				length = Math.max(_w * relationship, _style.scrollSliderMinLength);
				_ratio = _slider.x / ( _w - length );
			}
			this.dispatchEvent(new CssScrollEvent(CssScrollEvent.UPDATE,ratio));
		}
		
		public function stopSlide(e:Event):void
		{
			this.removeEventListener(Event.ENTER_FRAME,loop);
			_slider.removeEventListener(MouseEvent.MOUSE_OUT, stopSlide );
			_slider.removeEventListener(MouseEvent.MOUSE_UP, stopSlide );
			_slider.stopDrag();
		}
		
		public function get mode():String
		{
			return _style.scrollType;;
		}
		
		public function set mode(value:String):void
		{
			_style.scrollType = value;
		}
		
		public function get ratio():Number
		{
			return _ratio;
		}
		
		public function set ratio(value:Number):void
		{
			_ratio = value;
		}
		
		public function get isVertical():Boolean
		{
			return (_w >= _h)? false: true;
		}
		
		public function get isHorizontal():Boolean
		{
			return (_w >= _h)? true: false;
		}
		
		public function render():void
		{
			var length:Number;
			
			_slider.graphics.clear();
			_slider.graphics.beginFill(_style.scrollScrollColor,_style.scrollScrollAlpha);
			if(isVertical)
			{
				length = Math.max(_h * relationship, _style.scrollSliderMinLength);
				switch(_style.scrollType)
				{
					case CoreCssScrollMode.MAC_LIKE:
						_slider.graphics.drawRoundRect(1,0,_style.scrollThickness - 2,length, _style.scrollThickness - 2);
						_slider.y = ratio * (_h - length);
						break;
					
				}
			}
			
			if(isHorizontal)
			{
				length = Math.max(_w * relationship, _style.scrollSliderMinLength);
				switch(_style.scrollType)
				{
					case CoreCssScrollMode.MAC_LIKE:
						_slider.graphics.drawRoundRect(0,1,length,_style.scrollThickness - 2, _style.scrollThickness - 2);
						_slider.x = ratio * (_w - length);
						break;
					
				}
			}
		}
		
		public function refresh():void
		{
			_bg.graphics.clear();
			_bg.graphics.beginFill(_style.scrollBackgroundColor,_style.scrollBackgroundAlpha);
			_bg.graphics.drawRect(0,0,_w,_h);
			this.render();
		}
		
		public function setSize(w:Number, h:Number, update:Boolean=true):void
		{
			_w = w;
			_h = h;
			if (update) refresh();
		}
	}
}