/**
* ...
* @author hems
*/

class cocktail.utils.FileHelper {
	
	/**
	* Returns filename of path
	* @param	file
	* @return
	*/
	public static function baseName(path:String):String {
		return path.substr(path.lastIndexOf('/')+1);
	}
	
	/**
	* Returns dir of path
	* @param	file
	* @return
	*/
	public static function dirName(path:String):String {
		return path.substr(0, path.lastIndexOf('/')+1);
	}
	
}