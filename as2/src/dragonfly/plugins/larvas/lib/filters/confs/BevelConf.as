import dragonfly.plugins.core.Conf;

/**
 * Configure values for BevelFilter effects.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.plugins.larvas.lib.filters.values.BevelValues
 * @see dragonfly.plugins.larvas.lib.filters.eggs.BevelEgg
 * @see dragonfly.plugins.larvas.lib.filters.confs.Conf
 */
class dragonfly.plugins.larvas.lib.filters.confs.BevelConf extends Conf {
	
	// [CONSTANTS - Properties] ***********************************************************/
	
	/**
	 * The type of bevel. Valid values are "inner", "outer", and "full".
	 */
	public var TYPE:String;
	
	
	/**
	 * Applies a knockout effect (<code>true</code>), which effectively
	 * makes the object's fill transparent and reveals the background color
	 * of the document. The default value is <code>false</code> (no knockout).
	 */
	public var KNOCKOUT:Boolean;
	
	
	/**
	 * The number of times to apply the filter. The default value is 1, which is equivalent to low quality.
	 * A value of 2 is medium quality, and a value of 3 is high quality. Filters with lower values are rendered
	 * more quickly.
	 */
	public var QUALITY:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a BevelConf object.
	 * 
	 * @param type  The type of bevel. Valid values are "inner", "outer", and "full". The default value is "inner".
	 * @param knockout Applies a knockout effect (true), which effectively makes the object's fill transparent and reveals the background color of the document. The default value is false (no knockout).
	 * @param quality The number of times to apply the filter. The default value is 1, which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality.
	 */
	public function BevelConf (type : String, knockout : Boolean, quality : Number) {
		this.TYPE = (type || "inner");
		this.KNOCKOUT = knockout;
		this.QUALITY = quality;
	}
}