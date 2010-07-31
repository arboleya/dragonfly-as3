package dragonfly.addons.filters.lib.eggs 
{
	import dragonfly.addons.filters.lib.GradientBevelLarva;
	import dragonfly.core.Egg;
	import dragonfly.core.Larva;
	import dragonfly.core.gunz.NymphBullet;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class GradientBevelEgg extends Egg 
	{
		/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function GradientBevelEgg(
			prop : String,
			larva : Larva,
			end : Number,
			start : Number
		)
		{
			super( prop, larva, end, start );
			_prop_target = _gradient_bevel_larva.filter;
		}

		/* ----- GETTER / CASTER -------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		private function get _gradient_bevel_larva() : GradientBevelLarva
		{
			return GradientBevelLarva( _larva );
		}

		/* ----- RENDERING -------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function render( bullet : NymphBullet ) : void
		{
			_gradient_bevel_larva.filter[ _prop ] = bullet.value;
			_gradient_bevel_larva.close.refresh( );
		}

		/* ----- START VALUE EVALUATION ------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override protected function _get_start_value() : *
		{
			return _gradient_bevel_larva.filter[ _prop ];
		}
	}
}
