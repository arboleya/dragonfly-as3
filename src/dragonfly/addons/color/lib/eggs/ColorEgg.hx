package dragonfly.addons.color.lib.eggs; 

import dragonfly.addons.color.ColorLarva;
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class ColorEgg extends Egg
{
	public static inline var RED_MULTIPLIER : String = "redMultiplier";

	public static inline var GREEN_MULTIPLIER : String = "greenMultiplier";

	public static inline var BLUE_MULTIPLIER : String = "blueMultiplier";

	public static inline var ALPHA_MULTIPLIER : String = "alphaMultiplier";

	public static inline var RED_OFFSET : String = "redOffset";

	public static inline var GREEN_OFFSET : String = "greenOffset";

	public static inline var BLUE_OFFSET : String = "blueOffset";

	public static inline var ALPHA_OFFSET : String = "alphaOffset";

	override function init() : Void
	{
		_prop_target = _color_larva.transform;
	}

	public function render( prop : String, value : Dynamic ) : Void
	{
		_color_larva.transform[ prop ] = value;
		_color_larva.refresh( );
	}

	private var _color_larva(_get_color_larva,never) : ColorLarva;
	private function _get_color_larva() : ColorLarva
	{
		return ColorLarva( _larva );
	}

	override function _get_start_value( prop : String ) : Dynamic
	{
		return _color_larva.transform.prop;
	}
}