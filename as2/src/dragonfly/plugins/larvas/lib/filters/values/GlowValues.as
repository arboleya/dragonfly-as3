import dragonfly.plugins.core.Values;

/**
 * Define values of GlowEgg.
 * @see GlowEgg
 * @see Values
 */
class dragonfly.plugins.larvas.lib.filters.values.GlowValues extends Values {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * The color of the glow. Valid values are in the hexadecimal format <i>0xRRGGBB</i>.
	 * The default value is 0xFF0000.
	 */
	public var COLOR:Number;
	
	/**
	 * The alpha transparency value for the color. Valid values are 0 to 1.
	 * For example, 0.25 sets a transparency value of 25%. The default value is 1.
	 */
	public var ALPHA:Number;
	
	/**
	 * The amount of horizontal blur. Valid values are 0 to 255 (floating point).
	 * The default value is 6. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 */
	public var BLUR_X:Number;
	
	/**
	 * The amount of vertical blur. Valid values are 0 to 255 (floating point).
	 * The default value is 6. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 */
	public var BLUR_Y:Number;
	
	/**
	 * The strength of the imprint or spread. The higher the value,
	 * the more color is imprinted and the stronger the contrast between
	 * the glow and the background. Valid values are 0 to 255. The default is 2.
	 */
	public var STRENGTH:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a GlowValues object.
	 * 
	 * @param color The color of the glow, in the hexadecimal format 0xRRGGBB. The default value is 0xFF0000.
	 * @param alpha The alpha transparency value for the color. Valid values are 0 to 1. For example, .25 sets a transparency value of 25%. The default value is 1.
	 * @param blurX The amount of horizontal blur. Valid values are 0 to 255 (floating point). The default value is 6. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param blurY The amount of vertical blur. Valid values are 0 to 255 (floating point). The default value is 6. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param strength The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the glow and the background. Valid values are 0 to 255. The default is 2.
	 */
	public function GlowValues (color : Number, alpha : Number, blurX : Number, blurY : Number, strength : Number) {
		this.COLOR = color;
		this.ALPHA = alpha;
		this.BLUR_X = blurX;
		this.BLUR_Y = blurY;
		this.STRENGTH = strength;
	}
	
}







