package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.lib.eggs.DropshadowEgg;

	import flash.filters.DropShadowFilter;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class DropshadowLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : DropShadowFilter;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function DropshadowLarva(
			target : *,
			use_frames : Boolean,
			fps : Number
		)
		{
			super( target, use_frames, fps );
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
		) : DropshadowLarva 
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
		) : DropshadowLarva
		{
			_lay( DropshadowEgg, DropshadowEgg.DISTANCE, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  angle(
			end : Number,
			start : Number = undefined
		) : DropshadowLarva
		{
			_lay( DropshadowEgg, DropshadowEgg.ANGLE, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  color(
			end : Number,
			start : Number = undefined
		) : DropshadowLarva
		{
			_lay( DropshadowEgg, DropshadowEgg.COLOR, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  alpha(
			end : Number,
			start : Number = undefined
		) : DropshadowLarva
		{
			_lay( DropshadowEgg, DropshadowEgg.ALPHA, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  blur_x(
			end : Number,
			start : Number = undefined
		) : DropshadowLarva
		{
			_lay( DropshadowEgg, DropshadowEgg.BLUR_X, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  blur_y(
			end : Number,
			start : Number = undefined
		) : DropshadowLarva
		{
			_lay( DropshadowEgg, DropshadowEgg.BLUR_Y, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  strength(
			end : Number,
			start : Number = undefined
		) : DropshadowLarva
		{
			_lay( DropshadowEgg, DropshadowEgg.STRENGTH, end, start );
			return this;
		}
	}
}