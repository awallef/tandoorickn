package com.tandoorickn.services.application.init.model
{
	public class InitializingData
	{
		public var 	configurationObject				:Object,
					taskList						:Array,
					extra							:Object;
		
		public function InitializingData()
		{
			taskList = new Array();
			configurationObject = {};
		}
		
		public function addInitTask(url : String, id : String, notificationName : String, commandClassRef : Class, data : Object ):void
		{
			taskList.push(new InitTask(url,id,notificationName,commandClassRef, data));
		}
		
	}
}