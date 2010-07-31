package dragonfly.addons.filters.lib 
{
	import flash.filters.GradientBevelFilter;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class GradientBevelLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : GradientBevelFilter;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function GradientBevelLarva(
			target : *,
			use_frames : Boolean,
			fps : Number
		)
		{
			super( target, use_frames, fps );
			_filter = new GradientBevelFilter( 0, 0, [ 0x000000 ], [ 0 ], [], 0, 0, 0, 0 );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : GradientBevelFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		

		/* ----- ANIMATIONS ------------------------------------------------- */
	}
}