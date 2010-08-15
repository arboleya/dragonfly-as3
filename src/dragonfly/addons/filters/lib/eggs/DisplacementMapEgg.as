package dragonfly.addons.filters.lib.eggs 
{
	import dragonfly.addons.filters.lib.DisplacementMapLarva;
	import dragonfly.core.Egg;
	import dragonfly.core.Larva;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class DisplacementMapEgg extends Egg 
	{
		/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
		public static const SCALE_X : String = "scaleX" ;
		public static const SCALE_Y : String = "scaleY";

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function DisplacementMapEgg(
			larva : Larva,
			props : Array,
			types : Array,
			ends : Array,
			starts : Array
		)
		{
			super( larva, props, types, ends, starts );
			_prop_target = _displacement_map_larva.filter;
		}

		/* ----- GETTER / CASTER -------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		private function get _displacement_map_larva() : DisplacementMapLarva
		{
			return DisplacementMapLarva( _larva );
		}

		/* ----- RENDERING -------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function render( prop : String, value : * ) : void
		{
			_displacement_map_larva.filter[ prop ] = value;
			_displacement_map_larva.close.refresh( );
		}

		/* ----- START VALUE EVALUATION ------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override protected function _get_start_value( prop : String ) : *
		{
			return _displacement_map_larva.filter[ prop ];
		}
	}
}
