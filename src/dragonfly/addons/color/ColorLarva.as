package dragonfly.addons.color 
{
	import dragonfly.addons.color.lib.eggs.ColorEgg;
	import dragonfly.core.Larva;
	import dragonfly.core.Nymph;

	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class ColorLarva extends Larva
	{
		/* ----- TRANSFORM INSTANCE ----------------------------------------- */
		public var transform : ColorTransform;

		/* ----- INITIALIZING ----------------------------------------------- */
		public function ColorLarva( target : * )
		{
			super( target);
			transform = ( target as DisplayObject ).transform.colorTransform;
		}
		
		public function hex(
			end : Number,
			start : Number = undefined
		) : ColorLarva
		{
			var end_rgb : Array;
			var start_rgb : Array;
			
			end_rgb = Nymph.hex2rgb( end );
			if( isNaN( start ) )
				start_rgb = [null, null, null];
			else
				start_rgb = Nymph.hex2rgb( start );
			
			_lay( ColorEgg, ColorEgg.RED_OFFSET, end_rgb[ 0 ], start_rgb[ 0 ] );
			_lay( ColorEgg, ColorEgg.GREEN_OFFSET, end_rgb[ 1 ], start_rgb[ 1 ] );
			_lay( ColorEgg, ColorEgg.BLUE_OFFSET, end_rgb[ 2 ], start_rgb[ 2 ] );
			
			return this;
		}
		
		public function refresh () : void
		{
			( target as DisplayObject ).transform.colorTransform = transform;
		}
	}
}