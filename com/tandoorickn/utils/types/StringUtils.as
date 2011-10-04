package com.tandoorickn.utils.types
{
	public class StringUtils
	{
		public function StringUtils()
		{
		}
		
		
		public static function ignoreWhiteSpace(string:String):String
		{
			return string.replace(/[\t\r\n]|\s\s/g, "");
		}
	}
}