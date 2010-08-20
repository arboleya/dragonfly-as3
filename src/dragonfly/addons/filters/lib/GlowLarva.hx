package dragonfly.addons.filters.lib;
 
import dragonfly.addons.filters.lib.eggs.GlowEgg;
import dragonfly.core.Nymph;

import flash.filters.GlowFilter;

/**
 * @author nybras | nybras@codeine.it
 */
class GlowLarva extends BaseFilterLarva 
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _filter : GlowFilter;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function new( target : Dynamic )
	{
		super( target );
		_filter = new GlowFilter( 0, 0, 0, 0, 0, 0, false, false );
	}

	/* ----- FILTER GETTER ---------------------------------------------- */

	/**
	 * TODO: write documentation
	 */
	public var filter( _gete_filter, never ) : GlowFilter;
	private function _get_filter() : GlowFilter
	{
		return _filter;
	}

	/* ----- CONFIGURATION VALUES --------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function conf(
		inner : Bool,
		knockout : Bool,
		quality : Int
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
		end : Float,
		?start : Float
	) : GlowLarva
	{
		_lay( GlowEgg, GlowEgg.COLOR, end, start, Nymph.HEXADECIMAL );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  alpha(
		end : Float,
		?start : Float
	) : GlowLarva
	{
		_lay( GlowEgg, GlowEgg.ALPHA, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  blur_x(
		end : Float,
		?start : Float
	) : GlowLarva
	{
		_lay( GlowEgg, GlowEgg.BLUR_X, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  blur_y(
		end : Float,
		?start : Float
	) : GlowLarva
	{
		_lay( GlowEgg, GlowEgg.BLUR_Y, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function  strength(
		end : Float,
		?start : Float
	) : GlowLarva
	{
		_lay( GlowEgg, GlowEgg.STRENGTH, end, start );
		return this;
	}
}