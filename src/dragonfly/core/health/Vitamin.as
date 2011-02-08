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

package dragonfly.core.health 
{
	import com.robertpenner.easing.Back;
	import com.robertpenner.easing.Bounce;
	import com.robertpenner.easing.Circ;
	import com.robertpenner.easing.Cubic;
	import com.robertpenner.easing.Elastic;
	import com.robertpenner.easing.Expo;
	import com.robertpenner.easing.Linear;
	import com.robertpenner.easing.Quad;
	import com.robertpenner.easing.Quart;
	import com.robertpenner.easing.Quint;
	import com.robertpenner.easing.Sine;

	import flash.utils.Dictionary;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Vitamin
	{
		public static var VITAMINS : Dictionary;
		{
			load( 100 );
		}

		public static function load( steps : Number = 100 ) : void
		{
			var klass : Class;
			var equation : Function;
			var type : String;
			var time : int;
			var value : String;
			var params : Array;
			var computed : Array;
			var decimal_stripper : RegExp;
			
			VITAMINS = new Dictionary( );
			decimal_stripper = /[0-9]+(\.*)[0-9]{0,3}/;
			
			for each( klass in [ Back,
				Bounce,
				Circ,
				Cubic,
				Elastic,
				Expo,
				Linear,
				Quad,
				Quart,
				Quint,
				Sine ] )
			{
				for each( type in [ "easeIn", "easeOut", "easeInOut" ])
				{
					time = 0;
					computed = [];
					equation = klass[ type ];
					
					while( time < steps )
					{
						params = [ time++, 0, 1, steps - 1 ];
						value = equation.apply( equation.prototype, params );
						computed.push( value.match( decimal_stripper )[0] );
					}
					
					VITAMINS[ equation ] = computed;
				}
			}
		}

		public static function drop( equation : Function ) : Array
		{
			return VITAMINS[ equation ];
		}
	}
}