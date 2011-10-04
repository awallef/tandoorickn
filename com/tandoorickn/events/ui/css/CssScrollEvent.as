package com.tandoorickn.events.ui.css
{
	import flash.events.Event;
	
	public class CssScrollEvent extends Event
	{
		public static const UPDATE:String			= "CssScrollEvent.UPDATE";
		
		public var ratio:Number;
		
		public function CssScrollEvent(type:String,ratio:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.ratio = ratio;
			super(type, bubbles, cancelable);
		}
	}
}