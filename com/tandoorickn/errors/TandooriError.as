package com.tandoorickn.errors
{
	public class TandooriError
	{
		public var		level				:String,
						code				:String,
						description			:String,
						details				:String;
		
		
		public function TandooriError( level:String, code:String, description:String, details:String )
		{
			this.level			= level;
			this.code 			= code;
			this.description 	= description;
			this.details 		= details;
		}
		
		public function toString():String
		{
			var str:String = "[ TandooriError content:\n\t";
			str += "level \t\t\t"+level+"\n\t";
			str += "code \t\t\t"+code+"\n\t";
			str += "details \t\t\t"+details+"\n\t";
			str += "description \t\t"+description+"\n";
			str += "]";
			
			return str;
		}
	}
}