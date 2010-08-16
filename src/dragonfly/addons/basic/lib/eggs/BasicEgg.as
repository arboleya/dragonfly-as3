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