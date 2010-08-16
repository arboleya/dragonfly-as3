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
	import dragonfly.addons.filters.lib.eggs.GlowEgg;
	import dragonfly.core.Nymph;

	import flash.filters.GlowFilter;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class GlowLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : GlowFilter;

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function GlowLarva( target : * )
		{
			super( target );
			_filter = new GlowFilter( 0, 0, 0, 0, 0, 0, false, false );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : GlowFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf(
			inner : Boolean,
			knockout : Boolean,
			quality : Number
		) : GlowLarva 
		{
			filter.inner = inner;
			filter.knockout = knockout;
			filter.quality = quality;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function  color(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.COLOR, end, start, Nymph.HEXADECIMAL );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  alpha(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.ALPHA, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  blur_x(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.BLUR_X, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  blur_y(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.BLUR_Y, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function  strength(
			end : Number,
			start : Number = undefined
		) : GlowLarva
		{
			_lay( GlowEgg, GlowEgg.STRENGTH, end, start );
			return this;
		}
	}
}