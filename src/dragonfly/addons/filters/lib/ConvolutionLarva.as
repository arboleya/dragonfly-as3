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
			_filter.preserveAlpha = preserve_alpha;
			_filter.clamp = clamp;
			_filter.matrixX = matrix_x;
			_filter.matrixY = matrix_y;
			_filter.color = color;
			_filter.alpha = alpha;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */
		
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