package com.tandoorickn.services.io.rpc
{
	import com.tandoorickn.patterns.service.AbstractService;
	import com.tandoorickn.services.io.rpc.model.RPCProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class RPCService extends AbstractService
	{
		
		public static const		NAME		:String					= "RPCService";
		
		public function RPCService()
		{
			super();
		}
		
		override public function configure(notification:INotification):void
		{
			//(this.facade.retrieveProxy(WordpressProxy.NAME) as WordpressProxy).configure();
		}
		
		override public function initProxies():void
		{
			this.facade.registerProxy( new RPCProxy(RPCProxy.NAME) );
		}
		
		override public function initMediators():void		{}
		
		override public function initCommands():void		{}
		
		override public function initProcess():void			{}
		
		
		
		
		
		override public function removeProxies():void		
		{
			this.facade.removeProxy( RPCProxy.NAME );
		}
		
		override public function removeMediators():void		{}
		
		override public function removeCommands():void		{}
		
		override public function removeProcess():void		{}
	}
}