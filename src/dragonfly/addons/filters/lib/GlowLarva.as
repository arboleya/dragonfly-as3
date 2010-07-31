package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.lib.eggs.GlowEgg;

	import flash.filters.GlowFilter;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class GlowLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : GlowFilter;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function GlowLarva(
			target : *,
			use_frames : Boolean,
			fps : Number
		)
		{
			super( target, use_frames, fps );
			_filter = new GlowFilter(0, 0, 0, 0, 0, 0, false, false);
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : GlowFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf(
			inner : Boolean,
			knockout : Boolean,
			quality : Number
		) : GlowLarva 
		{
			filter.inner = inner;
			filter.knockout = knockout;
			filter.quality = quality;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function  color(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.COLOR, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  alpha(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.ALPHA, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  blur_x(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.BLUR_X, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  blur_y(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.BLUR_Y, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  strength(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.STRENGTH, end, start );
			return this;
		}
	}
}