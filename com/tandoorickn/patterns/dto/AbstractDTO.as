package com.tandoorickn.patterns.dto
{
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	public class AbstractDTO {
		//formats a custom object as YourDtoClassName (param1 = value1, ..., paramN = valueN)
		public function toString() : String {
			var objectString : String = getQualifiedClassName(this) + "(";
			var description:XML = describeType(this);
			var variables : XMLList = description..variable;
			var variablesString : Array = new Array();
			//add all variables
			for each (var child:XML in variables) {
				variablesString.push(child.@name + " = " + (child.@type == "Object" ? formatObject(this[child.@name]) : this[child.@name]));
			}
			//add all accessors
			var accessors:XMLList = description..accessor;
			for each (child in accessors){
				if(child.@access.toString() != "writeonly"){
					variablesString.push(child.@name + " = " + (child.@type == "Object" ? formatObject(this[child.@name]) : this[child.@name]));
				}
			}
			objectString += variablesString.join(", ");
			return objectString + ")";
		}
		//formats an anonymous object as {param1:value1, …, paramN:valueN}
		private function formatObject(object:Object):String{
			var varString:Array = new Array();
			for(var i:String in object){
				varString.push(i + ":" + object[i]);
			}
			return "{" + varString.join(", ") + "}";
		}
	}
}