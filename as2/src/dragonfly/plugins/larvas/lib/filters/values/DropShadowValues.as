import dragonfly.plugins.core.Values;

/**
 * Define values of DropShadowEgg.
 * @see DropShadowEgg
 * @see Values
 */
class dragonfly.plugins.larvas.lib.filters.values.DropShadowValues extends Values {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * The offset distance for the shadow, in pixels. The default value is 4 (floating point).
	 */
	public var DISTANCE:Number;
	
	/**
	 * The angle of the shadow. Valid values are 0 to 360˚ (floating point).
	 * The default value is 45.
	 */
	public var ANGLE:Number;
	
	/**
	 * The color of the shadow. Valid values are in hexadecimal format <i>0xRRGGBB</i>.
	 * The default value is 0x000000.
	 */
	public var COLOR:Number;
	
	/**
	 * The alpha transparency value for the shadow color. Valid values are 0 to 1.
	 * For example, 0.25 sets a transparency value of 25%. The default value is 1.
	 */
	public var ALPHA:Number;
	
	/**
	 * The amount of horizontal blur. Valid values are 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 */
	public var BLUR_X:Number;
	
	/**
	 * The amount of vertical blur. Valid values are 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 */
	public var BLUR_Y:Number;
	
	/**
	 * The strength of the imprint or spread. The higher the value, the more color is imprinted
	 * and the stronger the contrast between the shadow and the background. Valid values are
	 * from 0 to 255. The default is 1.
	 */
	public var STRENGTH:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a DropShadowValues object.
	 * 
	 * @param distance The offset distance for the shadow, in pixels. The default value is 4 (floating point).
	 * @param angle	The angle of the shadow, 0 to 360� (floating point). The default value is 45.
	 * @param color	The color of the shadow, in hexadecimal format 0xRRGGBB. The default value is 0x000000.
	 * @param alpha	The alpha transparency value for the shadow color. Valid values are 0 to 1. For example, 0.25 sets a transparency value of 25%. The default value is 1.
	 * @param blurX	The amount of horizontal blur. Valid values are 0 to 255 (floating point). The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param blurX	The amount of vertical blur. Valid values are 0 to 255 (floating point). The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param strength The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the shadow and the background. Valid values are 0 to 255. The default is 1.
	 */
	public function DropShadowValues (distance : Number, angle : Number, color : Number, alpha : Number, blurX : Number, blurY : Number, strength : Number) {
		this.DISTANCE = distance;
		this.ANGLE = angle;
		this.COLOR = color;
		this.ALPHA = alpha;
		this.BLUR_X = blurX;
		this.BLUR_Y = blurY;
		this.STRENGTH = strength;
	}
	
}