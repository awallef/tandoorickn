package com.tandoorickn.services.io.streaming.events
{
	import flash.events.Event;
	
	public class BandwidthEvent extends Event
	{
		static public var BANDWIDTH_RECEIVED:String = "bandwidthReceived";
		
		public var bandwidth:int;
		
		public function BandwidthEvent( p_type:String, p_bandwidth:int, p_bubbles:Boolean=false, p_cancelable:Boolean=false ) 
		{
			super( p_type, p_bubbles, p_cancelable );
			
			bandwidth = p_bandwidth;
		}
	}
}