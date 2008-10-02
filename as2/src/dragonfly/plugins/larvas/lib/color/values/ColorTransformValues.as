import dragonfly.plugins.core.Values;

/**
 * Define values of ColorTransformEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see ColorTransformEgg
 * @see Values
 */
class dragonfly.plugins.larvas.lib.color.values.ColorTransformValues extends Values {
	
	// [ PUBLIC - properties ] ***********************************************/
	
	/**
	 * A decimal value that is multiplied by the red channel value.
	 */
	public var RED_MULTIPLIER : Number;
	
	/**
	 * A decimal value that is multiplied by the green channel value.
	 */
	public var GREEN_MULTIPLIER : Number;
	
	/**
	 * A decimal value that is multiplied by the blue channel value.
	 */
	public var BLUE_MULTIPLIER : Number;
	
	/**
	 * A decimal value that is multiplied by the alpha transparency channel value.
	 */
	public var ALPHA_MULTIPLIER : Number;
	
	/**
	 * A number from -255 to 255 that is added to the red channel value after it has been multiplied by the redMultiplier value.
	 */
	public var RED_OFFSET : Number;
	
	/**
	 * A number from -255 to 255 that is added to the green channel value after it has been multiplied by the greenMultiplier value.
	 */
	public var GREEN_OFFSET : Number;
	
	/**
	 * A number from -255 to 255 that is added to the blue channel value after it has been multiplied by the blueMultiplier value.
	 */
	public var BLUE_OFFSET : Number;
	
	/**
	 * A number from -255 to 255 that is added to the alpha transparency channel value after it has been multiplied by the alphaMultiplier value.
	 */
	public var ALPHA_OFFSET : Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a ColorTransformValues object.
	 * 
	 * @param	red_multiplier	A decimal value that is multiplied by the red channel value.
	 * @param	green_multiplier	A decimal value that is multiplied by the green channel value.
	 * @param	blue_multiplier	A decimal value that is multiplied by the blue channel value.
	 * @param	alpha_multiplier	A decimal value that is multiplied by the alpha transparency channel value.
	 * @param	red_offset	A number from -255 to 255 that is added to the red channel value after it has been multiplied by the redMultiplier value.
	 * @param	green_offset	A number from -255 to 255 that is added to the green channel value after it has been multiplied by the greenMultiplier value.
	 * @param	blue_offset	A number from -255 to 255 that is added to the blue channel value after it has been multiplied by the blueMultiplier value.
	 * @param	alpha_offset	A number from -255 to 255 that is added to the alpha transparency channel value after it has been multiplied by the alphaMultiplier value.
	 */
	public function ColorTransformValues( red_multiplier : Number, green_multiplier : Number, blue_multiplier : Number, alpha_multiplier : Number, red_offset : Number, green_offset : Number, blue_offset : Number, alpha_offset : Number) {
		this.RED_MULTIPLIER = red_multiplier;
		this.GREEN_MULTIPLIER = green_multiplier;
		this.BLUE_MULTIPLIER = blue_multiplier;
		this.ALPHA_MULTIPLIER = alpha_multiplier;
		this.RED_OFFSET = red_offset;
		this.GREEN_OFFSET = green_offset;
		this.BLUE_OFFSET = blue_offset;
		this.ALPHA_OFFSET = alpha_offset;
	}
	
}