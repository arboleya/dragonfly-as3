package dragonfly.addons.basic.lib.eggs;
 
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class BasicEgg extends Egg
{
	public static inline var X : String = "x";

	public static inline var Y : String = "y";

	public static inline var Z : String = "z";

	public static inline var COLOR : String = "color";

	public static inline var XSCALE : String = "scaleX";

	public static inline var YSCALE : String = "scaleY";

	public static inline var ZSCALE : String = "scaleZ";

	public static inline var ALPHA : String = "alpha";

	public static inline var ROTATION : String = "rotation";
	
	override function init() : Void
	{
		_prop_target = larva.target;
	}

	public function render( prop : String, value : Dynamic ) : Void
	{
		Reflect.setField( larva.target, prop, value );
	}
}