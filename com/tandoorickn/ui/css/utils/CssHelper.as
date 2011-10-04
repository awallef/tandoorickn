package com.tandoorickn.ui.css.utils
{
	import com.tandoorickn.ui.css.core.CoreCssAlign;
	import com.tandoorickn.ui.css.core.CoreCssSprite;
	
	import flash.geom.Point;
	
	public class CssHelper
	{
		public static function returnComputedSize(param:String,value:Number,type:String = "normal"):Number
		{
			var px:Number;
			if(param.lastIndexOf("%") == -1)
			{
				// px
				px = Number(param.substr(0,param.length - 2));
				
			}else{
				// %
				px = Number(param.substr(0,param.length - 1));
				px = ( px / 100 ) * value;
			}
			
			switch(type)
			{
				case "normal":
					px = Math.min(px,value);
					break;
				
				case "size":
					// px = px;
					break;
			}
			
			return px;
		}
	
		public static function findOutHeight(cssSprite:CoreCssSprite,h:Number):Number
		{
			var tmpTop:Number = CssHelper.returnComputedSize( cssSprite.style.top , h );
			var tmpBottom:Number = CssHelper.returnComputedSize( cssSprite.style.bottom , h );
			
			var outHeight:Number = CssHelper.returnComputedSize(cssSprite.style.height ,h - tmpTop - tmpBottom );
			
			return outHeight;
		}
		
		public static function findOutWidth(cssSprite:CoreCssSprite,w:Number):Number
		{
			var tmpLeft:Number = CssHelper.returnComputedSize( cssSprite.style.left , w );
			var tmpRight:Number = CssHelper.returnComputedSize( cssSprite.style.right , w );
			
			var outWidth:Number = CssHelper.returnComputedSize(cssSprite.style.width ,w - tmpLeft - tmpRight );
			
			return outWidth;
		}
		
	
		public static function findMinSize(cssSprite:CoreCssSprite,w:Number,h:Number):void
		{
			var i:String ;
			
			// WIDTH
			var min:Number = CssHelper.returnComputedSize(cssSprite.style.minWidth,w,"size");
			if(cssSprite.style.horizontalAlign == CoreCssAlign.LEFT) min += CssHelper.returnComputedSize(cssSprite.style.left,w,"size");
			if(cssSprite.style.horizontalAlign == CoreCssAlign.RIGHT) min += CssHelper.returnComputedSize(cssSprite.style.right,w,"size");
			
			for(i in cssSprite.item) min = Math.max(min,( cssSprite.item[i] as CoreCssSprite).minWidth);	
			cssSprite.minWidth =  (isNaN(min))? 0: min;
			
			// HEIGHT
			min = CssHelper.returnComputedSize(cssSprite.style.minHeight,h,"size");
			if(cssSprite.style.verticalAlign == CoreCssAlign.TOP) min += CssHelper.returnComputedSize(cssSprite.style.top,h,"size");
			if(cssSprite.style.verticalAlign == CoreCssAlign.BOTTOM) min += CssHelper.returnComputedSize(cssSprite.style.bottom,h,"size");
			
			for(i in cssSprite.item) min = Math.max(min,( cssSprite.item[i] as CoreCssSprite).minHeight);
			cssSprite.minHeight =  (isNaN(min))? 0: min;
		}
		
		// HORIZONTAL
		
		public static function insideHorizontalAlign(cssSprite:CoreCssSprite,outWidth:Number,outX:Number):Array
		{
			var outPoint:Point = new Point(outX,outWidth);
			
			var marginWidth:Number = outWidth - ( cssSprite.style.margin[1]  + cssSprite.style.margin[3] );
			var marginX:Number = outX + cssSprite.style.margin[3];
			var marginPoint:Point = new Point(marginX,marginWidth);
			
			var borderWidth:Number = marginWidth - ( cssSprite.style.borderRight[0] + cssSprite.style.borderLeft[0] );
			var boderX:Number = marginX + cssSprite.style.borderLeft[0];
			var boderPoint:Point = new Point(boderX,borderWidth);
			
			var paddingWidth:Number = borderWidth - ( cssSprite.style.padding[1]  + cssSprite.style.padding[3] );
			var paddingX:Number = boderX + cssSprite.style.padding[3];
			var paddingPoint:Point = new Point(paddingX,paddingWidth);
			
			return [outPoint,marginPoint,boderPoint,paddingPoint];
		}
		
		// VERTICAL
		
		public static function insideVerticalAlign(cssSprite:CoreCssSprite,outHeight:Number,outY:Number):Array
		{
			var outPoint:Point = new Point(outY,outHeight);
			
			var marginHeight:Number = outHeight - ( cssSprite.style.margin[0]  + cssSprite.style.margin[2] );
			var marginY:Number = outY + cssSprite.style.margin[0];
			var marginPoint:Point = new Point(marginY,marginHeight);
			
			var borderHeight:Number = marginHeight - ( cssSprite.style.borderTop[0] + cssSprite.style.borderBottom[0] );
			var boderY:Number = marginY + cssSprite.style.borderTop[0];
			var boderPoint:Point = new Point(boderY,borderHeight);
			
			var paddingHeight:Number = borderHeight - ( cssSprite.style.padding[0]  + cssSprite.style.padding[2] );
			var paddingY:Number = boderY + cssSprite.style.padding[0];
			var paddingPoint:Point = new Point(paddingY,paddingHeight);
			
			return [outPoint,marginPoint,boderPoint,paddingPoint];
		}
	}
}