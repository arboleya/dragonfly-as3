package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.lib.eggs.GradientGlowEgg;

	import flash.filters.GradientGlowFilter;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class GradientGlowLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : GradientGlowFilter;

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function GradientGlowLarva( target : * )
		{
			super( target );
			_filter = new GradientGlowFilter( 0, 0, [ 0x000000 ], [ 0 ], [ 0 ], 0, 0, 0, 0 );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : GradientGlowFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		public function conf(
			colors : Array,
			alphas : Array,
			ratios : Array,
			type : String,
			knockout : Boolean,
			quality : int
		) : GradientGlowLarva
		{
			_filter.colors = colors;
			_filter.alphas = alphas;
			_filter.ratios = ratios;
			_filter.type = type;
			_filter.knockout = knockout;
			_filter.quality = quality;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */
		public function distance(
			end : Number,
			start : Number = undefined
		) : GradientGlowLarva
		{
			_lay( GradientGlowEgg, GradientGlowEgg.DISTANCE, end, start );
			return this;
		}

		public function angle(
			end : Number,
			start : Number = undefined
		) : GradientGlowLarva
		{
			_lay( GradientGlowEgg, GradientGlowEgg.ANGLE, end, start );
			return this;
		}

		public function blur_x(
			end : Number,
			start : Number = undefined
		) : GradientGlowLarva
		{
			_lay( GradientGlowEgg, GradientGlowEgg.BLUR_X, end, start );
			return this;
		}

		public function blur_y(
			end : Number,
			start : Number = undefined
		) : GradientGlowLarva
		{
			_lay( GradientGlowEgg, GradientGlowEgg.BLUR_Y, end, start );
			return this;
		}

		public function blur_xy(
			end_x : Number,
			end_y : Number,
			start_x : Number = undefined,
			start_y : Number = undefined
		) : GradientGlowLarva
		{
			blur_x( end_x, start_x );
			blur_y( end_y, start_y );
			return this;
		}

		public function strength(
			end : Number,
			start : Number = undefined
		) : GradientGlowLarva
		{
			_lay( GradientGlowEgg, GradientGlowEgg.STRENGTH, end, start );
			return this;
		}
	}
}