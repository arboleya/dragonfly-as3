package dragonfly.addons.filters.lib.eggs 
{
	import dragonfly.addons.filters.lib.ConvolutionLarva;
	import dragonfly.core.Egg;
	import dragonfly.core.Larva;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class ConvolutionEgg extends Egg 
	{
		/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
		public static const MATRIX : String = "matrix";
		public static const DIVISOR : String = "divisor";
		public static const BIAS : String = "bias";

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function ConvolutionEgg(
			prop : String,
			larva : Larva,
			end : *,
			start : *
		)
		{
			super( prop, larva, end, start );
			_prop_target = _convolution_larva.filter;
		}

		/* ----- GETTER / CASTER -------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		private function get _convolution_larva() : ConvolutionLarva
		{
			return ConvolutionLarva( _larva );
		}

		/* ----- RENDERING -------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function render( value : * ) : void
		{
			_convolution_larva.filter[ _prop ] = value;
			_convolution_larva.close.refresh( );
		}

		/* ----- START VALUE EVALUATION ------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override protected function _get_start_value() : *
		{
			return _convolution_larva.filter[ _prop ];
		}
	}
}
