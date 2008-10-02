import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.BevelFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;



/**
 * Define the flight of BevelEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.BevelEgg extends FilterEgg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * Register the filter.
	 * @return The filter type
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_BEVEL;
	}
	
	/**
	 * The offset distance of the bevel. Valid values are in pixels (floating point).
	 * The default value is 4.
	 * @return <code>distance</code> property.
	 */
	public static function get DISTANCE () : String {
		return FiltersManager.BEVEL_DISTANCE;
	}
	
	/**
	 * The angle of the bevel. Valid values are from 0 to 360 degrees.
	 * The default value is 45.
	 * @return <code>angle</code> property. 
	 */
	public static function get ANGLE () : String {
		return FiltersManager.BEVEL_ANGLE;
	}
	
	/**
	 * The highlight color of the bevel. Valid values are in hexadecimal format,
	 * <i>0xRRGGBB</i>. The default value is 0xFFFFFF.
	 * @return <code>highlightColor</code> property.
	 */
	public static function get HIGHLIGHTCOLOR () : String {
		return FiltersManager.BEVEL_HIGHLIGHTCOLOR;
	}
	
	/**
	 * The alpha transparency value of the highlight color. The value is specified
	 * as a normalized value from 0 to 1. For example, 0.25 sets a transparency value of 25%.
	 * The default value is 1.
	 * @return <code>highlightAlpha</code> property.
	 */
	public static function get HIGHLIGHTALPHA () : String {
		return FiltersManager.BEVEL_HIGHLIGHTALPHA;
	}
	
	/**
	 * The shadow color of the bevel. Valid values are in hexadecimal format, <i>0xRRGGBB</i>.
	 * The default value is 0x000000.
	 * @return <code>shadowColor</code> property.
	 */
	public static function get SHADOWCOLOR () : String {
		return FiltersManager.BEVEL_SHADOWCOLOR;
	}
	
	/**
	 * The alpha transparency value of the shadow color. This value is specified
	 * as a normalized value from 0 to 1. For example, 0.25 sets a transparency value of 25%.
	 * The default value is 1.
	 * @return <code>shadowAlpha</code> property.
	 */
	public static function get SHADOWALPHA () : String {
		return FiltersManager.BEVEL_SHADOWALPHA;
	}
	
	/**
	 * The amount of horizontal blur in pixels. Valid values are from 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16, and 32) are
	 * optimized to render more quickly than other values.
	 * @return <code>blurX</code> property.
	 */
	public static function get BLURX () : String {
		return FiltersManager.BEVEL_BLURX;
	}
	
	/**
	 * The amount of vertical blur in pixels. Valid values are from 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16, and 32) are
	 * optimized to render more quickly than other values.
	 * @return <code>blurY</code> property.
	 */
	public static function get BLURY () : String {
		return FiltersManager.BEVEL_BLURY;
	}
	
	/**
	 * Applies a knockout effect (<code>true</code>), which effectively
	 * makes the object's fill transparent and reveals the background color
	 * of the document. The default value is <code>false</code> (no knockout).
	 * @return <code>knockout</code> property.
	 */
	public static function get KNOCKOUT () : String {
		return FiltersManager.BEVEL_KNOCKOUT;
	}
	
	/**
	 * The number of times to apply the filter. The default value is 1, which is equivalent to low quality.
	 * A value of 2 is medium quality, and a value of 3 is high quality. Filters with lower values are rendered
	 * more quickly.
	 * @return <code>quality</code> property.
	 */
	public static function get QUALITY () : String {
		return FiltersManager.BEVEL_QUALITY;
	}
	
	/**
	 * The strength of the imprint or spread. Valid values are from 0 to 255.
	 * The larger the value, the more color is imprinted and the stronger the
	 * contrastbetween the bevel and the background. The default value is 1.
	 * @return <code>strenght</code> property.
	 */
	public static function get STRENGTH () : String {
		return FiltersManager.BEVEL_STRENGTH;
	}
	
	/**
	 * The type of bevel. Valid values are "inner", "outer", and "full".
	 * @return <code>type</code> property.
	 */
	public static function get TYPE () : String {
		return FiltersManager.BEVEL_TYPE;
	}
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a BevelEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 * @param filtersManager	The filters manager for the larva.
	 */
	public function BevelEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, BevelEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( BevelFlightEvent );
	}
}