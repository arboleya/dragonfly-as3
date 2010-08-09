package dragonfly.addons.basic.lib.eggs 
{
	import dragonfly.core.Egg;
	import dragonfly.core.Larva;
	import dragonfly.core.gunz.NymphBullet;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BasicEgg extends Egg
	{
		public static const X : String = "x";
		public static const Y : String = "y";
		public static const Z : String = "z";
		public static const XSCALE : String = "scaleX";
		public static const YSCALE : String = "scaleY";
		public static const ZSCALE : String = "scaleZ";
		public static const ALPHA : String = "alpha";
		public static const ROTATION : String = "rotation";

		
		
		public function BasicEgg(
			prop : String,
			larva : Larva,
			end : Number,
			start : Number
		)
		{
			super( prop, larva, end, start );
		}

		public function render( bullet : NymphBullet ) : void
		{
			for each( var target : * in targets )
				target[ _prop ] = bullet.value;
		}
	}
}
