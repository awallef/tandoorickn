package com.tandoorickn.patterns.dom
{
	import com.tandoorickn.patterns.style.StyleSheetManager;
	import com.tandoorickn.ui.css.CssLayout;
	import com.tandoorickn.ui.css.CssSprite;
	import com.tandoorickn.ui.css.CssStage;
	import com.tandoorickn.ui.css.CssStyleSheet;
	
	import flash.display.Stage;

	public class InternalDom
	{
		
		private var		_tree			:Object,
						_stage			:CssStage,
						_style			:StyleSheetManager,
						_containers		:Object;
		
		public function InternalDom()
		{
			_tree = {};
			_containers = {};
			_style = new StyleSheetManager();
		}
		
		public function get style():StyleSheetManager				{ return _style; }
		
		public function set cssStage(value:CssStage):void			{ _stage = value; }
		
		public function get cssStage():CssStage						{ return _stage; }
		
		public function get containers():Object						{ return _containers; }
		
		public function set containers(value:Object):void 			{ containers = value; }
		
		public function addStyleSheet(name:String, sheet:CssStyleSheet, andRefresh:Boolean = true ):void
		{
			_style.addSytleSheet(name,sheet);
			if(andRefresh) this.refresh();
		}
		
		public function refresh():void
		{
			for(var i:String in _tree) _style.setStyleForElement(	_tree[i] );	
			for( i in containers ) containers[i].refresh();
			if(_stage) _stage.refresh();
		}
		
		public function registerDomElement(cssSprite:CssSprite):CssSprite
		{
			_tree[cssSprite.id] = cssSprite;
			return cssSprite;
		}
		
		public function retrieveDomElement(id:String):CssSprite
		{
			return (_tree[id])? _tree[id] : null;
		}
		
		public function castDomElement(id:String,classRef:Class):*
		{
			return (_tree[id])? ( _tree[id] as classRef) : null;
		}
		
		public function removeDomElement(id:String):void
		{
			_tree[id] = null;
		}
	}
}