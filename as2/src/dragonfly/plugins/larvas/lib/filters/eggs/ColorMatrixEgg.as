import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.ColorMatrixFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;

/**
 * Define the flight of ColorMatrixEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.ColorMatrixEgg extends FilterEgg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * Register the filter
	 * @return The filter type
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_COLOR_MATRIX;
	}
	
	/**
	 * An array of 20 elements for 4 x 5 color transform.<br><br>Example:<br>
	 * <code>
	 * var matrix:Array = new Array();<br>
	 * matrix = matrix.concat([1, 0, 0, 0, 0]); // red<br>
	 * matrix = matrix.concat([0, 1, 0, 0, 0]); // green<br>
	 * matrix = matrix.concat([0, 0, 1, 0, 0]); // blue<br>
	 * matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha<br>
	 * </code>
	 * @return <code>maxtrix</code> property.
	 */
	public static function get MATRIX () : String {
		return FiltersManager.COLORMATRIX_MATRIX;
	}
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a ColorMatrixEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 * @param filtersManager	The filters manager for the larva.
	 */
	public function ColorMatrixEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, ColorMatrixEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( ColorMatrixFlightEvent );
	}
}