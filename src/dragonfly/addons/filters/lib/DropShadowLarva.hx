package dragonfly.addons.filters.lib; 

import dragonfly.addons.filters.lib.eggs.DropShadowEgg;
import dragonfly.core.Nymph;

import flash.filters.DropShadowFilter;

/**
 * @author nybras | nybras@codeine.it
 */
class DropShadowLarva extends BaseFilterLarva 
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _filter : DropShadowFilter;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function new( target : Dynamic )
	{
		super( target );
		_filter = new DropShadowFilter( 0, 0, 0, 0, 0, 0, 0, 0 );
	}

	/* ----- FILTER GETTER ---------------------------------------------- */

	/**
	 * TODO: write documentation
	 */
	public var filter( _get_filter, never ) : DropShadowFilter;
	private function _get_filter() : DropShadowFilter
	{
		return _filter;
	}

	/* ----- CONFIGURATION VALUES --------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function conf(
		knockout : Bool,
		hide_object : Bool,
		inner : Bool,
		quality : Int
	) : DropShadowLarva 
	{
		filter.knockout = knockout;
		filter.hideObject = hide_object;
		filter.inner = inner;
		filter.quality = quality;
		return this;
	}

	/* ----- ANIMATIONS ------------------------------------------------- */
	/**
	 * TODO: write documentation
	 */
	public function distance(
		end : Float,
		?start : Float
	) : DropShadowLarva
	{
		_lay( DropShadowEgg, DropShadowEgg.DISTANCE, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  angle(
		end : Float,
		?start : Float
	) : DropShadowLarva
	{
		_lay( DropShadowEgg, DropShadowEgg.ANGLE, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  color(
		end : Float,
		?start : Float
	) : DropShadowLarva
	{
		_lay( DropShadowEgg, DropShadowEgg.COLOR, end, start, Nymph.HEXADECIMAL );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  alpha(
		end : Float,
		?start : Float
	) : DropShadowLarva
	{
		_lay( DropShadowEgg, DropShadowEgg.ALPHA, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  blur_x(
		end : Float,
		?start : Float
	) : DropShadowLarva
	{
		_lay( DropShadowEgg, DropShadowEgg.BLUR_X, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  blur_y(
		end : Float,
		?start : Float
	) : DropShadowLarva
	{
		_lay( DropShadowEgg, DropShadowEgg.BLUR_Y, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  strength(
		end : Float,
		?start : Float
	) : DropShadowLarva
	{
		_lay( DropShadowEgg, DropShadowEgg.STRENGTH, end, start );
		return this;
	}
}