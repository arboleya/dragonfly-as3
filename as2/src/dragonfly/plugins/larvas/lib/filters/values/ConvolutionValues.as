import dragonfly.plugins.core.Values;

/**
 * Define values of ConvolutionEgg.
 * 
 * @author nybras | nybras@codeine.it
 * @see ConvolutionEgg
 * @see Values
 */
class dragonfly.plugins.larvas.lib.filters.values.ConvolutionValues extends Values {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * An array of values used for matrix transformation; returns a copy.
	 * The number of items in the array must equal <code>matrixX*matrixY</code>.
	 */
	public var MATRIX:Array;
	
	/**
	 * The divisor used during matrix transformation. The default value is 1.
	 * A divisor that is the sum of all the matrix values evens out the overall
	 * color intensity of the result. A value of 0 is ignored and the default is used instead.
	 */
	public var DIVISOR:Number;
	
	/**
	 * Bias to add to the result of the matrix transformation. The default is 0.
	 */
	public var BIAS:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a ConvolutionValues object.
	 * 
	 * @param matrix The array of values used for matrix transformation; returns a copy. The number of items in the array must equal matrixX*matrixY.
	 * @param divisor The divisor used during matrix transformation. The default value is 1. A divisor that is the sum of all the matrix values evens out the overall color intensity of the result. A value of 0 is ignored and the default is used instead.
	 * @param bias The bias to add to the result of the matrix transformation. The default value is 0.
	 */
	public function ConvolutionValues (matrix : Array, divisor : Number, bias : Number) {
		this.MATRIX = matrix;
		this.DIVISOR = divisor;
		this.BIAS = bias;
	}
	
}