package dragonfly.addons.filters.lib 
{
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
		public function GradientGlowLarva(
			target : *,
			use_frames : Boolean,
			fps : Number
		)
		{
			super( target, use_frames, fps );
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
		

		/* ----- ANIMATIONS ------------------------------------------------- */
	}
}