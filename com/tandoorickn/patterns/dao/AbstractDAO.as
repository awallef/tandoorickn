package com.tandoorickn.patterns.dao
{
	import com.tandoorickn.debug.Log;
	import com.tandoorickn.errors.TandooriError;
	
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;

	public class AbstractDAO
	{
		public var 		name:String,
						uri:String,
						type:String;
					
					
		private var 	_externalSuccessResponder :Function,
						_externalErrorResponder:Function;
		
		public function AbstractDAO(name:String,uri:String,type:String,params:Object = null)
		{
			this.name = name;
			this.uri = uri;
			this.type = type;
		}
		
		public function get externalSuccessResponder():Function			{ return _externalSuccessResponder; }
		
		public function set externalSuccessResponder(value:Function)	{ _externalSuccessResponder = value; }
		
		public function get externalErrorResponder():Function			{ return _externalErrorResponder; }
		
		public function set externalErrorResponder(value:Function)		{ _externalErrorResponder = value; }
		
		public function get isConnected():Boolean						{ return false; }
		
		
		public function call(method:String,parameters:Array = null):Function
		{
			return null;
		}
		
		public function connect():void
		{
			
		}
		
		public function close():void
		{
			
		}
		
		protected function nativeErrorResponder(response:*):void
		{
			var error:TandooriError;
			
			if(response is TandooriError) error = response;
			else error = new TandooriError(response["level"],response["code"],response["details"],response["description"]);
			
			try 
			{
				externalErrorResponder(error);
			}catch (e:Error) {
				
				Log.warn("TandooriError","nativeErrorResponder ->",error);
			
			}
			
		}
		
		protected function configureListeners(connection:EventDispatcher):void
		{
			connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			connection.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void {
			//Log.warn("AbstractDAO","ioErrorHandler");
			var error:TandooriError = new TandooriError("ioErrorHandler",event.toString(),"com.tandoorickn.patterns.dao.AbstractDAO Class","An IOErrorEvent");
			nativeErrorResponder(error);
		}
		
		
		private function securityErrorHandler(event:SecurityErrorEvent):void {
			//Log.warn("AbstractDAO","securityErrorHandler");
			var error:TandooriError = new TandooriError("securityErrorHandler",event.toString(),"com.tandoorickn.patterns.dao.AbstractDAO Class","An SecurityErrorEvent");
			nativeErrorResponder(error);
		}
	}
}