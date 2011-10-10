package com.tandoorickn.services.application.init.controller
{
	import com.tandoorickn.patterns.command.AbstractCommand;
	import com.tandoorickn.services.application.init.InitializingService;
	import com.tandoorickn.services.application.init.model.InitTask;
	import com.tandoorickn.services.application.init.model.proxy.InitProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class StartInitProcessCommand extends AbstractCommand
	{
		public function StartInitProcessCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			super.execute(notification);
			
			var proxy:InitProxy = this.facade.retrieveProxy(InitProxy.NAME) as InitProxy;
			
			var tasks:Array = new Array();
			for( var i:uint = 0; i < proxy.tasksLength; i++)
			{
				
				
				tasks.push(InitializingService.START_TASK);
				//this.facade.log("debug","StartInitProcessCommand","push",InitializingService.START_TASK);
				
				if( (proxy.taskList[i] as InitTask).url )
				{
					tasks.push(InitializingService.LOAD_ITEM);
					//this.facade.log("debug","StartInitProcessCommand","push",InitializingService.LOAD_ITEM);
				}
				
				if( (proxy.taskList[i] as InitTask).notificationName )
				{
					var notificationName:String = (proxy.taskList[i] as InitTask).notificationName;
					var commandClassRef:Class = (proxy.taskList[i] as InitTask).commandClassRef;
					this.facade.registerCommand(notificationName,commandClassRef);
					tasks.push( notificationName );
					//this.facade.log("debug","StartInitProcessCommand","push",notificationName);
				}
					
			}
			
			tasks.push(InitializingService.INIT_COMPLETE);
			//this.facade.log("debug","StartInitProcessCommand","push",InitializingService.INIT_COMPLETE);
			
			//this.facade.log("debug","StartInitProcessCommand","tasks:",tasks );
			
			this.facade.process.addAndCreateProcess( InitializingService.RUN_INIT_PROCESS, tasks, true);
			
			this.facade.sequencer.goto(InitializingService.RUN_INIT_PROCESS);
		}
	}
}