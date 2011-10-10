package com.tandoorickn.services.application.init
{
	import com.tandoorickn.patterns.service.AbstractService;
	import com.tandoorickn.services.application.init.controller.StartInitProcessCommand;
	import com.tandoorickn.services.application.init.controller.StartTaskCommand;
	import com.tandoorickn.services.application.init.controller.commontask.LoadInitItemCommand;
	import com.tandoorickn.services.application.init.model.InitializingData;
	import com.tandoorickn.services.application.init.model.proxy.InitProxy;
	import com.tandoorickn.services.application.init.view.InitMediator;
	import com.tandoorickn.services.io.bufferloader.BufferloaderService;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class InitializingService extends AbstractService
	{
		
		public static var NAME:String 							= "InitializingService";
		
		
		public static const CUSTOM_INIT_COMMAND:String			= "InitializingService.CUSTOM_INIT_COMMAND";
		
		
		public static const START_INIT:String					= "InitializingService.START_INIT";
		
		public static const RUN_INIT_PROCESS:String				= "InitializingService.RUN_INIT_PROCESS";
		
		public static const INIT_COMPLETE:String				= "InitializingService.INIT_COMPLETE";
		
		
		
		public static const MEDIATOR_INIT_PROGRESS:String		= "InitializingService.MEDIATOR_INIT_PROGRESS";
		
		
	
		public static const CREATE_FONTS_SWF:String				= "InitializingService.CREATE_FONTS_SWF";
		
		public static const LOAD_ITEM:String					= "InitializingService.LOAD_ITEM";
		
		public static const START_TASK:String					= "InitializingService.START_TASK";
		
		public function InitializingService()
		{
			super();
			this.dependencies = [BufferloaderService];
		}
		
		override public function configure(notification:INotification):void
		{
			if(this.note.getBody().hasOwnProperty("commandClassRef"))
				this.facade.sendNotification(CUSTOM_INIT_COMMAND);
			
			this.facade.sendNotification(START_INIT);
		}
		
		override public function initMediators():void
		{
			this.facade.registerMediator( new InitMediator( InitMediator.NAME, {} ) );
		}
		
		override public function initProxies():void
		{
			var data:InitializingData = new InitializingData();
			data.configurationObject = this.note.getBody().configurationObject;
			this.facade.registerProxy(new InitProxy(InitProxy.NAME,data));
		}
		
		override public function initCommands():void
		{
			if(this.note.getBody().hasOwnProperty("commandClassRef"))
				this.facade.registerCommand( CUSTOM_INIT_COMMAND, this.note.getBody().commandClassRef );
			
			this.facade.registerCommand( START_INIT , StartInitProcessCommand );
			this.facade.registerCommand( START_TASK , StartTaskCommand );
			this.facade.registerCommand( LOAD_ITEM , LoadInitItemCommand );
		}
		
		override public function removeProxies():void
		{
			this.facade.removeProxy(InitProxy.NAME);
		}
	}
}