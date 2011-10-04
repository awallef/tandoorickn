package com.tandoorickn.interfaces.patterns
{
	import org.puremvc.as3.interfaces.INotification;

	public interface IWorkflow
	{
		function initWorkflow(notification:INotification):void;
		
		function removeWorkflow():void;
		
		function initCommands():void;
		
		function initMacros():void;
		
		function removeCommands():void;
		
		function removeMacros():void;
	}
}