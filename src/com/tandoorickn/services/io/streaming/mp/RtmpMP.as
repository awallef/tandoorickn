package com.tandoorickn.services.io.streaming.mp
{
	import com.tandoorickn.patterns.media.AbstractMediaProvider;
	import com.tandoorickn.patterns.media.MediaItem;
	import com.tandoorickn.patterns.media.MediaItemLevel;
	import com.tandoorickn.services.io.streaming.events.BandwidthEvent;
	import com.tandoorickn.services.io.streaming.events.NetStatusEventHandler;
	import com.tandoorickn.services.io.streaming.model.MediaProviderState;
	
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	public class RtmpMP extends AbstractMediaProvider
	{
		
		public var 	mediaItem							:MediaItem;
		
		private var _safetyMargin						:Number,
					_currentVideoIndex					:int;
					
		private var _volume								:Number,
					_nc									:NetConnection,
					_ns									:NetStream,
					_handler							:NetStatusEventHandler;
		
		public function RtmpMP(mediaItem:MediaItem, target:IEventDispatcher=null)
		{
			super(target);
			
			this.mediaItem 				= mediaItem;
			_safetyMargin 				= 1.25;
			_volume 					= 1;
			
			_handler 					= new NetStatusEventHandler();
			_nc 						= new NetConnection();
			
			setHandlers();
			
		}
		
		override public function load():void
		{
			_nc.connect(mediaItem.streamer);
		}
		
		private function _setHandlers():void
		{
			
			_handler.addEventListener("NetConnection.Connect.Success", _setStream);
			_handler.addEventListener("NetStream.Buffer.Full", _bufferFullHandler);
			_handler.addEventListener(BandwidthEvent.BANDWIDTH_RECEIVED, _onBW );
			
			_nc.addEventListener(NetStatusEvent.NET_STATUS, _handler.netStatus);
			_nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _handler.netSecurityError);
			_nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, _handler.onAsyncError);
			_nc.client = _handler;
		}
		
		private _bufferFullHandler(e:Event):void
		{
			this._state = MediaProviderState.BUFFER_FULL;
		}
		
		private function _setStream(e:Event):void
		{
			_nc.call( "checkBandwidth", null );
			_ns = new NetStream(_nc);
			_ns.client = _handler;
			_ns.bufferTime = 2;
			_ns.addEventListener(NetStatusEvent.NET_STATUS,_handler.netStatus);
			
		}
		
		private function _startStream( mediaItemLevel:MediaItemLevel ):void
		{
			var file:String = mediaItemLevel.file;
			_nc.call("FCSubscribe", null, file);
			_ns.play( file );	
		}
		
		private function _onBW( e:BandwidthEvent ):void
		{
			var videoIndexToPlay:int = _getBandwidthIndex( e.bandwidth );
			_startStream( _streamList[videoIndexToPlay] );
		}
		
		private function _getBandwidthIndex( p_targetKbps:Number ):int
		{
			var idx:int;
			for( var i:int = 0; i < this.mediaItem.levelLength; i++ )
			{
				if( this.mediaItem.level[i].bitrate <= p_targetKbps * _safetyMargin )
				{
					idx = i;
					break;
				}
			}
			
			return idx;
		}
		
		
		
		
	}
}