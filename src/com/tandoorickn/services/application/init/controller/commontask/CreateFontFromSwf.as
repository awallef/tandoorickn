package com.tandoorickn.services.application.init.controller.commontask
{
	import com.tandoorickn.patterns.command.AbstractCommand;
	import com.tandoorickn.services.application.init.model.proxy.InitProxy;
	import com.tandoorickn.services.io.bufferloader.model.BufferloaderProxy;
	import ru.etcs.utils.FontLoader;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.text.Font;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class CreateFontFromSwf extends AbstractCommand
	{
		public var fontLoader:FontLoader;
		
		public function CreateFontFromSwf()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			super.execute( notification );
			
			var proxy:InitProxy = this.facade.retrieveProxy( InitProxy.NAME ) as InitProxy;
			var id:String = proxy.currentTask.id;
			
			//new URLRequest( proxy.currentTask.data.url), true
			
			fontLoader = new FontLoader();
			fontLoader.addEventListener(Event.COMPLETE, onComplete);
			fontLoader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			fontLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);
			
			fontLoader.load(new URLRequest(proxy.currentTask.data.url), true );
			
			//fontLoader = new FontLoader(new URLRequest(proxy.currentTask.data.url));
		}
		
		public function errorHandler(e:Event):void
		{
			this.crashed(e.toString());
		}
		
		public function onComplete(e:Event):void
		{
			var fontList:Array = Font.enumerateFonts();
			for( var i:int=0; i<fontList.length; i++ )
			{
				trace( "font: " + fontList[ i ].fontName , fontList[ i ] );
			}
			
			this.nextProcess();
		}
	}
}