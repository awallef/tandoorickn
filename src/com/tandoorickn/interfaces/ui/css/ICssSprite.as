package com.tandoorickn.interfaces.ui.css
{
	public interface ICssSprite extends ICoreCssDisplayObject
	{
		function get classes():Array;
		
		function set classes(value:Array):void;
		
		function get id():String;
		
		function set id(value:String):void;
		
		function addCssSprite(cssObject:ICssSprite,index:uint):void;
	}
}