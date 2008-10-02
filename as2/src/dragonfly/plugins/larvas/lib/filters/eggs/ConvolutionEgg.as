import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.ConvolutionFlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;

/**
 * Define the flight of ConvolutionEgg.
 * @see dragonfly.body.core.Flight
 * @see dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.ConvolutionEgg extends FilterEgg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * Register the filter
	 * @return The filter type
	 */
	public static function get FILTER_NAME () : String {
		return FiltersManager.FILTER_CONVOLUTION;
	}
	
	/**
	 * An array of values used for matrix transformation; returns a copy.
	 * The number of items in the array must equal <code>matrixX*matrixY</code>.
	 * @return <code>matrix</code> property. 
	 */
	public static function get MATRIX () : String {
		return FiltersManager.CONVOLUTION_MATRIX;
	}
	
	/**
	 * The x dimension of the matrix (the number of columns in the matrix).
	 * The default value is 0.
	 * @return <code>matrixX</code> property.
	 */
	public static function get MATRIX_X() : String {
		return FiltersManager.CONVOLUTION_MATRIX_X;
	}
	
	/**
	 * The y dimension of the matrix (the number of rows in the matrix). The default value is 0.
	 * @return <code>matrixY</code> property.
	 */
	public static function get MATRIX_Y() : String {
		return FiltersManager.CONVOLUTION_MATRIX_Y;
	}
	
	/**
	 * The divisor used during matrix transformation. The default value is 1.
	 * A divisor that is the sum of all the matrix values evens out the overall
	 * color intensity of the result. A value of 0 is ignored and the default is used instead.
	 * @return <code>divisor</code> property.
	 */
	public static function get DIVISOR() : String {
		return FiltersManager.CONVOLUTION_DIVISOR;
	}
	
	/**
	 * Bias to add to the result of the matrix transformation. The default is 0.
	 * @return <code>bias</code> property. 
	 */
	public static function get BIAS() : String {
		return FiltersManager.CONVOLUTION_BIAS;
	}
	
	/**
	 * Indicates what the convolution applies to. A value of false indicates that the convolution
	 * applies to all channels, including the alpha channel. A value of true indicates that the
	 * convolution applies only to the color channels. The default value is <code>true</code>.
	 * @return <code>preserveAlpha</code> property.
	 */
	public static function get PRESERVE_ALPHA() : String {
		return FiltersManager.CONVOLUTION_PRESERVA_ALPHA;
	}
	
	/**
	 * Indicates whether the image should be clamped. For pixels that are off the source image,
	 * a value of true indicates that the input image is extended along each of its borders as
	 * necessary by duplicating the color values at the given edge of the input image.
	 * A value of false indicates that another color should be used, as specified in
	 * the color and alpha properties. The default is <code>true</code>.
	 */
	public static function get CLAMP() : String {
		return FiltersManager.CONVOLUTION_CLAMP;
	}
	
	/**
	 * The hexadecimal color to substitute for pixels that are off the source image.
	 * This is an RGB value with no alpha component. The default is 0.
	 * @return <code>color</code> property.
	 */
	public static function get COLOR() : String {
		return FiltersManager.CONVOLUTION_COLOR;
	}
	
	/**
	 * The alpha transparency value of the substitute color. Valid values are 0 to 1.0.
	 * The default is 0. For example, 0.25 sets a transparency value of 25 percent.
	 * @return <code>alpha</code> property.
	 */
	public static function get ALPHA() : String {
		return FiltersManager.CONVOLUTION_ALPHA;
	}
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a ConvolutionEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 * @param filtersManager The filters manager for the larva.
	 */
	public function ConvolutionEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array) {
		super(prop, larva, flight, ConvolutionEgg.FILTER_NAME, FiltersManager( extraArgs[0] ));
		this.flight.setEventClass( ConvolutionFlightEvent );
	}
}