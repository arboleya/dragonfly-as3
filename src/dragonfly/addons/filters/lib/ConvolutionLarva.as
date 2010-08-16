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

package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.lib.eggs.ConvolutionEgg;
	import dragonfly.core.Nymph;

	import flash.filters.ConvolutionFilter;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class ConvolutionLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : ConvolutionFilter;

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function ConvolutionLarva( target : * )
		{
			super( target );
			_filter = new ConvolutionFilter( 1, 1, [ 1 ], 1, 0 );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : ConvolutionFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf(
			preserve_alpha : Boolean,
			clamp : Boolean,
			matrix_x : Number,
			matrix_y : Number,
			color : Number,
			alpha : Number
		) : ConvolutionLarva 
		{
			_filter.preserveAlpha = preserve_alpha;
			_filter.clamp = clamp;
			_filter.matrixX = matrix_x;
			_filter.matrixY = matrix_y;
			_filter.color = color;
			_filter.alpha = alpha;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function matrix(
			end : Array,
			start : Array = undefined
		) : ConvolutionLarva
		{
			_lay( ConvolutionEgg, ConvolutionEgg.MATRIX, end, start, Nymph.ARRAY );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function divisor(
			end : Number,
			start : Number = undefined
		) : ConvolutionLarva
		{
			_lay( ConvolutionEgg, ConvolutionEgg.DIVISOR, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function bias(
			end : Number,
			start : Number = undefined
		) : ConvolutionLarva
		{
			_lay( ConvolutionEgg, ConvolutionEgg.BIAS, end, start );
			return this;
		}
	}
}