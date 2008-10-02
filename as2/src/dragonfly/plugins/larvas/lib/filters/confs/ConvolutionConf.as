import dragonfly.plugins.core.Conf;

/**
 * Configure values for Convolution effects.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.plugins.larvas.lib.filters.values.ConvolutionValues
 * @see dragonfly.plugins.larvas.lib.filters.eggs.ConvolutionEgg
 * @see dragonfly.plugins.larvas.lib.filters.confs.Conf
 */
class dragonfly.plugins.larvas.lib.filters.confs.ConvolutionConf extends Conf {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * Indicates what the convolution applies to. A value of false indicates
	 * that the convolution applies to all channels, including the alpha channel.
	 * A value of true indicates that the convolution applies only to the color channels. 
	 * The default value is <code>true</code>.
	 */
	public var PRESERVE_ALPHA:Boolean;
	
	/**
	 * Indicates whether the image should be clamped. For pixels that are off the source image,
	 * a value of true indicates that the input image is extended along each of its borders
	 * as necessary by duplicating the color values at the given edge of the input image.
	 * A value of false indicates that another color should be used, as specified in the color and alpha properties.
	 * The default value is <code>false</code>.
	 */
	public var CLAMP:Boolean;
	
	/**
	 * The x dimension of the matrix (the number of columns in the matrix).
	 * The default value is 0.
	 */
	public var MATRIX_X:Number;
	
	/**
	 * The y dimension of the matrix (the number of rows in the matrix). The default value is 0.
	 */
	public var MATRIX_Y:Number;
	
	/**
	 * The hexadecimal color to substitute for pixels that are off the source image.
	 * This is an RGB value with no alpha component. The default is 0.
	 */
	public var COLOR:Number;
	
	/**
	 * The alpha transparency value of the substitute color. Valid values are 0 to 1.0.
	 * The default is 0. For example, 0.25 sets a transparency value of 25 percent.
	 */
	public var ALPHA:Number;
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a ConvolutionConf object.
	 * 
	 * @param preservaAlpha A value of false indicates that the convolution applies to all channels, including the alpha channel. A value of true indicates that the convolution applies only to the color channels. The default value is true.
	 * @param clamp For pixels that are off the source image, a value of true indicates that the input image is extended along each of its borders as necessary by duplicating the color values at the given edge of the input image. A value of false indicates that another color should be used, as specified in the color and alpha properties. The default is true.
	 * @param matrixX The y dimension of the matrix (the number of rows in the matrix). The default value is 0.
	 * @param matrixY The x dimension of the matrix (the number of columns in the matrix). The default value is 0.
	 * @param color	The hexadecimal color to substitute for pixels that are off the source image.
	 * @param alpha	The alpha of the substitute color.
	 */
	public function ConvolutionConf (preservaAlpha : Boolean, clamp : Boolean, matrixX : Number, matrixY : Number, color : Number, alpha : Number) {
		this.PRESERVE_ALPHA = preservaAlpha;
		this.CLAMP = clamp;
		this.MATRIX_X = matrixX;
		this.MATRIX_Y = matrixY;
		this.COLOR = color;
		this.ALPHA = alpha;
	}
	
}