import dragonfly.plugins.core.Values;

/**
 * Define values of BevelEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see BevelEgg
 * @see Values
 */
class dragonfly.plugins.larvas.lib.filters.values.BevelValues extends Values {
	
	// [ PUBLIC - properties ] ***********************************************/
	
	/**
	 * The offset distance of the bevel. Valid values are in pixels (floating point).
	 * The default value is 4.
	 */
	public var DISTANCE:Number;
	
	/**
	 * The angle of the bevel. Valid values are from 0 to 360 degrees.
	 * The default value is 45.
	 */
	public var ANGLE:Number;
	
	/**
	 * The highlight color of the bevel. Valid values are in hexadecimal format,
	 * <i>0xRRGGBB</i>. The default value is 0xFFFFFF.
	 */
	public var HIGHLIGHTCOLOR:Number;
	
	/**
	 * The alpha transparency value of the highlight color. The value is specified
	 * as a normalized value from 0 to 1. For example, 0.25 sets a transparency value of 25%.
	 * The default value is 1.
	 */
	public var HIGHLIGHTALPHA:Number;
	
	/**
	 * The shadow color of the bevel. Valid values are in hexadecimal format, <i>0xRRGGBB</i>.
	 * The default value is 0x000000.
	 */
	public var SHADOWCOLOR:Number;
	
	/**
	 * The alpha transparency value of the shadow color. This value is specified
	 * as a normalized value from 0 to 1. For example, 0.25 sets a transparency value of 25%.
	 * The default value is 1.
	 */
	public var SHADOWALPHA:Number;
	
	/**
	 * The amount of horizontal blur in pixels. Valid values are from 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16, and 32) are
	 * optimized to render more quickly than other values.
	 */
	public var BLURX:Number;
	
	/**
	 * The amount of vertical blur in pixels. Valid values are from 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16, and 32) are
	 * optimized to render more quickly than other values.
	 */
	public var BLURY:Number;
	
	/**
	 * The strength of the imprint or spread. Valid values are from 0 to 255.
	 * The larger the value, the more color is imprinted and the stronger the
	 * contrastbetween the bevel and the background. The default value is 1.
	 */
	public var STRENGTH:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a BevelValues object.
	 * 
	 * @param distance The offset distance of the bevel, in pixels (floating point). The default value is 4.
	 * @param angle	The angle of the bevel, from 0 to 360 degrees. The default value is 45.
	 * @param highlightColor The highlight color of the bevel, 0xRRGGBB. The default value is 0xFFFFFF.
	 * @param highlightAlpha The alpha transparency value of the highlight color. Valid values are 0 to 1. For example, .25 sets a transparency value of 25%. The default value is 1.
	 * @param shadowColor The shadow color of the bevel, 0xRRGGBB. The default value is 0x000000.
	 * @param shadowAlpha The alpha transparency value of the shadow color. Valid values are 0 to 1. For example, 0.25 sets a transparency value of 25%. The default value is 1.
	 * @param blurX The amount of horizontal blur in pixels. Valid values are 0 to 255 (floating point). The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param blurY The amount of vertical blur in pixels. Valid values are 0 to 255 (floating point). The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param strength The strength of the imprint or spread. The larger the value, the more color is imprinted and the stronger the contrast between the bevel and the background. Valid values are 0 to 255. The default value is 1.
	 */
	public function BevelValues (distance : Number, angle : Number, highlightColor : Number, highlightAlpha : Number, shadowColor : Number, shadowAlpha : Number, blurX : Number, blurY : Number, strength : Number) {
		this.DISTANCE = distance;
		this.ANGLE = angle;
		this.HIGHLIGHTCOLOR = highlightColor;
		this.HIGHLIGHTALPHA = highlightAlpha;
		this.SHADOWCOLOR = shadowColor;
		this.SHADOWALPHA = shadowAlpha;
		this.BLURX = blurX;
		this.BLURY = blurY;
		this.STRENGTH = strength;
	}
}