﻿package  com.tandoorickn.ui.css.core{		import com.tandoorickn.debug.Log;		import flash.text.Font;	import flash.text.TextFieldType;	import flash.text.TextFormatAlign;	import flash.utils.describeType;
		public class CoreCssStyle	{				public  var padding						:Array 				= [0,0,0,0],					margin						:Array 				= [0,0,0,0],															backgroundColor				:uint 				= 0XFFFFFF,					backgroundAlpha				:Number 			= 0,					alpha						:Number 			= 1,					visible						:Boolean 			= true,										width						:String 			= "100%",					height						:String 			= "100%",					minHeight					:String 			= "0px",					minWidth					:String 			= "0px",										left						:String 			= "0px",					top							:String 			= "0px",					bottom						:String 			= "0px",					right						:String 			= "0px",										multiline					:Boolean			= true,					background					:Boolean			= false,					textAlpha					:Number				= 1,					textBorder					:Boolean			= false,					selectable					:Boolean			= false,					embedFonts					:Boolean			= false,					type						:String 			= TextFieldType.DYNAMIC,					wordWrap 					:Boolean			= true,					displayAsPassword			:Boolean			= false,										font						:Font				= null,					color						:uint 				= 0x000000,					size						:Number				= 10,					align						:String				= TextFormatAlign.LEFT,					bold						:Boolean			= false,					italic						:Boolean			= false,					underline					:Boolean			= false,					maxChars					:int				= 0,																	verticalAlign				:String				= CoreCssAlign.TOP,					horizontalAlign				:String				= CoreCssAlign.LEFT,										borderTop					:Array				= [0,0X000000,1],					borderRight					:Array				= [0,0X000000,1],					borderBottom				:Array				= [0,0X000000,1],					borderLeft					:Array				= [0,0X000000,1],										borderRadius				:Array 				= [0,0,0,0],										overflow					:String				= CoreCssOverflow.AUTO,					scrollType					:String				= CoreCssScrollMode.MAC_LIKE,					scrollThickness				:Number				= 10,					scrollSliderMinLength		:Number				= 10,					scrollBackgroundColor		:uint				= 0xeeeeee,					scrollScrollAlpha			:Number 			= 1,					scrollScrollColor			:uint				= 0xaaaaaa,					scrollBackgroundAlpha		:Number 			= 1,										gradient					:CoreCssGradient	= null,										filters						:Array				= [],										buttonMode					:Boolean			= false,					mouseEnable					:Boolean			= true,										debug						:Boolean			= true;						public function merge(obj:Object):void		{			for( var i:String in obj)  			{								Log.debug("CoreCssStyle",i,":",this[i]," => ",obj[i]);				this[i] = obj[i];			}		}				public function CoreCssStyle(css:Object = null)		{			this.merge(css);		}		public function cloneAsObject():Object		{			var obj:Object = {};			var varList:XMLList = describeType(this)..variable;			for(var i:int; i < varList.length(); i++) obj[varList[i].@name] = this[varList[i].@name];			return obj;		}				public function cloneAsObjectWithNewValues(newObject:Object):Object		{			var obj:Object = {};			var varList:XMLList = describeType(this)..variable;			for(var i:int; i < varList.length(); i++)			{				if(newObject[varList[i].@name] != this[varList[i].@name]) obj[varList[i].@name] = this[varList[i].@name];				else obj[varList[i].@name] = newObject[varList[i].@name];			}			return obj;		}				public function toString():String		{			var str:String = "";			var varList:XMLList = describeType(this)..variable;			for(var i:int; i < varList.length(); i++) str += varList[i].@name + "=>" + this[varList[i].@name] + "\n";			return str;		}	}	}