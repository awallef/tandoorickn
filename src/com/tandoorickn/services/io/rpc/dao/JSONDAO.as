package com.tandoorickn.services.io.rpc.dao
{
	
	import com.adobe.serialization.json.*;
	import com.tandoorickn.debug.Log;
	import com.tandoorickn.errors.TandooriError;
	
	import flash.events.Event;
	
	public class JSONDAO extends XMLDAO
	{
		public function JSONDAO(name:String, uri:String, type:String, params:Object=null)
		{
			super(name, uri, type, params);
		}
		
		override protected function onComplete(event:Event):void
		{
			try {
				var jsonDecoder:JSONDecoder = new JSONDecoder(_loader.data,false);
				var result:Object = jsonDecoder.getValue();
				externalSuccessResponder(result);
				
			}catch (e:JSONParseError) { 
				var error:TandooriError = new TandooriError("JSONParseError",event.toString(),"com.tandoorickn.services.io.rpc.dao.JSONDAO Class","An JSONParseError");
				nativeErrorResponder(error);
			}
		}
		
	}
}