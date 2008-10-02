
import dragonfly.plugins.core.Values;

/**
 * Define values of ColorHsbEfx.
 * 
 * @author nybras | nybras@codeine.it
 * @see ColorHsbEfx
 */
class dragonfly.plugins.efx.lib.colorhsb.ColorHsbValues extends Values {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * From -180 to 180, other values will be converte as % 180.
	 */
	public var HUE:Number;
	
	/**
	 * From -100 no upper limit, just test it.
	 */
	public var SATURATION:Number;
	
	/**
	 * No limits, just test it.
	 */
	public var CONTRAST:Number;
	
	/**
	 * From -100 to 100.
	 */
	public var BRIGHTNESS:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 *  Create a ColorHsbValues object.
	 * 
	 * @param	hue	From -180 to 180, other values will be converte as % 180.
	 * @param	saturation	From -100 no upper limit, just test it.
	 * @param	contrast	No limits, just test it.
	 * @param	brightness	From -100 to 100.
	 */
	public function ColorHsbValues ( hue : Number, saturation : Number, contrast : Number, brightness : Number ) {
		this.HUE = hue || 0;
		this.SATURATION = saturation || 0;
		this.CONTRAST = contrast || 0;
		this.BRIGHTNESS = brightness || 0;
	}
	
	
	
	
	
	// [ GETTERs ] ***********************************************************/
	
	/**
	 * Parses the values into an array [ hue, saturation, brightness, contrast, brightness ] ans return it.
	 */
	public function get values () : Array {
		return [ this.HUE, this.SATURATION, this.CONTRAST, this.BRIGHTNESS ];
	}
	
	
	
	
	
	// [ TOSTRING ] **********************************************************/
	
	/**
	 * Parses the data to string.
	 * 
	 * @return	The data parsed into a string format.
	 */
	private function toString () : String {
		return "hue="+ this.HUE +", saturation="+ this.SATURATION +", contrast="+ this.CONTRAST +", brightness="+ this.BRIGHTNESS;
	}
}