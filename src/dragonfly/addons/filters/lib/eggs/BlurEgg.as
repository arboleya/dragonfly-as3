package dragonfly.addons.filters.lib.eggs 
{
	import dragonfly.addons.filters.lib.BlurLarva;
	import dragonfly.core.Egg;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BlurEgg extends Egg 
	{
		/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
		public static const X : String = "blurX";

		public static const Y : String = "blurY";

		public static const QUALITY : String = "quality";

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override public function init() : void
		{
			_prop_target = _blur_larva.filter;
		}

		/* ----- GETTER / CASTER -------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		private function get _blur_larva() : BlurLarva
		{
			return BlurLarva( _larva );
		}

		/* ----- RENDERING -------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function render( prop : String, value : * ) : void
		{
			_blur_larva.filter[ prop ] = value;
			_blur_larva.close.refresh( );
		}

		/* ----- START VALUE EVALUATION ------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override protected function _get_start_value( prop : String ) : *
		{
			return _blur_larva.filter[ prop ];
		}
	}
}
