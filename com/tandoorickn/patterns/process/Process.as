﻿package  com.tandoorickn.patterns.process{	import com.tandoorickn.errors.TandooriError;	import com.tandoorickn.interfaces.patterns.IProcess;
		public class Process implements IProcess	{		public static const		PROCESSING			:String				= "PROCESSING";				public static const		CRASHED				:String				= "CRASHED";				public static const		INACTIVE			:String				= "INACTIVE";				private var 			_stack				:Array,								_name				:String,								_once				:Boolean,								_count				:int;										public var				state				:String,								executedAt			:Number,								crashedAt			:Number,								crashedCommand		:String,								error				:TandooriError,								runs				:uint;							public function Process(name:String,args:Array,once:Boolean = false)		{			_count = 0;			_name = name;			_stack = args;			_once = once;						runs = 0;			executedAt = 0;			crashedAt = 0;			crashedCommand = "";			state = Process.INACTIVE;		}				public function kill():void		{			_count = NaN;			_stack = null;		}				public function get stack():Array						{ return _stack; }				public function get name():String						{ return _name; }				public function get once():Boolean						{ return _once; }				public function get count():int							{ return _count; }				public function get length():int						{ return _stack.length; }						public function set stack(value:Array):void				{ _stack = value; }				public function set name(value:String):void				{ _name = value; }				public function set once(value:Boolean):void			{ _once = value; }				public function set count(value:int):void				{ _count = value; }				public function toString():String		{			var str:String = "[ Class Process "+name+" ]\n";						str+="\t\tstate:\t\t\t\t\t"+state+"\n";			str+="\t\texecutedAt:\t\t\t"+executedAt+"\n";			str+="\t\tcrashedAt:\t\t\t\t"+crashedAt+"\n";			str+="\t\tcrashedCommand:\t\t"+crashedCommand+"\n";			str+="\t\terror:\t\t\t\t\t"+error+"\n";			str+="\t\truns:\t\t\t\t\t"+runs+"\n";						for(var i:uint = 0; i < _stack.length; i++)			{				str += "\t\t\t-> "+_stack[i]+"\n";			}						return str;		}					}	}