import flash.external.ExternalInterface;

class cocktail.utils.JSHelper {

	/**
	* 
	* @author	Henrique Matias
	* @version	0.1
	* @url		henriquematias.com
	* 
	* @param	filename
	* @param	width
	* @param	height
	* @param	align
	* @param	valign
	* @param	winName
	*/
	public static function openPop(filename:String, width:Number, height:Number, align:String, valign:String, winName:String) {
		var jsScript:String;

		align	= align		== undefined ? 'center' : align;
		valign	= valign	== undefined ? 'center' : valign;
		winName	= winName	== undefined ? String(getTimer()) : winName;

		jsScript = "function openPop(filename) {";
		jsScript += "var newWindow;";
		jsScript += "var xPos = ";

		switch(align) {
			case 'left':
				jsScript += "0;";
			break;
			case 'right':
				jsScript += "(screen.width - " + width  + ");";
			break;
			default:
				jsScript += "(screen.width - " + width  + ") / 2;";				
			break;
		}

		jsScript += "var yPos  = ";

		switch(valign) {
			case 'top':
				jsScript += "0;";
			break;
			case 'bottom':
				jsScript += "(screen.height - " + height + ");";
			break;
			default:
				jsScript += "(screen.height - " + height + ") / 2;";
			break;
		}

		jsScript += "	newWindow = window.open(filename, '" + winName + "',";
		jsScript += "'width=" + width + ",height=" + height + ",scrollbars=0,left='+xPos+',top='+yPos);";
		jsScript += "}";

		if(JSHelper.getBrowserName().indexOf('MSIE 7') != -1 || !ExternalInterface.available){
			getURL("javascript:"+jsScript+";openPop('"+filename+"');");
		} else {
			ExternalInterface.call(jsScript, filename);
		}
	}
	
	public static function getBrowserName ():String {
		var jsName:String;
		
		jsName = 'function getAppName() {return navigator.appName}';
		
		return String(ExternalInterface.call(jsName));
	}
}