package com.tandoorickn.services.application.init.controller
{
	import com.tandoorickn.patterns.command.AbstractCommand;
	import com.tandoorickn.services.application.init.model.proxy.InitProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class CompleteInitCommand extends AbstractCommand
	{
		public function CompleteInitCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			super.execute( notification );
			
			var proxy:InitProxy = this.facade.retrieveProxy(InitProxy.NAME) as InitProxy;
			
			for( var i:uint = 0; i < proxy.tasksLength; i++)
			{
				if( (proxy.taskList[i] as InitTask).notificationName )
				{
					var notificationName:String = (proxy.taskList[i] as InitTask).notificationName;
					this.facade.removeCommand( notificationName );
				}
			}
			
			this.nextProcess();
			
			this.facade.initFacade( proxy.initData.configurationObject );
			
			
		}
	}
}