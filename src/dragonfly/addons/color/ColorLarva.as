/* -----------------------------------------------------------------------------
Dragonfly - ActionScript Animation Suite. Copyright (C) 2010 Codeine.
--------------------------------------------------------------------------------
   
This library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.
		
This library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this library; if not, write to the Free Software Foundation,
Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

===================
Codeine
http://codeine.it
contact@codeine.it
===================

----------------------------------------------------------------------------- */

package dragonfly.addons.color 
{
	import dragonfly.addons.color.lib.eggs.ColorEgg;
	import dragonfly.addons.interfaces.ILarva;
	import dragonfly.core.Larva;
	import dragonfly.core.Nymph;

	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class ColorLarva extends Larva implements ILarva
	{
		/* ----- TRANSFORM INSTANCE ----------------------------------------- */
		public var transform : ColorTransform;

		/* ----- INITIALIZING ----------------------------------------------- */
		public function ColorLarva( target : * )
		{
			super( target );
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
				start_rgb = [ null, null, null ];
			else
				start_rgb = Nymph.hex2rgb( start );
			
			_lay( ColorEgg, ColorEgg.RED_OFFSET, end_rgb[ 0 ], start_rgb[ 0 ] );
			_lay( ColorEgg, ColorEgg.GREEN_OFFSET, end_rgb[ 1 ], start_rgb[ 1 ] );
			_lay( ColorEgg, ColorEgg.BLUE_OFFSET, end_rgb[ 2 ], start_rgb[ 2 ] );
			
			return this;
		}

		public function refresh() : void
		{
			( target as DisplayObject ).transform.colorTransform = transform;
		}
	}
}