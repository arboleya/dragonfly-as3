import dragonfly.plugins.core.Conf;


/**
 * Configure values for DropShadow effects.
 * 
 * @see dragonfly.plugins.larvas.lib.filters.values.DropShadowValues
 * @see dragonfly.plugins.larvas.lib.filters.eggs.DropShadowEgg
 * @see dragonfly.plugins.larvas.lib.filters.confs.Conf
 */
class dragonfly.plugins.larvas.lib.filters.confs.DropShadowConf extends Conf {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * Applies a knockout effect (true), which effectively makes the object's fill
	 * transparent and reveals the background color of the document.
	 * The default value is <code>false</code>.
	 */
	public var KNOCKOUT:Boolean;
	
	/**
	 * Indicates whether or not the object is hidden. The value true indicates that the object
	 * itself is not drawn; only the shadow is visible. The default value is <code>false</code>. 
	 */
	public var HIDE_OBJECT:Boolean;
	
	/**
	 * Indicates whether or not the shadow is an inner shadow. The value true indicates an inner shadow.
	 * The default value is <code>false</code>.
	 */
	public var INNER:Boolean;
	
	/**
	 * The number of times to apply the filter. Valid values are 0 to 15.
	 * The default value is 1, which is equivalent to low quality. A value of 2 is medium quality,
	 * and a value of 3 is high quality. Filters with lower values are rendered more quickly.
	 */
	public var QUALITY:Number;

	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a DropShadowConf object.
	 * 
	 * @param knockout Indicates whether or not the shadow is an inner shadow. A value of true specifies an inner shadow. The default is false, an outer shadow (a shadow around the outer edges of the object).
	 * @param strength Indicates whether or not the object is hidden. A value of true indicates that the object itself is not drawn; only the shadow is visible. The default is false (show the object).
	 * @param inner	Indicates whether or not the shadow is an inner shadow. A value of true specifies an inner shadow. The default is false, an outer shadow (a shadow around the outer edges of the object).
	 * @param quality Applies a knockout effect (true), which effectively makes the object's fill transparent and reveals the background color of the document. The default is false (no knockout).
	 */
	public function DropShadowConf (knockout : Boolean, hideobject : Boolean, inner : Boolean, quality : Number) {
		this.KNOCKOUT = knockout;
		this.HIDE_OBJECT = hideobject;
		this.INNER = inner;
		this.QUALITY = quality;
	}
	
}