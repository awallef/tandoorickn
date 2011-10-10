package com.tandoorickn.services.application.init.controller.commontask
{
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import com.tandoorickn.patterns.command.AbstractCommand;
	import com.tandoorickn.services.application.init.InitializingService;
	import com.tandoorickn.services.application.init.model.proxy.InitProxy;
	import com.tandoorickn.services.io.bufferloader.model.BufferloaderProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class LoadInitItemCommand extends AbstractCommand
	{
		private var _loader				:BufferloaderProxy,
					_initProxy			:InitProxy;
		
		public function LoadInitItemCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			super.execute(notification);
			
			_loader = this.facade.retrieveProxy(BufferloaderProxy.NAME) as BufferloaderProxy;
			_initProxy = this.facade.retrieveProxy(InitProxy.NAME) as InitProxy;
			
			var config:Object = {};
			config.id = _initProxy.currentTask.id;
			
			_loader.expressLoad([_initProxy.currentTask.url],[config])(successHandler,this.crashed,this.progressHandler);;
			
			this.nextProcess();
		}
		
		public function successHandler(data:*):void
		{	
			this.nextProcess();
		}
		
		public function progressHandler(e:BulkProgressEvent):void
		{
			var obj:Object = {};
			obj.taskStep = 1;
			obj.taskProgress = e.ratioLoaded;
			obj.taskPos = _initProxy.taskPos;
			obj.taskDescription = _initProxy.currentTask.data.description ? _initProxy.currentTask.data.description+ "..." : "Loading...";
			
			this.facade.sendNotification( InitializingService.MEDIATOR_INIT_PROGRESS, obj );
		}
	}
}