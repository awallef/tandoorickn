package com.tandoorickn.services.application.init.model
{
	public class InitTask
	{
		public var url:String,
					id:String,
					notificationName:String,
					commandClassRef:Class,
					data:Object;
					
		
		public function InitTask(url : String, id : String, notificationName : String, commandClassRef : Class, data:Object )
		{
			this.url = url;
			this.id = id;
			this.notificationName = notificationName;
			this.commandClassRef = commandClassRef;
			this.data = data ? data : {};
		}
	}
}