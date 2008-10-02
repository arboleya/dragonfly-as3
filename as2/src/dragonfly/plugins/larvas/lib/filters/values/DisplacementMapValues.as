import dragonfly.plugins.core.Values;

/**
 * Define values of DisplacementMapEgg.
 * @see DisplacementMapEgg
 * @see Values
 */
class dragonfly.plugins.larvas.lib.filters.values.DisplacementMapValues extends Values {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * The multiplier to use to scale the x displacement result from the map calculation.
	 */
	public var SCALE_X:Number;
	
	/**
	 * The multiplier to use to scale the y displacement result from the map calculation.
	 */
	public var SCALE_Y:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] ***********************************************************/
	
	/**
	 * Create a DisplacementMapValues object.
	 * 
	 * @param scaleX The multiplier to use to scale the x displacement result from the map calculation.
	 * @param scaleY The multiplier to use to scale the y displacement result from the map calculation.
	 */
	public function DisplacementMapValues (scaleX : Number, scaleY : Number) {
		this.SCALE_X = scaleX;
		this.SCALE_Y = scaleY;
	}
	
}