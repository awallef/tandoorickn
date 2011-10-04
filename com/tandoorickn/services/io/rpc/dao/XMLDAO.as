package com.tandoorickn.services.io.rpc.dao
{
	import com.tandoorickn.debug.Log;
	import com.tandoorickn.patterns.dao.AbstractDAO;
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	public class XMLDAO extends AbstractDAO
	{
		
		protected var 	_loader:URLLoader;
		
		
		public function XMLDAO(name:String, uri:String, type:String, params:Object=null)
		{
			super(name, uri, type, params);
			
			_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE,onComplete);
			//_loader.addEventListener(ProgressEvent.PROGRESS,onProgress);
			super.configureListeners(_loader);
			
		}
		
		override public function call(method:String,parameters:Array = null):Function
		{
			
			var request:URLRequest = new URLRequest(uri);
			request.method = method;

			if(parameters)
			{
				var variables = new URLVariables();
				for(var i:uint = 0; i < parameters[0].length; i++) variables[parameters[0][i]] = parameters[1][i];
				request.data = variables;
			}
			
			return function(successResponder:Function,errorResponder:Function):void
			{	
				externalSuccessResponder = successResponder;
				externalErrorResponder = errorResponder;
				_loader.load(request);
			};
		}
		
		protected function onProgress(e:ProgressEvent):void
		{
			Log.info("XMLDAO","onProgress",e.bytesLoaded,e.bytesTotal);
		}
		
		protected function onComplete(e:Event):void
		{
			this.externalSuccessResponder(new XML(_loader.data));
		}
	}
}