package dragonfly.addons.filters.lib.eggs; 

import dragonfly.addons.filters.lib.ConvolutionLarva;
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class ConvolutionEgg extends Egg 
{
	/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
	public static inline var MATRIX : String = "matrix";

	public static inline var DIVISOR : String = "divisor";

	public static inline var BIAS : String = "bias";

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override public function init() : Void
	{
		_prop_target = _convolution_larva.filter;
	}

	/* ----- GETTER / CASTER -------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	private var _convolution_larva( _get_convolution_larva, never ) : ConvolutionLarva;
	private function _get_convolution_larva() : ConvolutionLarva
	{
		return ConvolutionLarva( _larva );
	}

	/* ----- RENDERING -------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function render( prop : String, value : Dynamic ) : Void
	{
		_convolution_larva.filter[ prop ] = value;
		_convolution_larva.close.refresh( );
	}

	/* ----- START VALUE EVALUATION ------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override private function _get_start_value( prop : String ) : Dynamic
	{
		return _convolution_larva.filter[ prop ];
	}
}