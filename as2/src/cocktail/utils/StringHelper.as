
class cocktail.utils.StringHelper {
	
	/**
	* Replace string by pattern
	* 
	* @param	string
	* @param	pattern
	* @param	replace
	* @return  
	*/
	public static function replace(string:String, pattern:String, replace:String):String {
		return string.split(pattern).join(replace);
	}
	
	/**
	* Capitalize string
	* 
	* @param	string
	* @return
	*/
	public static function capitalize(string:String):String {
		return string.charAt(0).toUpperCase() + string.substr(1);
	}

	
	/**
	* Left trim
	* 
	* @param	string
	* @return
	*/
	public static function leftTrim(string:String):String {
		var i:Number = -1;
		var result:String = "";
		
		while(i++ < string.length && (string.charCodeAt(i) <= 32 || string.charCodeAt(i) >= 255)){};
		
		result = string.substr(i);
		
		return result;
	}
	
	/**
	* Right trim
	* 
	* @param	string
	* @return
	*/
	public static function rightTrim(string:String):String {
		var i:Number = string.length;
		var result:String = "";
		
		while(i-- > 0 && (string.charCodeAt(i) <= 32 || string.charCodeAt(i) >= 255)){};
		
		result = string.substr(0, i + 1);
		return result;
	}
	
	/**
	* Trim
	* 
	* @param	string
	* @return
	*/
	public static function trim(string:String):String {
		return StringHelper.leftTrim(StringHelper.rightTrim(string));
	}
	
	/**
	* 
	* @param	string %s will be replaced by another parameters
	* @param	input use many arguments as needed
	* @return
	*/
	public static function sprintf(string:String, input:String):String {
		var split:Array;
		var out:String;
		var i:Number;
		
		i = 0;
		out = '';
		split = string.split("%s");
		
		for(; i + 1 < split.length; i++){
			out += split[i] + arguments[(i + 1)];
		}
		
		return out;
	}
	
	/**
	* Ccans through the string looking dictionary key enclosed in { } braces. 
	* If is found, replace with the respective value on dicionary
	* @param	string
	* @param	dictionary	format : { word : value }
	* @return
	*/
	public static function supplant (string:String, dictionary:Object) : String {
		var word:String;
		
		for(word in dictionary) {
			string = StringHelper.replace(string, '{' + word + '}', dictionary[word]);
		}
		
		return string;
	}
	
	/**
	* Clean extras ASCII chars between 192 to 252 code
	* 
	* @param	string
	* @return
	*/
	public static function cleanExtraASCIIChars(string:String):String {
		var result:String;
		var extraChars:String;
		var normalChars:String;
		var stringCode:Number;
		var replaceChar:String;
		var i:Number;
		var j:Number;
		
		extraChars 	= "àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ";
		normalChars = "aaeouaoaeioucuAAEOUAOAEIOUCU";
		
		result = "";
		
		i = 0;
		
		while(i < string.length) {
			
			stringCode = string.charCodeAt(i);
			
			if(stringCode > 192 && stringCode < 252) {
				j = 0;
				
				replaceChar = string.charAt(i);
				
				while(j < extraChars.length) {
					if(replaceChar == extraChars.charAt(j)) {
						 result += normalChars.charAt(j);
					}
					j++;
				}
			}
			else {
				result += string.charAt(i);
			}
			
			i++;
		}
		return result;
	}
	
	
	/**
	 * Searches the string and returns has occurrence
	 * 
	 * 
	 * @param	string
	 * @param	search
	 * @return
	 */
	public static function contains(string:String, search:String):Boolean {
		return string.indexOf(search) != -1;
	}
	
	/**
	* 
	* Wrap text into blocks/lines according the given "charsPerLine" parameter
	* 
	* @param	source - Text to be wraped
	* @param	charsPerLine - Limit of chars per line/block
	* @param	useDivider - The default is "\r" but you can use the divider you need
	* 
	* @return The text wraped with the specified divider
	* 
	* TODO:Implement another line/block break-points, and not only blank-spaces, i.e.: "-"
	* 
	**/
	public static function wrap(source:String, charsPerLine:Number, useDivider:String):String {
		var src:Array;
		var step:String;
		var line:String;
		var output:String;
		
		src = source.split(" ");
		step = "";
		output = "";
		
		while (src.length) {
			if ((line.length + src[0].length + 1) <= charsPerLine) {
				step += (src.shift() +" ");
			} else {
				output += (step + useDivider);
				step = "";
			}
		}
		
		return output;
	}
}
