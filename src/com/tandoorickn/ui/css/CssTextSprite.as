package com.tandoorickn.ui.css
{
	import com.tandoorickn.interfaces.ui.css.ICssSprite;
	import com.tandoorickn.ui.css.core.CoreCssSprite;
	import com.tandoorickn.ui.css.core.CoreCssStyle;
	import com.tandoorickn.ui.css.core.CoreCssTextSprite;
	import com.tandoorickn.utils.random.RandomChar;
	
	public class CssTextSprite extends CoreCssTextSprite implements ICssSprite
	{
		private var _classes			:Array,
					_id					:String;
		
		private var _childIndex			:uint;
		
		public function CssTextSprite(id:String = null, classes:Array = null, css:CoreCssStyle=null, overCss:Object=null)
		{
			super(css, overCss);
			
			this.id = (!id)? "#"+RandomChar.randomiz(10) : id;
			this.classes = (!classes)? [] : classes;
			
		}
		
		public function get classes():Array
		{
			return this._classes;
		}
		
		public function set classes(value:Array):void
		{
			this._classes = value;
		}
		
		public function get id():String
		{
			return this._id;
		}
		
		public function set id(value:String):void
		{
			this._id = value;
		}
		
		public function addCssSprite(cssObject:ICssSprite,index:uint):void
		{
			this.addCssObject(cssObject as CoreCssSprite, cssObject.id);
		}
	}
}