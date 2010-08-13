package dragonfly.addons.filters.lib.eggs 
{
	import dragonfly.addons.filters.lib.GradientGlowLarva;
	import dragonfly.core.Larva;
	import dragonfly.core.Egg;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class GradientGlowEgg extends Egg 
	{
		/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
		public static const DISTANCE : String = "distance";
		public static const ANGLE : String = "angle";
		public static const BLUR_X : String = "blurX";
		public static const BLUR_Y : String = "blurY";
		public static const STRENGTH : String = "strength";

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function GradientGlowEgg(
			prop : String,
			larva : Larva,
			end : Number,
			start : Number,
			nymph_class : Class
		)
		{
			super( prop, larva, end, start, nymph_class );
			_prop_target = _gradient_glow_larva.filter;
		}

		/* ----- GETTER / CASTER -------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		private function get _gradient_glow_larva() : GradientGlowLarva
		{
			return GradientGlowLarva( _larva );
		}

		/* ----- RENDERING -------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function render( value : * ) : void
		{
			_gradient_glow_larva.filter[ _prop ] = value;
			_gradient_glow_larva.close.refresh( );
		}

		/* ----- START VALUE EVALUATION ------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override protected function _get_start_value() : *
		{
			return _gradient_glow_larva.filter[ _prop ];
		}
	}
}
