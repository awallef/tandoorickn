package com.tandoorickn.services.io.dom.model
{
	public class DomResource
	{
		static public var HTML:String 							= "DomResource.HTML";
		
		
		static public var XML_FLASH_JAVASCRIPT:String 			= "DomResource.XML_FLASH_JAVASCRIPT";
		
		static public var RAW_JAVASCRIPT:String 				= "DomResource.RAW_JAVASCRIPT";
		
		static public var RAW_CSS:String 						= "DomResource.RAW_CSS";
		
		
		
		static public var	tandooriDomUtils : XML =
			<script><![CDATA[
			function() {	
				
				if(typeof tandooriDomUtils == "undefined" || !tandooriDomUtils) {
					tandooriDomUtils = {};
				}
			
				tandooriDomUtils.alert = function(str) {
					alert(str);
				}
				
				tandooriDomUtils.testJquery = function() {
					if (typeof jQuery == 'undefined') return false;
					else return true;
				}
			
				tandooriDomUtils.testSwfobject = function() {
					if (typeof swfobject == 'undefined') return false;
					else return true;
				}
			
				tandooriDomUtils.append = function(elem) {
					jQuery(window.top.document).find("body").append(elem);
				}
				
				tandooriDomUtils.remove = function(elem) {
					jQuery(window.top.document).find(elem).remove();
				}
			
				tandooriDomUtils.setHtml = function(id,content) {
					jQuery(window.top.document).find(id).html(content);
				}
			
				tandooriDomUtils.getHtml = function(id) {
					return jQuery(window.top.document).find(id).html();
				}
			
				/*tandooriDomUtils.embedSWF = function(url, id, width, height, version, expressInstall, flashvars, params, attributes) {
					swfobject.embedSWF(url, id, width, height, version , expressInstall, flashvars, params, attributes);
				}*/
			}
				
			]]></script>;
		
		
	}
}