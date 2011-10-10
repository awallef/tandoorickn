package com.tandoorickn.services.application.init.model.proxy
{
	import com.tandoorickn.patterns.proxy.AbstractProxy;
	import com.tandoorickn.services.application.init.InitializingService;
	import com.tandoorickn.services.application.init.controller.commontask.CreateFontFromSwf;
	import com.tandoorickn.services.application.init.model.InitTask;
	import com.tandoorickn.services.application.init.model.InitializingData;
	
	public class InitProxy extends AbstractProxy
	{
		public static var NAME:String 			= "InitProxy";
		
		private var	_initData					:InitializingData;
		
		public var taskPos						:int;
		
		public function InitProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
			_initData = this.data as InitializingData;
			
			taskPos = -1;
		}
		
		public var temp:Object = {};
		
		public function get currentTask():InitTask
		{
			return taskPos > -1 ? this.taskList[taskPos] as InitTask : null ;
		}
		
		public function get tasksLength():uint
		{
			return this._initData.taskList.length;
		}
		
		public function get taskList():Array
		{
			return this._initData.taskList;
		}
		
		public function get initData():InitializingData
		{
			return _initData;
		}
		
		public function addInitTask(url : String, id : String, notificationName : String, commandClassRef : Class, data : Object ):void
		{
			_initData.addInitTask(url,id,notificationName,commandClassRef, data);
		}
		
		public function addSwfFont(url:String, id:String, fontList:Array, data:Object):void
		{
			var notificationName:String = InitializingService.CREATE_FONTS_SWF;
			if(!data) 
			{
				data = {};
				data.descritption = "Load Fonts...";
			}
			data.fontList = fontList;
			data.url = url;
			
			_initData.addInitTask( null ,id,notificationName, CreateFontFromSwf, data);
		}
		
		
	}
}