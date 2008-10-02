import dragonfly.plugins.core.Conf;

/**
 * Configure values for Glow effects.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.plugins.larvas.lib.filters.values.GlowValues
 * @see dragonfly.plugins.larvas.lib.filters.eggs.GlowEgg
 * @see dragonfly.plugins.larvas.lib.filters.confs.Conf
 * 
 */
class dragonfly.plugins.larvas.lib.filters.confs.GlowConf extends Conf {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * Specifies whether the glow is an inner glow. The value true indicates an inner glow.
	 * The default value is <code>false</code>.
	 */
	public var INNER:Boolean;
	
	/**
	 * Specifies whether the object has a knockout effect. A value of true makes the object's
	 * fill transparent and reveals the background color of the document. 
	 * The default value is <code>false</code>. 
	 */
	public var KNOCKOUT:Boolean;
	
	/**
	 * The number of times to apply the filter. Valid values are 0 to 15.
	 * The default value is 1, which is equivalent to low quality.
	 * A value of 2 is medium quality, and a value of 3 is high quality.
	 * Filters with lower values are rendered more quickly.<br><br>For most applications,
	 * a quality value of 1, 2, or 3 is sufficient. Although you can use additional numeric
	 * values up to 15 to achieve different effects, higher values are rendered more slowly.
	 * Instead of increasing the value of quality, you can often get a similar effect, and
	 * with faster rendering, by simply increasing the values of blurX and blurY.
	 * The default value is 1.
	 */
	public var QUALITY:Number;
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a GlowCOnf object.
	 * 
	 * @param inner Specifies whether the glow is an inner glow. The value true indicates an inner glow. The default is false, an outer glow (a glow around the outer edges of the object).
	 * @param knockout Specifies whether the object has a knockout effect. The value true makes the object's fill transparent and reveals the background color of the document. The default is false (no knockout effect).
 	 * @param quality The number of times to apply the filter. Valid values are 0 to 15. The default value is 1, which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality.
	 */
	public function GlowConf (inner : Boolean, knockout : Boolean, quality : Number) {
		this.INNER = inner;
		this.KNOCKOUT = knockout;
		this.QUALITY = quality;
	}
	
}