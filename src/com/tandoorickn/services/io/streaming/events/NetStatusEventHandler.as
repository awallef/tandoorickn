package com.tandoorickn.services.io.streaming.events
{
	import flash.events.*;
	
	public class NetStatusEventHandler extends EventDispatcher
	{
		public function NetStatusEventHandler(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function netStatus(event:NetStatusEvent=null):void
		{
			var info:Object = {};
			info = event.info;
			
			switch (info.code) {
				case "NetConnection.Connect.Success":
					dispatchEvent(new Event("NetConnection.Connect.Success"));
					break;
				case "NetConnection.Connect.Failed":
					
					break;
				case "NetConnection.Connect.Rejected":
					;
					break;
				case "NetConnection.Connect.Closed":
					
					break;
				case "NetStream.Play.Start":
					
					break;
				
				case "NetStream.Pause.Notify":
					
					break;
				
				case "NetStream.Failed":
					
					break;
				case "NetStream.Buffer.Full":
					dispatchEvent(new Event("NetStream.Buffer.Full"));
					break;
				case "NetStream.Buffer.Empty":
					dispatchEvent(new Event("NetStream.Buffer.Empty"));
					break;
				default:
					
			}
		}
		
		public function onMetaData(infoObject:Object):void
		{
			
		}
		
		public function onXMPData( ... rest ):void
		{
			
		}
		
		public function onBWCheck( ... rest ):Number 
		{
			return 0;
		}
		
		public function onBWDone( ... rest ):void 
		{
			var bitrate:Number;
			
			// Get the bandwidth value from the rest array
			bitrate = rest[0];
			
			// Dispatch an event and pass the bandwidth value 
			dispatchEvent( new BandwidthEvent( BandwidthEvent.BANDWIDTH_RECEIVED, bitrate ) );
		}
		
		
		
		public function onPlayStatus(infoObject:Object =null):void
		{
			
		}
		
		public function onFCSubscribe(e:* = null):void
		{
			
		}
		
		
		public function netSecurityError(event:SecurityErrorEvent):void {
			
		}
		
		public function onAsyncError(event:AsyncErrorEvent):void {
			
		} 
	}
}