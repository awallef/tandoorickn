﻿package com.tandoorickn.services.io.rpc.model{	import com.tandoorickn.patterns.dao.AbstractDAO;	import com.tandoorickn.patterns.proxy.AbstractProxy;	import com.tandoorickn.services.io.rpc.dao.AMFDAO;	import com.tandoorickn.services.io.rpc.dao.DrupalDAO;	import com.tandoorickn.services.io.rpc.dao.JSONDAO;	import com.tandoorickn.services.io.rpc.dao.XMLDAO;		import flash.system.Security;				public class RPCProxy extends AbstractProxy	{		public static var 	NAME					:String = 'RPCProxy';				public static const	AMF						:String = "RPCProxy.AMF";				public static const	DRUPAL_AMF				:String = "RPCProxy.DRUPAL_AMF";				public static const	XML						:String = "RPCProxy.XML";				public static const	JSON					:String = "RPCProxy.JSON";				//public static const	REST					:String = "RPCProxy.REST";						private var _cnx:Object;  				public function RPCProxy(proxyName:String=null, data:Object=null)		{			if(proxyName != "") RPCProxy.NAME = proxyName;						super(proxyName, data);						Security.allowDomain("*");			_cnx = {};		}				public function getDao(channel:String):AbstractDAO		{			return _cnx[channel];		}				public function getUri(channel:String):String { return (_cnx[channel] as AbstractDAO).uri; }				public function setUri(channel:String,uri:String,type:String = null,params:Object = null,dao:Class = null):void		{			if(_cnx[channel])			{				(_cnx[channel] as AbstractDAO).close();				_cnx[channel] = null;			}						if(dao)			{				_cnx[channel] = new dao(channel,uri,type,params);				if(!(_cnx[channel] as AbstractDAO).isConnected) (_cnx[channel] as AbstractDAO).connect();							}else{				initDao(channel,uri,type,params);			}								}				public function daoExists(channel:String):Boolean		{			return (_cnx[channel])? true : false;		}		public function get activeChannelsList():Array		{			var list:Array = new Array();			for( var channel:String in _cnx)				if((_cnx[channel] as AbstractDAO).isConnected) list.push(channel);			return list;		}				public function get channelsList():Array		{			var list:Array = new Array();			for( var channel:String in _cnx)				list.push(channel);			return list;		}				public function call(channel:String,method:String,parameters:Array = null):Function		{				//if(!(_cnx[channel] as AbstractDAO).isConnected) (_cnx[channel] as AbstractDAO).connect();			return (_cnx[channel] as AbstractDAO).call(method,parameters);		}					private function initDao(channel:String,uri:String,type:String,params:Object = null):void		{			switch(type)			{				case RPCProxy.AMF:					_cnx[channel] = new AMFDAO(channel,uri,type,params);					break;								case RPCProxy.DRUPAL_AMF:					_cnx[channel] = new DrupalDAO(channel,uri,type,params);					break;								case RPCProxy.XML:					_cnx[channel] = new XMLDAO(channel,uri,type,params);					break;								case RPCProxy.JSON:					_cnx[channel] = new JSONDAO(channel,uri,type,params);					break;			}						if(!(_cnx[channel] as AbstractDAO).isConnected) (_cnx[channel] as AbstractDAO).connect();		}				}}