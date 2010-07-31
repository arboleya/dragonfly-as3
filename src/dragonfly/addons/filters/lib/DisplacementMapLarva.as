package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.lib.eggs.DisplacementMapEgg;

	import flash.display.BitmapData;
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Point;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class DisplacementMapLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : DisplacementMapFilter;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function DisplacementMapLarva(
			target : *,
			use_frames : Boolean,
			fps : Number
		)
		{
			super( target, use_frames, fps );
			_filter = new DisplacementMapFilter( );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : DisplacementMapFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf(
			component_x : Number,
			component_y : Number,
			map_bitmap : BitmapData,
			map_point : Point,
			color : Number,
			alpha : Number,
			mode : String
		) : DisplacementMapLarva 
		{
			_filter.componentX = component_x;
			_filter.componentY = component_y;
			_filter.mapBitmap = map_bitmap;
			_filter.mapPoint = map_point;
			_filter.color = color;
			_filter.alpha = alpha;
			_filter.mode = mode;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function scale_x(
			end : Number,
			start : Number = undefined
		) : DisplacementMapLarva
		{
			_lay( DisplacementMapEgg, DisplacementMapEgg.SCALE_X, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function scale_y(
			end : Number,
			start : Number = undefined
		) : DisplacementMapLarva
		{
			_lay( DisplacementMapEgg, DisplacementMapEgg.SCALE_Y, end, start );
			return this;
		}		
	}
}