import dragonfly.plugins.core.Values;

/**
 * Define values of BlurEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see BlurEgg
 * @see Values
 */
class dragonfly.plugins.larvas.lib.filters.values.BlurValues extends Values {
	
	// [ PUBLIC - properties ] ***********************************************/
	
	/**
	 * The amount of horizontal blur. Valid values are from 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 */
	public var X:Number;
	
	/**
	 * The amount of vertical blur. Valid values are from 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 */
	public var Y:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a BlurValues object.
	 * 
	 * @param x The amount to blur horizontally. Valid values are from 0 to 255 (floating-point value). The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param y The amount to blur vertically. Valid values are from 0 to 255 (floating-point value). The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 */
	public function BlurValues (x:Number, y:Number) {
		this.X = x;
		this.Y = y;
	}
	
}