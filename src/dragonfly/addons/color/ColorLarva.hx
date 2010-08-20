package dragonfly.addons.color;
 
import dragonfly.addons.color.lib.eggs.ColorEgg;
import dragonfly.core.Larva;
import dragonfly.core.Nymph;

import flash.display.DisplayObject;
import flash.geom.ColorTransform;

/**
 * @author nybras | nybras@codeine.it
 */
class ColorLarva extends Larva
{
	/* ----- TRANSFORM INSTANCE ----------------------------------------- */
	public var transform : ColorTransform;

	/* ----- INITIALIZING ----------------------------------------------- */
	public function new( target : Dynamic )
	{
		super( target );
		transform = cast(target,DisplayObject).transform.colorTransform;
	}

	public function hex(
		end : Float,
		?start : Float
	) : ColorLarva
	{
		var end_rgb : Array<Float>;
		var start_rgb : Array<Float>;
		
		end_rgb = Nymph.hex2rgb( end );
		if( Math.isNaN( start ) )
			start_rgb = [ null, null, null ];
		else
			start_rgb = Nymph.hex2rgb( start );
		
		_lay( ColorEgg, ColorEgg.RED_OFFSET, end_rgb[ 0 ], start_rgb[ 0 ] );
		_lay( ColorEgg, ColorEgg.GREEN_OFFSET, end_rgb[ 1 ], start_rgb[ 1 ] );
		_lay( ColorEgg, ColorEgg.BLUE_OFFSET, end_rgb[ 2 ], start_rgb[ 2 ] );
		
		return this;
	}

	public function refresh() : Void
	{
		cast(target,DisplayObject).transform.colorTransform = transform;
	}
}