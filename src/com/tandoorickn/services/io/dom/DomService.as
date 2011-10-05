package com.tandoorickn.services.io.dom
{
	import com.tandoorickn.patterns.service.AbstractService;
	import com.tandoorickn.services.io.bufferloader.BufferloaderService;
	import com.tandoorickn.services.io.dom.model.DomProxy;
	
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class DomService extends AbstractService
	{
		public static const		NAME		:String					= "DomService";
		
		public function DomService()
		{
			super();
			this.dependencies = [BufferloaderService];
		}
		
		override public function configure(notification:INotification):void
		{
			//(this.facade.retrieveProxy(WordpressProxy.NAME) as WordpressProxy).configure();
		}
		
		override public function initProxies():void
		{
			this.facade.registerProxy( new DomProxy(DomProxy.NAME) );
		}
		
		override public function initMediators():void		{}
		
		override public function initCommands():void		{}
		
		override public function initProcess():void			{}
		
		
		
		
		
		override public function removeProxies():void		
		{
			this.facade.removeProxy( DomProxy.NAME );
		}
		
		override public function removeMediators():void		{}
		
		override public function removeCommands():void		{}
		
		override public function removeProcess():void		{}
	}
}