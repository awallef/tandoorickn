package com.tandoorickn.patterns.command
{
	import com.tandoorickn.errors.TandooriError;
	
	import org.puremvc.as3.interfaces.INotification;
	
	

	public class CommandMetadata
	{
		public static const	WORKFLOW				:String			= "workflow";
		
		public static const	MACRO					:String			= "macro";
		
		public static const	PROCESS					:String			= "process";
		
		
		public static function hasMeta(notification:INotification):Boolean
		{
			
			var body:Object = notification.getBody();
			return (body.metadata)? true: false;
		}
		
		public static function getTime():Number
		{
			return new Date().time;
		}
		
		public static function setMeta( name:String, type:String, notification:INotification ):void
		{
			var body:Object = notification.getBody();
			if(!CommandMetadata.hasMeta(notification)) body.metadata = new CommandMetadata(name,type);
			
			switch(type)
			{
				case CommandMetadata.MACRO:
					body.metadata.macro = name;
					break;
				
				case CommandMetadata.PROCESS:
					body.metadata.process = name;
					break;
			}
			
			notification.setBody(body);
		}
		
		public static function setSteps(array:Array, notification:INotification ):void
		{
			var body:Object = notification.getBody();
			body.metadata.steps = new Array();
			
			for(var i:uint = 0; i < array.length; i++)
			{
				body.metadata.steps.push(new Step(array[i]));
			}
			
			notification.setBody(body);
		}
		
		public static function addStepsAt(array:Array, index:uint , notification:INotification):void
		{
			var body:Object = notification.getBody();
			var old:Array = body.metadata.steps;
			
			body.metadata.steps = new Array();
			
			var diff:uint = array.length - old.length;
			
			for(var i:uint = 0; i < array.length; i++)
			{
				
				if(i >= index  &&  i < index + diff)
				{
					body.metadata.steps.push(new Step(array[i]));
					
				}
				else
				{
					if(i < index) body.metadata.steps.push(old[i]);
					if(i >= index + diff ) body.metadata.steps.push(old[i - diff ]);
				}
					
			}
		}
		
		public static function setStep(count:uint, body:Object ):Object
		{
			body.metadata.steps[count].execAt = CommandMetadata.getTime();
			body.metadata.current = count;
			return body;
		}
		
		
		
		
		public var 			type					:String,
							name					:String,
							startedAt				:Number,
							error					:TandooriError,
							current					:uint,
							endedAt					:String,
							macro					:String,
							steps					:Array,
							process					:String;
		
		public function CommandMetadata(name:String,type:String)
		{
			this.name = name;
			this.type = type;
			this.startedAt = CommandMetadata.getTime();
			this.macro = "";
			this.process = "";
		}
		
		public function toString():String
		{
			var str:String = "[ Class CommandMetadata \n\n";
			
			str += "----Metadata----\n";
			
			str += "\tname ->\t\t\t" +name+"\n";
			str += "\ttype ->\t\t\t" +type+"\n";
			str += "\tcurrent ->\t\t" +( current + 1)+"\n";
			str += "\tstartedAt ->\t\t" +startedAt+"\n";
			str += "\tmacro ->\t\t\t" +macro+"\n";
			str += "\tprocess ->\t\t" +process+"\n\n";
			
			if(!steps) return str;
			
			str += "----Steps----\n";
			
			for(var i:uint = 0; i < steps.length; i++)
			{
				str += "\t"+(i + 1)+" ) "+steps[i].name+":\n\t\t-> execAt: "+steps[i].execAt+"\n";
			}
			
			str += "-------------\n\n";
			
			str+="]\n";
			
			return str;
		}
	}
}


class Step
{
	public var 	name:String,
				execAt:Number;
	
	public function Step(name:String)
	{
		this.name = name;
		this.execAt = 0;
	}
}