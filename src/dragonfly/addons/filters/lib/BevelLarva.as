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
	import dragonfly.addons.filters.lib.eggs.BevelEgg;
	import dragonfly.core.Nymph;

	import flash.filters.BevelFilter;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BevelLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : BevelFilter;

		/* ----- FILTER PROPERTIES (non tweenable) -------------------------- */
		private var _type : String;

		private var _knockout : Boolean;

		private var _quality : int;

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function BevelLarva( target : * )
		{
			super( target );
			_filter = new BevelFilter( 0, 0, 0, 0, 0, 0, 0, 0, 0 );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : BevelFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf(
			type : String,
			knockout : Boolean,
			quality : int
		) : BevelLarva 
		{
			_filter.type = ( _type = type );
			_filter.knockout = ( _knockout = knockout );
			_filter.quality = ( _quality = quality );
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function distance(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			_lay( BevelEgg, BevelEgg.DISTANCE, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function angle(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			_lay( BevelEgg, BevelEgg.ANGLE, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function highlight_color(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			_lay( BevelEgg, BevelEgg.HIGHLIGHTCOLOR, end, start, Nymph.HEXADECIMAL );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function highlight_alpha(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			_lay( BevelEgg, BevelEgg.HIGHLIGHTALPHA, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function shadow_color(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			trace( "SHADOW COLOR" );
			_lay( BevelEgg, BevelEgg.SHADOWCOLOR, end, start, Nymph.HEXADECIMAL );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function shadow_alpha(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			_lay( BevelEgg, BevelEgg.SHADOWALPHA, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function strength(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			_lay( BevelEgg, BevelEgg.STRENGTH, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function blur_x(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			_lay( BevelEgg, BevelEgg.BLURX, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function blur_y(
			end : Number,
			start : Number = undefined
		) : BevelLarva
		{
			_lay( BevelEgg, BevelEgg.BLURY, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function blur_xy(
			end_x : Number,
			end_y : Number,
			start_x : Number = undefined,
			start_y : Number = undefined
		) : BevelLarva
		{
			blur_x( end_x, start_x );
			blur_y( end_y, start_y );
			return this;
		}
	}
}