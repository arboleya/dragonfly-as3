import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.DropShadowFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;

/**
 * Define the flight of DropShadowEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.DropShadowEgg extends FilterEgg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * Register the filter
	 * @return The filter type
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_DROP_SHADOW;
	}
	
	/**
	 * The offset distance for the shadow, in pixels. The default value is 4 (floating point).
	 * @return <code>distance</code> property.
	 */
	public static function get DISTANCE () : String {
		return FiltersManager.DROPSHADOW_DISTANCE;
	}
	
	/**
	 * The angle of the shadow. Valid values are 0 to 360˚ (floating point).
	 * The default value is 45.
	 * @return <code>angle<code> property. 
	 */
	public static function get ANGLE () : String {
		return FiltersManager.DROPSHADOW_ANGLE;
	}
	
	/**
	 * The color of the shadow. Valid values are in hexadecimal format <i>0xRRGGBB</i>.
	 * The default value is 0x000000.
	 * @return <code>color</code> property.
	 */
	public static function get COLOR () : String {
		return FiltersManager.DROPSHADOW_COLOR;
	}
	
	/**
	 * The alpha transparency value for the shadow color. Valid values are 0 to 1.
	 * For example, 0.25 sets a transparency value of 25%. The default value is 1.
	 * @return <code>alpha<code> property.
	 */
	public static function get ALPHA () : String {
		return FiltersManager.DROPSHADOW_ALPHA;
	}
	
	/**
	 * The amount of horizontal blur. Valid values are 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 * @return <code>blurX<code> property.
	 */
	public static function get BLUR_X () : String {
		return FiltersManager.DROPSHADOW_BLUR_X;
	}
	
	/**
	 * The amount of vertical blur. Valid values are 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 * @return <code>blurY<code> property. 
	 */
	public static function get BLUR_Y () : String {
		return FiltersManager.DROPSHADOW_BLUR_Y;
	}
	
	/**
	 * Indicates whether or not the object is hidden. The value true indicates
	 * that the object itself is not drawn; only the shadow is visible.
	 * The default is false (show the object).
	 * @return <code>hideObject</code> property.
	 */
	public static function get HIDE_OBJECT () : String {
		return FiltersManager.DROPSHADOW_HIDE_OBJECT;
	}
	
	/**
	 * Indicates whether or not the shadow is an inner shadow. The value true indicates
	 * an inner shadow. The default is false, an outer shadow (a shadow around the outer edges of the object).
	 * @return <code>inner</code> property.
	 */
	public static function get INNER () : String {
		return FiltersManager.DROPSHADOW_INNER;
	}
	
	/**
	 * Applies a knockout effect (<code>true</code>), which effectively makes the object's fill transparent and
	 * reveals the background color of the document. The default is <code>false</code> (no knockout).
	 * @return <code>knockout</code> property.
	 */
	public static function get KNOCKOUT () : String {
		return FiltersManager.DROPSHADOW_KNOCKOUT;
	}
	
	/**
	 * The number of times to apply the filter. Valid values are 0 to 15.
	 * The default value is 1, which is equivalent to low quality. A value of 2 is medium quality,
	 * and a value of 3 is high quality. Filters with lower values are rendered more quickly.
	 * @return <code>quality<code> property. 
	 */
	public static function get QUALITY () : String {
		return FiltersManager.DROPSHADOW_QUALITY;
	}
	
	/**
	 * The strength of the imprint or spread. The higher the value, the more color is imprinted
	 * and the stronger the contrast between the shadow and the background. Valid values are
	 * from 0 to 255. The default is 1.
	 * @return <code>strenght</code> property.
	 */
	public static function get STRENGTH () : String {
		return FiltersManager.DROPSHADOW_STRENGTH;
	}
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a DropShadowEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 * @param filtersManager The filters manager for the larva.
	 */
	public function DropShadowEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, DropShadowEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( DropShadowFlightEvent );
	}
}