/**
 * @author hems
 * 
 */
class cocktail.utils.ClassFinder {
	
	//mtasc and MMC compatible
	public static function findClass(fullClassName : String, throw_error : Boolean) : Function	{
		var result : Object;
		var class_ref : Function;
		var tokens : Array;
		var i : Number;
		if (fullClassName == null) return null;
		throw_error = throw_error == undefined ? true : throw_error;
		
		result = _global;
		tokens = fullClassName.split(".");
		
		for (i = 0; i < tokens.length; i++) {
			if (i == tokens.length -1) {
				class_ref = result[tokens[i]];
			} else {
				result = result[tokens[i]]
			}
		}
		
		if (result == null && throw_error) {
			trace("ClassFinder.findClass Could not find class :" + fullClassName);
		}

		return class_ref
	}

}