import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.GlowFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;

/**
 * Define the flight of GlowEgg.
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.GlowEgg extends FilterEgg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * Register the filter.
	 * @return The filter type.
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_GLOW_FILTER;
	}
	
	/**
	 * The color of the glow. Valid values are in the hexadecimal format <i>0xRRGGBB</i>.
	 * The default value is 0xFF0000.
	 * @return <code>color</code> property.
	 */
	public static function get COLOR () : String {
		return FiltersManager.GLOW_COLOR;
	}
	
	/**
	 * The alpha transparency value for the color. Valid values are 0 to 1.
	 * For example, 0.25 sets a transparency value of 25%. The default value is 1.
	 * @return <code>alpha</code> property.
	 */
	public static function get ALPHA () : String {
		return FiltersManager.GLOW_ALPHA;
	}
	
	/**
	 * The amount of horizontal blur. Valid values are 0 to 255 (floating point).
	 * The default value is 6. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 * @return <code>blurX</code> property.
	 */
	public static function get BLUR_X () : String {
		return FiltersManager.GLOW_BLUR_X;
	}
	
	/**
	 * The amount of vertical blur. Valid values are 0 to 255 (floating point).
	 * The default value is 6. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 * @return <code>blurY</code> property. 
	 */
	public static function get BLUR_Y () : String {
		return FiltersManager.GLOW_BLUR_Y;
	}
	
	/**
	 * The strength of the imprint or spread. The higher the value,
	 * the more color is imprinted and the stronger the contrast between
	 * the glow and the background. Valid values are 0 to 255. The default is 2.
	 * @return <code>strenght</code> property.
	 */
	public static function get STRENGTH () : String {
		return FiltersManager.GLOW_STRENGTH;
	}
	
	/**
	 * The number of times to apply the filter. Valid values are 0 to 15.
	 * The default value is 1, which is equivalent to low quality. A value of 2
	 * is medium quality, and a value of 3 is high quality. Filters with lower
	 * values are rendered more quickly.
	 * @return <code>quality</code> property. 
	 */
	public static function get QUALITY () : String {
		return FiltersManager.GLOW_QUALITY;
	}
	
	/**
	 * Specifies whether the glow is an inner glow. The value <code>true</code> indicates an inner glow.
	 * The default is <code>false</code>, an outer glow (a glow around the outer edges of the object).
	 * @return <code>inner</code> property.
	 */
	public static function get INNER () : String {
		return FiltersManager.GLOW_INNER;
	}
	
	/**
	 * Specifies whether the object has a knockout effect.
	 * A value of true makes the object's fill transparent and
	 * reveals the background color of the document.
	 * The default is false (no knockout effect).
	 * @return <code>knockout</code> property.
	 */
	public static function get KNOCKOUT () : String {
		return FiltersManager.GLOW_KNOCKOUT;
	}
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a GlowEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 * @param filtersManager The filters manager for the larva.
	 */
	public function GlowEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, GlowEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( GlowFlightEvent );
	}
}