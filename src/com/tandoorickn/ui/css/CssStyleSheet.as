package com.tandoorickn.ui.css
{
	import com.tandoorickn.ui.css.core.CoreCssStyle;

	public class CssStyleSheet
	{
		protected var 	_styles				:Object,
						_name				:String;
		
		public function CssStyleSheet()
		{
			_styles = {};
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get name():String
		{
			return _name;
		}
					
		public function registerStyle(classOrId:String, style:CoreCssStyle):void
		{
			_styles[classOrId] = style;
		}
		
		public function retrieveStyle(classOrId:String):CoreCssStyle
		{
			return (_styles[classOrId])? _styles[classOrId] : null;
		}
	}
}