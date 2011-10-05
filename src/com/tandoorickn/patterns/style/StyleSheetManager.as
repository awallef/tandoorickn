package com.tandoorickn.patterns.style
{
	import com.tandoorickn.patterns.facade.AbstractFacade;
	import com.tandoorickn.ui.css.CssSprite;
	import com.tandoorickn.ui.css.CssStyleSheet;
	import com.tandoorickn.ui.css.core.CoreCssStyle;

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
		
		public function setStyleForElement(cssSprite:CssSprite):void
		{
			var mergedCssStyle:CoreCssStyle = new CoreCssStyle();
			for(var i:uint = 0; i < cssSprite.classes.length; i++)
				mergedCssStyle.merge( this.retrieveStyle(cssSprite.classes[i]).cloneAsObject() );
			
			mergedCssStyle.merge( this.retrieveStyle(cssSprite.id).cloneAsObject() );
			cssSprite.style = mergedCssStyle;
		}
		
		public function retrieveStyle(classOrId:String):CoreCssStyle
		{
			var mergedCssStyle:CoreCssStyle = new CoreCssStyle();
			for(var j:uint = 0; j < _sheetOrder.length; j++)
			{
				var tStyle:CoreCssStyle = (_sheetMap[_sheetOrder[j]] as CssStyleSheet).retrieveStyle(classOrId);
				if(tStyle) mergedCssStyle.merge( tStyle.cloneAsObject() );
			}
			
			return mergedCssStyle;
		}
	}
}