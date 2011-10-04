package com.tandoorickn.utils.types
{
	public class ObjectUtils
	{
		public static function simpleTrace(object:Object):String
		{
			var output:String = "";
			
			for(var a:String in object) for(var b:String in object[a]) output += a+" -> "+object[a]+ " -> "+b+" -> "+object[a][b]+"\n";
			
			return output;
		}
	}
}