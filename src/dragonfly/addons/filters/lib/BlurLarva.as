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
	import dragonfly.addons.filters.lib.eggs.BlurEgg;

	import flash.filters.BlurFilter;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BlurLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : BlurFilter;

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function BlurLarva( target : * )
		{
			super( target );
			_filter = new BlurFilter( 0, 0, 4 );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : BlurFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf( quality : int ) : BlurLarva 
		{
			_filter.quality = quality;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function x(
			end : Number,
			start : Number = undefined
		) : BlurLarva
		{
			_lay( BlurEgg, BlurEgg.X, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function y(
			end : Number,
			start : Number = undefined
		) : BlurLarva
		{
			_lay( BlurEgg, BlurEgg.Y, end, start );
			return this;
		}		

		/**
		 * TODO: write documentation
		 */
		public function xy(
			end_x : Number,
			end_y : Number,
			start_x : Number = undefined,
			start_y : Number = undefined
		) : BlurLarva
		{
			x( end_x, start_x );
			x( end_y, start_y );
			return this;
		}
	}
}