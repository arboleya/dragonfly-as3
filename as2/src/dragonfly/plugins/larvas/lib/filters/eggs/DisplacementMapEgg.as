import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.DisplacementMapFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;

/**
 * Define the flight of DisplacementMapEgg.
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.DisplacementMapEgg extends FilterEgg {
	
	// [ CONSTANTS - properties] *********************************************/
	
	/**
	 * Register the filter
	 * @return The filter type
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_DISPLACEMENT_MAP;
	}
	
	/**
	 * A BitmapData object containing the displacement map data.
	 * @return <code>mapBitmap</code> property.
	 */
	public static function get MAP_BITMAP () : String {
		return FiltersManager.DISPLACEMENTMAP_MAP_BITMAP;
	}
	
	/**
	 * A <code>flash.geom.Point</code> value that contains the offset of the upper-left corner of
	 * the target movie clip from the upper-left corner of the map image. 
	 * @return <code>mapPoint</code> property.
	 * @see Point
	 */
	public static function get MAP_POINT () : String {
		return FiltersManager.DISPLACEMENTMAP_MAP_POINT;
	}
	
	/**
	 * Describes which color channel to use in the map image to displace the <i>x</i> result.
	 * Possible values are 1 (red), 2 (green), 4 (blue), and 8 (alpha).
	 * @return <code>componentX</code> property.
	 */
	public static function get COMPONENT_X () : String {
		return FiltersManager.DISPLACEMENTMAP_COMPONENT_X;
	}
	
	/**
	 * Describes which color channel to use in the map image to displace the <i>y</i> result.
	 * Possible values are 1 (red), 2 (green), 4 (blue), and 8 (alpha).
	 * @return <code>componentY<code> property.
	 */
	public static function get COMPONENT_Y () : String {
		return FiltersManager.DISPLACEMENTMAP_COMPONENT_Y;
	}
	
	/**
	 * The multiplier to use to scale the x displacement result from the map calculation.
	 * @return <code>scaleX<code> property.
	 */
	public static function get SCALE_X () : String {
		return FiltersManager.DISPLACEMENTMAP_SCALE_X;
	}
	
	/**
	 * The multiplier to use to scale the y displacement result from the map calculation.
	 * @return <code>scaleY</code>
	 */
	public static function get SCALE_Y () : String {
		return FiltersManager.DISPLACEMENTMAP_SCALE_Y;
	}
	
	/**
	 * The mode for the filter. Possible values are the following:
	 * <ul> 
	 * <li>"wrap": Wraps the displacement value to the other side of the source image. This is the default value.</li> 
	 * <li>"clamp": Clamps the displacement value to the edge of the source image.</li>
	 * <li>"ignore": If the displacement value is out of range, ignores the displacement and uses the source pixel.</li> 
	 * <li>"color": If the displacement value is outside the image, substitutes a pixel value composed of the alpha and color properties of the filter.</li>
	 * </ul>
	 * @return <code>mode</code> property.
	 */
	public static function get MODE () : String {
		return FiltersManager.DISPLACEMENTMAP_MODE;
	}
	
	/**
	 * Specifies what color to use for out-of-bounds displacements. The valid range of
	 * displacements is 0.0 to 1.0. Values are in hexadecimal format. The default value
	 * for <code>color</code> is 0. Use this property if the mode property is set to 3, <code>COLOR</code>.
	 * @return <code>color</code> property.
	 */
	public static function get COLOR () : String {
		return FiltersManager.DISPLACEMENTMAP_COLOR;
	}
	
	/**
	 * Specifies what color to use for out-of-bounds displacements. The valid range of displacements
	 * is 0.0 to 1.0. Values are in hexadecimal format. The default value for color is 0. Use this
	 * property if the mode property is set to 3, <code>COLOR</code>.
	 * @return <code>alpha</code> property.
	 */
	public static function get ALPHA () : String {
		return FiltersManager.DISPLACEMENTMAP_ALPHA;
	}
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a DisplacementMapEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 * @param filtersManager The filters manager for the larva.
	 */
	public function DisplacementMapEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, DisplacementMapEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( DisplacementMapFlightEvent );
	}
}