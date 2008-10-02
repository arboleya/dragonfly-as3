import dragonfly.plugins.core.Values;

/**
 * Define values of GradientBevelEgg and GradientGlow.
 * @see GradientBevelEgg
 * @see GradientGlowEgg
 * @see Values
 */
class dragonfly.plugins.larvas.lib.filters.values.GradientValues extends Values {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * The offset distance of the glow. The default value is 4.
	 * @see GradientGlowEgg
	 */
	public var DISTANCE:Number;
	
	/**
	 * The angle, in degrees. Valid values are 0 to 360. The default is 45. 
	 */
	public var ANGLE:Number;
	
	/**
	 * The amount of horizontal blur. Valid values are 0 to 255. A blur of 1 or less means
	 * that the original image is copied as is. The default value is 4. Values that are a
	 * power of 2 (such as 2, 4, 8, 16, and 32) are optimized to render more quickly than
	 * other values.
	 */
	public var BLUR_X:Number;
	
	/**
	 * The amount of vertical blur. Valid values are 0 to 255. A blur of 1 or less
	 * means that the original image is copied as is. The default value is 4.
	 * Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to
	 * render more quickly than other values.
	 */
	public var BLUR_Y:Number;
	
	/**
	 * The strength of the imprint or spread. The higher the value, the more color
	 * is imprinted and the stronger the contrast between the bevel and the background.
	 * Valid values are 0 to 255. A value of 0 means that the filter is not applied.
	 * The default value is 1.
	 */
	public var STRENGTH:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a GradientValues object.
	 * 
	 * @param distance The offset distance of the glow. The default is 4.
	 * @param angle The angle, in degrees. Valid values are 0 to 360. The default is 45.
	 * @param blurX The amount of horizontal blur. Valid values are 0 to 255. A blur of 1 or less means that the original image is copied as is. The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param blurY The amount of vertical blur. Valid values are 0 to 255. A blur of 1 or less means that the original image is copied as is. The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param strength The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the glow and the background. Valid values are 0 to 255. The larger the value, the stronger the imprint. A value of 0 means the filter is not applied. The default value is 1.
	 */
	public function GradientValues (distance : Number, angle : Number, blurX : Number, blurY : Number, strength : Number) {
		this.DISTANCE = distance;
		this.ANGLE = angle;
		this.BLUR_X = blurX;
		this.BLUR_Y = blurY;
		this.STRENGTH = strength;
	}
}