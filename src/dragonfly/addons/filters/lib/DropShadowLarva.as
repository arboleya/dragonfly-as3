package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.lib.eggs.DropShadowEgg;
	import dragonfly.core.Nymph;

	import flash.filters.DropShadowFilter;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class DropShadowLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : DropShadowFilter;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function DropShadowLarva( target : * )
		{
			super( target );
			_filter = new DropShadowFilter( 0, 0, 0, 0, 0, 0, 0, 0 );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : DropShadowFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf(
			knockout : Boolean,
			hide_object : Boolean,
			inner : Boolean,
			quality : Number
		) : DropShadowLarva 
		{
			filter.knockout = knockout;
			filter.hideObject = hide_object;
			filter.inner = inner;
			filter.quality = quality;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */
		/**
		 * TODO: write documentation
		 */
		public function distance(
			end : Number,
			start : Number = undefined
		) : DropShadowLarva
		{
			_lay( DropShadowEgg, DropShadowEgg.DISTANCE, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  angle(
			end : Number,
			start : Number = undefined
		) : DropShadowLarva
		{
			_lay( DropShadowEgg, DropShadowEgg.ANGLE, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  color(
			end : Number,
			start : Number = undefined
		) : DropShadowLarva
		{
			_lay( DropShadowEgg, DropShadowEgg.COLOR, end, start, Nymph.HEXADECIMAL );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  alpha(
			end : Number,
			start : Number = undefined
		) : DropShadowLarva
		{
			_lay( DropShadowEgg, DropShadowEgg.ALPHA, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  blur_x(
			end : Number,
			start : Number = undefined
		) : DropShadowLarva
		{
			_lay( DropShadowEgg, DropShadowEgg.BLUR_X, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  blur_y(
			end : Number,
			start : Number = undefined
		) : DropShadowLarva
		{
			_lay( DropShadowEgg, DropShadowEgg.BLUR_Y, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  strength(
			end : Number,
			start : Number = undefined
		) : DropShadowLarva
		{
			_lay( DropShadowEgg, DropShadowEgg.STRENGTH, end, start );
			return this;
		}
	}
}