import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.GradientFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;


/**
 * Define the flight of GradientBevelEgg.
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.GradientBevelEgg extends FilterEgg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * Register the filter.
	 * @return The filter type.
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_GRADIENT_BEVEL;
	}
	
	/**
	 * The offset distance. The default value is 4.
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
	 * An array of RGB hexadecimal color values to use in the gradient.
	 * For example, red is 0xFF0000, blue is 0x0000FF, and so on.
	 * @return <code>colors</code> property. 
	 */
	public static function get COLORS () : String {
		return FiltersManager.GRADIENT_COLORS;
	}
	
	/**
	 * An array of alpha transparency values for the corresponding colors in the
	 * colors array. Valid values for each element in the array are 0 to 1.
	 * For example, 0.25 sets a transparency value of 25%.
	 * @return <code>alphas</code> property. 
	 */
	public static function get ALPHAS () : String {
		return FiltersManager.GRADIENT_ALPHAS;
	}
	
	/**
	 * An array of color distribution ratios for the corresponding colors in the colors array.
	 * Valid values for each element in the array are 0 to 255.
	 * @return <code>ratios</code> property. 
	 */
	public static function get RATIOS () : String {
		return FiltersManager.GRADIENT_RATIOS;
	}
	
	/**
	 * The amount of horizontal blur. Valid values are 0 to 255. A blur of 1 or less
	 * means that the original image is copied as is. The default value is 4.
	 * Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to
	 * render more quickly than other values.
	 * @return <code>blurX</code> property.
	 */
	public static function get BLUR_X () : String {
		return FiltersManager.GRADIENT_BLUR_X;
	}
	
	/**
	 * The amount of vertical blur. Valid values are 0 to 255. A blur of 1 or less
	 * means that the original image is copied as is. The default value is 4.
	 * Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to
	 * render more quickly than other values.
	 * @return <code>blurY</code> property.
	 */
	public static function get BLUR_Y () : String {
		return FiltersManager.GRADIENT_BLUR_Y;
	}
	
	/**
	 * The strength of the imprint or spread. The higher the value, the more color
	 * is imprinted and the stronger the contrast between the bevel and the background.
	 * Valid values are 0 to 255. A value of 0 means that the filter is not applied.
	 * The default value is 1.
	 * @return <code>strenght</code> property.
	 */
	public static function get STRENGTH () : String {
		return FiltersManager.GRADIENT_STRENGTH;
	}
	
	/**
	 * The number of times to apply the filter. Valid values are 0 to 15. The default value is 1,
	 * which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high
	 * quality. Filters with lower values are rendered more quickly.
	 * @return <code>quality</code> property. 
	 */
	public static function get QUALITY () : String {
		return FiltersManager.GRADIENT_QUALITY;
	}
	
	/**
	 * The placement of the bevel effect. Possible values are:
	 * <ul> 
	 * <li>"outer": Bevel on the outer edge of the object.</li>
	 * <li>"inner": Bevel on the inner edge of the object.</li> 
	 * <li>"full": Bevel on top of the object.</li> 
	 * </ul>
	 * The default value is "inner".
	 * @return <code>type</code> property.
	 */
	public static function get TYPE () : String {
		return FiltersManager.GRADIENT_TYPE;
	}
	
	/**
	 * The number of times to apply the filter. Valid values are 0 to 15. The default value is 1,
	 * which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality.
	 * Filters with lower values are rendered more quickly.
	 * @return <code>knockout</code> property. 
	 */
	public static function get KNOCKOUT () : String {
		return FiltersManager.GRADIENT_KNOCKOUT;
	}
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	* Create a GradientBevelEgg object.
	* 
	* @param prop The Egg property.
	* @param larva The larva that owns the Egg.
	* @param flight The larva flight.
	* @param filtersManager The filters manager for the larva.
	*/
	public function GradientBevelEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, GradientBevelEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( GradientFlightEvent );
	}
}