import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.GradientFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;

/**
 * Define the flight of GradientGlowEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.GradientGlowEgg extends FilterEgg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * Register the filter.
	 * @return The filter type
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_GRADIENT_GLOW;
	}
	
	/**
	 * The offset distance of the glow. The default value is 4.
	 * @return <code>distance</code> property.
	 */
	public static function get DISTANCE () : String {
		return FiltersManager.GRADIENT_DISTANCE;
	}
	
	/**
	 * The angle, in degrees. Valid values are 0 to 360. The default is 45. 
	 * @return <code>angle</code> property.
	 */
	public static function get ANGLE () : String {
		return FiltersManager.GRADIENT_ANGLE;
	}
	
	/**
	 * An array of colors that defines a gradient. For example, red is 0xFF0000, blue is 0x0000FF, and so on. 
	 * @return <code>colors</code> property.
	 */
	public static function get COLORS () : String {
		return FiltersManager.GRADIENT_COLORS;
	}
	
	/**
	 * An array of alpha transparency values for the corresponding colors in the colors array.
	 * Valid values for each element in the array are 0 to 1. For example, .25 sets the alpha
	 * transparency value to 25%.
	 * @return <code>alphas</code> property. 
	 */
	public static function get ALPHAS () : String {
		return FiltersManager.GRADIENT_ALPHAS;
	}
	
	/**
	 * An array of color distribution ratios for the corresponding colors in the colors array.
	 * Valid values are 0 to 255.
	 * @return <code>ratios</code> property. 
	 */
	public static function get RATIOS () : String {
		return FiltersManager.GRADIENT_RATIOS;
	}
	
	/**
	 * The amount of horizontal blur. Valid values are 0 to 255. A blur of 1 or less means
	 * that the original image is copied as is. The default value is 4. Values that are a
	 * power of 2 (such as 2, 4, 8, 16, and 32) are optimized to render more quickly than
	 * other values.
	 * @return <code>blurX</code> property.
	 */
	public static function get BLUR_X () : String {
		return FiltersManager.GRADIENT_BLUR_X;
	}
	
	/**
	 * The amount of vertical blur. Valid values are 0 to 255. A blur of 1 or less means
	 * that the original image is copied as is. The default value is 4. Values that are a
	 * power of 2 (such as 2, 4, 8, 16, and 32) are optimized to render more quickly than
	 * other values.
	 * @return <code>blurY</code> property.
	 */
	public static function get BLUR_Y () : String {
		return FiltersManager.GRADIENT_BLUR_Y;
	}
	
	/**
	 * The strength of the imprint or spread. The higher the value, the more color is imprinted
	 * and the stronger the contrast between the glow and the background. Valid values are 0 to 255.
	 * A value of 0 means that the filter is not applied. The default value is 1.
	 * @return <code>strength</code> property.
	 */
	public static function get STRENGTH () : String {
		return FiltersManager.GRADIENT_STRENGTH;
	}
	
	/**
	 * The number of times to apply the filter. Valid values are 0 to 15. The default value is 1,
	 * which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality.
	 * Filters with lower values are rendered more quickly.
	 * @return <code>quality</code> property. 
	 */
	public static function get QUALITY () : String {
		return FiltersManager.GRADIENT_QUALITY;
	}
	
	/**
	 * The placement of the filter effect. Possible values are:
	 * <ul>
	 * <li>"outer": Glow on the outer edge of the object</li> 
	 * <li>"inner": Glow on the inner edge of the object; the default</li> 
	 * <li>"full": Glow on top of the object</li>
	 * </ul> 
	 * The default value is "inner".
	 * @return <code>type</code> property.
	 */
	public static function get TYPE () : String {
		return FiltersManager.GRADIENT_TYPE;
	}
	
	/**
	 * Specifies whether the object has a knockout effect. A knockout effect makes the object's
	 * fill transparent and reveals the background color of the document. The value true specifies
	 * a knockout effect; the default is false (no knockout effect).
	 * @return <code>knockout</code> property.
	 */
	public static function get KNOCKOUT () : String {
		return FiltersManager.GRADIENT_KNOCKOUT;
	}
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a GradientGlowEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 * @param filtersManager The filters manager for the larva.
	 */
	public function GradientGlowEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, GradientGlowEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( GradientFlightEvent );
	}
}