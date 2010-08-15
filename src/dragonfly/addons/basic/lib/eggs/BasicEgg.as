package dragonfly.addons.basic.lib.eggs 
{
	import dragonfly.addons.interfaces.IEgg;
	import dragonfly.core.Egg;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BasicEgg extends Egg implements IEgg
	{
		public static const X : String = "x";
		public static const Y : String = "y";
		public static const Z : String = "z";
		public static const COLOR : String = "color";
		public static const XSCALE : String = "scaleX";
		public static const YSCALE : String = "scaleY";
		public static const ZSCALE : String = "scaleZ";
		public static const ALPHA : String = "alpha";
		public static const ROTATION : String = "rotation";

		
		
		override public function init() : void
		{
			_prop_target = _larva.target;
		}

		public function render( prop : String, value : * ) : void
		{
			_larva.target[ prop ] = value;
		}
	}
}