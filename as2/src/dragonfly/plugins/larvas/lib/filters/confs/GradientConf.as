import dragonfly.plugins.core.Conf;

/**
 * Configure values for Gradient effects.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.plugins.larvas.lib.filters.values.GradientValues
 * @see dragonfly.plugins.larvas.lib.filters.eggs.GradientEgg
 * @see dragonfly.plugins.larvas.lib.filters.confs.Conf
 * 
 */
class dragonfly.plugins.larvas.lib.filters.confs.GradientConf extends Conf{
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * An array of colors that defines a gradient. For example, red is 0xFF0000, blue is 0x0000FF, and so on.
	 */
	public var COLORS:Array;
	
	/**
	 * An array of alpha transparency values for the corresponding colors in the colors array.
	 * Valid values for each element in the array are 0 to 1. For example, a value of .25
	 * sets the alpha transparency value to 25%. 
	 */
	public var ALPHAS:Array;
	
	/**
	 * An array of color distribution ratios. Valid values are 0 to 255. This value defines the
	 * percentage of the width where the color is sampled at 100 percent.
	 */
	public var RATIOS:Array;
	
	/**
	 * The placement of the filter effect. Possible values are: "outer": Glow on the outer edge of the object,
	 * "inner": Glow on the inner edge of the object; the default, "full": Glow on top of the object.
	 */
	public var TYPE:String;
	
	/**
	 * Specifies whether the object has a knockout effect. A knockout effect makes the object's fill transparent
	 * and reveals the background color of the document. The value true specifies a knockout effect;
	 * The default value is <code>false</code>.
	 */
	public var KNOCKOUT:Boolean;
	
	/**
	 * The number of times to apply the filter. Valid values are 0 to 15. The default value is 1,
	 * which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high
	 * quality. Filters with lower values are rendered more quickly.
	 */
	public var QUALITY:Number;
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Constructor
	 * 
	 * @param colors An array of colors that defines a gradient. For example, red is 0xFF0000, blue is 0x0000FF, and so on.
	 * @param alphas An array of alpha transparency values for the corresponding colors in the colors array. Valid values for each element in the array are 0 to 1. For example, a value of .25 sets the alpha transparency value to 25%.
	 * @param ratios An array of color distribution ratios. Valid values are 0 to 255. This value defines the percentage of the width where the color is sampled at 100 percent.
	 * @param type The placement of the filter effect. Possible values are: "outer": Glow on the outer edge of the object, "inner": Glow on the inner edge of the object; the default, "full": Glow on top of the object 
	 * @param knockout Specifies whether the object has a knockout effect. A knockout effect makes the object's fill transparent and reveals the background color of the document. The value true specifies a knockout effect; the default is false (no knockout effect).
	 * @param quality The number of times to apply the filter. Valid values are 0 to 15. The default value is 1, which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality.
	 */
	public function GradientConf (colors : Array, alphas : Array, ratios : Array, type : String, knockout : Boolean, quality : Number) {
		this.RATIOS = ratios;
		this.ALPHAS = alphas;
		this.COLORS = colors;
		this.TYPE = type;
		this.KNOCKOUT = knockout;
		this.QUALITY = quality;
	}
}