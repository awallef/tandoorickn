package com.tandoorickn.interfaces.patterns
{
	public interface IMacro
	{
		function get stack():Array;
		
		function get name():String;
		
		function set stack(value:Array):void;
		
		function set name(value:String):void;
		
		function kill():void;
	}
}