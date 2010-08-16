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

package dragonfly.shortcut
{
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public function dragon(
		target : Object
	) : Bundle
	{
		return Bundle.init( target );
	}
}

import dragonfly.addons.basic.BasicLarva;
import dragonfly.addons.color.ColorLarva;
import dragonfly.addons.filters.FilterLarva;

import flash.utils.Dictionary;

internal class Bundle
{
	private static var _bundles : Dictionary = new Dictionary( );

	internal static function init( target : * ) : Bundle
	{
		if( !_bundles.hasOwnProperty( target ) )
			_bundles[ target ] = new Bundle( target );
		return _bundles[ target ];
	}

	private var _basic : BasicLarva;

	private var _filter : FilterLarva;

	private var _color : ColorLarva;

	public function Bundle( target : *  ) 
	{
		_basic = new BasicLarva( target );
		_filter = new FilterLarva( target );
		_color = new ColorLarva( target );
	}

	public function get basic() : BasicLarva
	{
		return _basic;
	}

	public function get filter() : FilterLarva
	{
		return _filter;
	}

	public function get color() : ColorLarva
	{
		return _color;
	}

	public function destroy() : void
	{
		_bundles[ this ] = null;
		delete _bundles[ this ];
		
		_basic.destroy( );
		_filter.destroy( );
		_color.destroy( );
		
		_basic = null;
		_filter = null;
		_color = null;
	}
}