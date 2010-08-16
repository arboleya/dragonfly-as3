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

package dragonfly.addons.filters.lib.eggs 
{
	import dragonfly.addons.filters.lib.ConvolutionLarva;
	import dragonfly.core.Egg;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class ConvolutionEgg extends Egg 
	{
		/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
		public static const MATRIX : String = "matrix";

		public static const DIVISOR : String = "divisor";

		public static const BIAS : String = "bias";

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override public function init() : void
		{
			_prop_target = _convolution_larva.filter;
		}

		/* ----- GETTER / CASTER -------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		private function get _convolution_larva() : ConvolutionLarva
		{
			return ConvolutionLarva( _larva );
		}

		/* ----- RENDERING -------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function render( prop : String, value : * ) : void
		{
			_convolution_larva.filter[ prop ] = value;
			_convolution_larva.close.refresh( );
		}

		/* ----- START VALUE EVALUATION ------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		override protected function _get_start_value( prop : String ) : *
		{
			return _convolution_larva.filter[ prop ];
		}
	}
}