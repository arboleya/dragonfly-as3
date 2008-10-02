import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.BlurFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;

/**
 * Define the flight of BlurEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.BlurEgg extends FilterEgg {
	
	// [ CONSTANTS - properties] *********************************************/
	
	/**
	 * Register the filter
	 * @return The filter type
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_BLUR;
	}
	
	/**
	 * The amount of horizontal blur. Valid values are from 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 * @return <code>x</code> property.
	 */
	public static function get X () : String {
		return FiltersManager.BLUR_X;
	}
	
	/**
	 * The amount of vertical blur. Valid values are from 0 to 255 (floating point).
	 * The default value is 4. Values that are a power of 2 (such as 2, 4, 8, 16 and 32)
	 * are optimized to render more quickly than other values.
	 * @return <code>y</code> property.
	 */
	public static function get Y () : String {
		return FiltersManager.BLUR_Y;
	}
	
	/**
	 * The number of times to perform the blur. Valid values are from 0-15. The default value is 1,
	 * which is equivalent to low quality. A value of 2 is medium quality. A value of 3 is high quality
	 * and approximates a Gaussian blur.
	 * @return <code>quality</code> property. 
	 */
	public static function get QUALTY () : String {
		return FiltersManager.BLUR_QUALITY;
	}
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a BlurEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 * @param filtersManager The filters manager for the larva.
	 */
	public function BlurEgg(prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, BlurEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( BlurFlightEvent );
	}
}