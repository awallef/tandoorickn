package com.tandoorickn.ui.css
{
	import com.tandoorickn.ui.css.core.CoreCssSprite;
	import com.tandoorickn.ui.css.core.CoreCssStyle;
	import com.tandoorickn.utils.random.RandomChar;
	
	public class CssSprite extends CoreCssSprite
	{
		
		public var  classes				:Array,
					id					:String;
					
		private var _childIndex			:uint;
		
		public function CssSprite(id:String = null, classes:Array = null, css:CoreCssStyle=null, overCss:Object=null)
		{
			super(css, overCss);
			
			this.id = (!id)? "#"+RandomChar.randomiz(10) : id;
			this.classes = (!classes)? [] : classes;
			
		}
		
		public function addCssSprite(cssObject:CssSprite,index:uint):void
		{
			this.addCssObject(cssObject,cssObject.id);
		}
	}
}