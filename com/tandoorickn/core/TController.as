﻿package com.tandoorickn.core{	import com.tandoorickn.patterns.command.AbstractCommand;	import com.tandoorickn.patterns.facade.AbstractFacade;	import com.tandoorickn.patterns.process.MacroProcessor;	import com.tandoorickn.patterns.process.Processor;	import com.tandoorickn.patterns.sequencer.Sequencer;	import com.tandoorickn.patterns.workflow.WorkflowManager;		import org.puremvc.as3.interfaces.*;	import org.puremvc.as3.patterns.observer.*;
		public class TController implements IController	{				public var view : TView;						public var 	process				:Processor,					macro				:MacroProcessor,					workflow			:WorkflowManager,					sequencer			:Sequencer;				private var _facade : AbstractFacade;				protected var commandMap : Array;				public function TController( )		{			commandMap = new Array();							process				= new Processor();			workflow			= new WorkflowManager();			macro				= new MacroProcessor();			sequencer			= new Sequencer();					}				public function set facade(value:AbstractFacade):void							{ 			_facade 			= value; 			sequencer.facade	= value;			process.facade		= value;			workflow.facade		= value;			macro.facade		= value;		}		public function executeCommand( note : INotification ) : void		{			var commandClassRef : Class = commandMap[ note.getName() ];			if ( commandClassRef == null ) return;			var commandInstance : AbstractCommand = new commandClassRef( );			commandInstance.facade = _facade;			commandInstance.execute( note );		}				public function revisionCommand( note : INotification ) : void		{			var commandClassRef : Class = commandMap[ note.getName() ];			if ( commandClassRef == null ) return;			var commandInstance : AbstractCommand = new commandClassRef( );			commandInstance.facade = _facade;			commandInstance.revision( note );		}				public function registerCommand( notificationName : String, commandClassRef : Class ) : void		{			if ( commandMap[ notificationName ] == null ) {				view.registerObserver( notificationName, new Observer( executeCommand, this ) );			}			commandMap[ notificationName ] = commandClassRef;		}				public function hasCommand( notificationName:String ) : Boolean		{			return commandMap[ notificationName ] != null;		}				public function removeCommand( notificationName : String ) : void		{			// if the Command is registered...			if ( hasCommand( notificationName ) )			{				// remove the observer				view.removeObserver( notificationName, this );											// remove the command				commandMap[ notificationName ] = null;			}		}			}}