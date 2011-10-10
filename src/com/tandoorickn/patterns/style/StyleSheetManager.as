package com.tandoorickn.patterns.style
{
	import com.tandoorickn.debug.Log;
	import com.tandoorickn.interfaces.ui.css.ICssSprite;
	import com.tandoorickn.patterns.facade.AbstractFacade;
	import com.tandoorickn.ui.css.CssSprite;
	import com.tandoorickn.ui.css.CssStyleSheet;
	import com.tandoorickn.ui.css.core.CoreCssSprite;
	import com.tandoorickn.ui.css.core.CoreCssStyle;
	import com.tandoorickn.utils.types.ObjectUtils;

	public class StyleSheetManager
	{
		
		private var	_sheetMap				:Object,
					_sheetOrder				:Array;
		
		public function StyleSheetManager()
		{
			_sheetMap = {};
			_sheetOrder = [];
		}
		
		public function addSytleSheet(name:String,sheet:CssStyleSheet):void
		{
			_sheetMap[name] = sheet;
			_sheetOrder.push(name);
		}
		
		public function removeStyleSheet(name:String):void
		{
			this._sheetMap[name] = null;
			var index:int = _sheetOrder.indexOf(name);
			if(index != -1) _sheetOrder.splice(index,1);
		}
		
		public function setStyleForElement(cssSprite:ICssSprite):void
		{
			
			var mergedCssStyle:Object = {};
			for(var i:uint = 0; i < cssSprite.classes.length; i++)
				ObjectUtils.merge(mergedCssStyle,this.retrieveStyle(cssSprite.classes[i]));
			
			ObjectUtils.merge(mergedCssStyle, this.retrieveStyle(cssSprite.id));
			
			//Log.debug("styleSheetManager","merge csssprite:",cssSprite.id);
			cssSprite.style.merge(mergedCssStyle);
			( cssSprite as CoreCssSprite).originalStyleWidth = cssSprite.style.width;
			( cssSprite as CoreCssSprite).originalStyleHeight = cssSprite.style.height;
		}
		
		public function isRegistered(classOrId:String):Boolean
		{
			var registered:Boolean = false;
			for(var j:uint = 0; j < _sheetOrder.length; j++)
			{
				var tStyle:Object = (_sheetMap[_sheetOrder[j]] as CssStyleSheet).retrieveStyle(classOrId);
				if(tStyle)
				{
					registered = true;
					break;
				}
			}
			
			return registered;
		}
		
		public function retrieveStyle(classOrId:String):Object
		{
			var mergedCssStyle:Object = {};
			for(var j:uint = 0; j < _sheetOrder.length; j++)
			{
				var tStyle:Object = (_sheetMap[_sheetOrder[j]] as CssStyleSheet).retrieveStyle(classOrId);
				if(tStyle)
					ObjectUtils.merge(mergedCssStyle,tStyle);
			}
			
			return mergedCssStyle;
		}
	}
}