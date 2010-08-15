package dragonfly.addons.filters.lib.eggs 
{
	import dragonfly.addons.filters.lib.BevelLarva;
	import dragonfly.core.Egg;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BevelEgg extends Egg 
	{
		/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
		public static const DISTANCE : String = "distance";
		public static const ANGLE : String = "angle";
		public static const HIGHLIGHTCOLOR : String = "highlightColor";
		public static const HIGHLIGHTALPHA : String = "highlightAlpha";
		public static const SHADOWCOLOR : String = "shadowColor";
		public static const SHADOWALPHA : String = "shadowAlpha";
		public static const BLURX : String = "blurX";
		public static const BLURY : String = "blurY";
		public static const STRENGTH : String = "strength";

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override public function init() : void
		{
			_prop_target = _bevel_larva.filter;
		}

		/* ----- GETTER / CASTER -------------------------------------------- */
				
		/**
		 * TODO: write documentation
		 */
		private function get _bevel_larva() : BevelLarva
		{
			return BevelLarva( _larva );
		}

		/* ----- RENDERING -------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function render( prop : String, value : * ) : void
		{
			_bevel_larva.filter[ prop ] = value;
			_bevel_larva.close.refresh( );
		}
		
		/* ----- START VALUE EVALUATION ------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override protected function _get_start_value( prop : String ) : *
		{
			return _bevel_larva.filter[ prop ];
		}
	}
}
