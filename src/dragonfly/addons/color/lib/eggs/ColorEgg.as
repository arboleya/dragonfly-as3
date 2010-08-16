package dragonfly.addons.color.lib.eggs 
{
	import dragonfly.addons.color.ColorLarva;
	import dragonfly.addons.interfaces.IEgg;
	import dragonfly.core.Egg;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class ColorEgg extends Egg implements IEgg
	{
		public static const RED_MULTIPLIER : String = "redMultiplier";

		public static const GREEN_MULTIPLIER : String = "greenMultiplier";

		public static const BLUE_MULTIPLIER : String = "blueMultiplier";

		public static const ALPHA_MULTIPLIER : String = "alphaMultiplier";

		public static const RED_OFFSET : String = "redOffset";

		public static const GREEN_OFFSET : String = "greenOffset";

		public static const BLUE_OFFSET : String = "blueOffset";

		public static const ALPHA_OFFSET : String = "alphaOffset";

		override public function init() : void
		{
			_prop_target = _color_larva.transform;
		}

		public function render( prop : String, value : * ) : void
		{
			_color_larva.transform[ prop ] = value;
			_color_larva.refresh( );
		}

		private function get _color_larva() : ColorLarva
		{
			return ColorLarva( _larva );
		}

		override protected function _get_start_value( prop : String ) : *
		{
			return _color_larva.transform[ prop ];
		}
	}
}