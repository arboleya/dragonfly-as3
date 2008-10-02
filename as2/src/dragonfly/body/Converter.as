
/**
 * Class to hold some basic types of conversion.
 * Usually used by Nymph class.
 * 
 * @author nybras | nybras@codeine.it
 * @see	Nymph
 */
class dragonfly.body.Converter {
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new Converter object.
	 */
	public function Converter ( ) {
		
	}
	
	
	
	
	
	// [ PUBLIC - Color Convertions ] ****************************************/
	
	/**
	 * @private
	 * Conversion functions (for hexa/color tweening).
	 * 
	 * @param rgb Array with the RGB (3 indexes: 0=R, 1=G, 2=B) to be converted.
	 * 
	 * @return RGB into HEXADECIMAL.
	 */
	public static function rgb2hex (rgb : Array) : Number {
		return (rgb[0] << 16 | rgb[1] << 8 | rgb[2]);
	}
	
	/**
	 * @private
	 * Conversion functions (for hexa/color tweening).
	 * 
	 * @param hex The hexadecimal to be converted.
	 * 
	 * @return HEXADECIMAL INTRO RGB (array with 3 indexes: 0=R, 1=G, 2=B).
	 */
	public static function hex2rgb (hex : Number) : Array {
		return new Array(
			(hex >> 16),
			(hex >> 8 & 0xFF),
			(hex & 0xFF)
		);
	}

}