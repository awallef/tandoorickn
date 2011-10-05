package com.tandoorickn.core
{
	import com.tandoorickn.patterns.facade.AbstractFacade;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class TApplication extends Sprite
	{
		protected var _facade		:AbstractFacade;
		
		public var 	appName			:String,
					flashvars		:Object;
		
		public function TApplication(name:String = "Tandoori AS3 Application")
		{
			super();
			this.appName = name;
			this.addEventListener(Event.ADDED_TO_STAGE,onStage);
		}
		
		protected function onStage(e:Event):void
		{
			flashvars = this.stage.root.loaderInfo.parameters;
			init();
		}
		
		public function init():void
		{
			
		}
	}
}