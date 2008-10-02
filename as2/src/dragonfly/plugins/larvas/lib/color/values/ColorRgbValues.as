

/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.lib.color.values.ColorRgbValues {
	
	// [ PUBLIC - properties ] ***********************************************/
	
	/**
	 * Red value.
	 */
	public var r : Number;
	
	/**
	 * Green value.
	 */
	public var g : Number;
	
	/**
	 * Blue value.
	 */
	public var b : Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new ColorRgbValues object.
	 * 
	 * @param	r	Red value.
	 * @param	g	Green value.
	 * @param	b	Blue value.
	 */
	public function ColorRgbValues( r : Number, g : Number, b : Number ) {
		this.r = ( r || 0 );
		this.g = ( g || 0 );
		this.b = ( b || 0 );
	}
	
	
	
}