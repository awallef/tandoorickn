package com.tandoorickn.services.application.init.controller
{
	import com.tandoorickn.patterns.command.AbstractCommand;
	import com.tandoorickn.services.application.init.InitializingService;
	import com.tandoorickn.services.application.init.model.InitTask;
	import com.tandoorickn.services.application.init.model.proxy.InitProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class StartTaskCommand extends AbstractCommand
	{
		public function StartTaskCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			super.execute(notification);
			
			this.facade.log("debug","StartTaskCommand","execute");
			
			var proxy:InitProxy = this.facade.retrieveProxy(InitProxy.NAME) as InitProxy;
			proxy.taskPos++;
			
			var obj:Object = {};
			obj.taskStep = 0;
			obj.taskProgress = 1;
			obj.taskPos = proxy.taskPos;
			obj.taskDescription = proxy.currentTask.data.description ? proxy.currentTask.data.description+ "..." : "Loading...";
			
			this.facade.sendNotification( InitializingService.MEDIATOR_INIT_PROGRESS, obj );
			
			this.facade.log("debug","StartTaskCommand","sendNotification",InitializingService.MEDIATOR_INIT_PROGRESS);
			
			this.nextProcess();
		}
	}
}