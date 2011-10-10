package com.tandoorickn.services.application.init.view
{
	import com.tandoorickn.patterns.mediator.AbstractMediator;
	import com.tandoorickn.services.application.init.InitializingService;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class InitMediator extends AbstractMediator
	{
		public static var NAME:String			= "InitMediator";
		
		public function InitMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function listNotificationInterests():Array
		{
			return [ InitializingService.MEDIATOR_INIT_PROGRESS ];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var note:String = notification.getName();
			var obj:Object = notification.getBody();
			switch(note)
			{
				case InitializingService.MEDIATOR_INIT_PROGRESS:
					this.facade.log("debug","InitMediator","update",obj.taskStep,obj.taskProgress,obj.taskPos,obj.taskDescription);
					break;
			}
		}
	}
}