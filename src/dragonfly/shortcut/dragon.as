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
}