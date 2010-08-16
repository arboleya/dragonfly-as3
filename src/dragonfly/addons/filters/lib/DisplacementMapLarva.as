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
	import dragonfly.addons.filters.lib.eggs.DisplacementMapEgg;

	import flash.display.BitmapData;
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Point;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class DisplacementMapLarva extends BaseFilterLarva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _filter : DisplacementMapFilter;

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function DisplacementMapLarva( target : * )
		{
			super( target );
			_filter = new DisplacementMapFilter( );
		}

		/* ----- FILTER GETTER ---------------------------------------------- */

		/**
		 * TODO: write documentation
		 */
		public function get filter() : DisplacementMapFilter
		{
			return _filter;
		}

		/* ----- CONFIGURATION VALUES --------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function conf(
			component_x : Number,
			component_y : Number,
			map_bitmap : BitmapData,
			map_point : Point,
			color : Number,
			alpha : Number,
			mode : String
		) : DisplacementMapLarva 
		{
			_filter.componentX = component_x;
			_filter.componentY = component_y;
			_filter.mapBitmap = map_bitmap;
			_filter.mapPoint = map_point;
			_filter.color = color;
			_filter.alpha = alpha;
			_filter.mode = mode;
			return this;
		}

		/* ----- ANIMATIONS ------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function scale_x(
			end : Number,
			start : Number = undefined
		) : DisplacementMapLarva
		{
			_lay( DisplacementMapEgg, DisplacementMapEgg.SCALE_X, end, start );
			return this;
		}

		/**
		 * TODO: write documentation
		 */
		public function scale_y(
			end : Number,
			start : Number = undefined
		) : DisplacementMapLarva
		{
			_lay( DisplacementMapEgg, DisplacementMapEgg.SCALE_Y, end, start );
			return this;
		}		
	}
}