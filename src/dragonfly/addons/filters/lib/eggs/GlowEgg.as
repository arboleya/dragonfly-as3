package dragonfly.addons.filters.lib.eggs 
{
	import dragonfly.addons.filters.lib.GlowLarva;
	import dragonfly.core.Egg;
	import dragonfly.core.Larva;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class GlowEgg extends Egg 
	{
		/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
		public static const COLOR : String = "color";
		public static const ALPHA : String = "alpha";
		public static const BLUR_X : String = "blurX";
		public static const BLUR_Y : String = "blurY";
		public static const STRENGTH : String = "strength";

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function GlowEgg(
			prop : String,
			larva : Larva,
			end : Number,
			start : Number
		)
		{
			super( prop, larva, end, start );
			_prop_target = _glow_larva.filter;
		}

		/* ----- GETTER / CASTER -------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		private function get _glow_larva() : GlowLarva
		{
			return GlowLarva( _larva );
		}

		/* ----- RENDERING -------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function render( value : * ) : void
		{
			_glow_larva.filter[ _prop ] = value;
			_glow_larva.close.refresh( );
		}

		/* ----- START VALUE EVALUATION ------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override protected function _get_start_value() : *
		{
			return _glow_larva.filter[ _prop ];
		}
	}
}
