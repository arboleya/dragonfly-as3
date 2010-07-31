package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.lib.eggs.ConvolutionEgg;

	import flash.filters.ConvolutionFilter;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class ConvolutionLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : ConvolutionFilter;
		/* ----- FILTER PROPERTIES (non tweenable) -------------------------- */
		private var _preserve_alpha : Boolean;
		private var _clamp : Boolean;
		private var _matrix_x : Number;
		private var _matrix_y : Number;
		private var _color : Number;
		private var _alpha : Number;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function ConvolutionLarva(
			target : *,
			use_frames : Boolean,
			fps : Number
		)
		{
			super( target, use_frames, fps );
			_filter = new ConvolutionFilter( 1, 1, [ 1 ], 1, 0 );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : ConvolutionFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf(
			preserve_alpha : Boolean,
			clamp : Boolean,
			matrix_x : Number,
			matrix_y : Number,
			color : Number,
			alpha : Number
		) : ConvolutionLarva 
		{
			_filter.preserveAlpha = ( _preserve_alpha = preserve_alpha );
			_filter.clamp = ( _clamp = clamp );
			_filter.matrixX = ( _matrix_x = matrix_x );
			_filter.matrixY = ( _matrix_y = matrix_y );
			_filter.color = ( _color = color );
			_filter.alpha = ( _alpha = alpha );
			return this;
		}

		/* ----- X, Y ------------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function matrix(
			end : Array,
			start : Array = undefined
		) : ConvolutionLarva
		{
			_lay( ConvolutionEgg, ConvolutionEgg.MATRIX, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function divisor(
			end : Number,
			start : Number = undefined
		) : ConvolutionLarva
		{
			_lay( ConvolutionEgg, ConvolutionEgg.DIVISOR, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function bias(
			end : Number,
			start : Number = undefined
		) : ConvolutionLarva
		{
			_lay( ConvolutionEgg, ConvolutionEgg.BIAS, end, start );
			return this;
		}
	}
}