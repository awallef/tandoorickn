package com.tandoorickn.utils.types
{
	public class TimeUtils
	{
		public function TimeUtils()
		{
		}
		
		public static function getTimeStampInSeconds():String
		{
			return String(Math.floor(new Date().getTime()/1000));
		}
	}
}