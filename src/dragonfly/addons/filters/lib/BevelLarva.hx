package dragonfly.addons.filters.lib; 

import dragonfly.addons.filters.lib.eggs.BevelEgg;

import dragonfly.core.Nymph;

import flash.filters.BevelFilter;

/**
 * @author nybras | nybras@codeine.it
 */
class BevelLarva extends BaseFilterLarva 
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _filter : BevelFilter;

	/* ----- FILTER PROPERTIES (non tweenable) -------------------------- */
	private var _type : String;

	private var _knockout : Bool;

	private var _quality : Int;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function new( target : Dynamic )
	{
		super( target );
		_filter = new BevelFilter( 0, 0, 0, 0, 0, 0, 0, 0, 0 );
	}

	/* ----- FILTER GETTER ---------------------------------------------- */

	/*
	 * TODO: write documentation
	 */
	public var filter( _gete_filter, never ) : BevelFilter;
	private function _get_filter() : BevelFilter
	{
		return _filter;
	}

	/* ----- CONFIGURATION VALUES --------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function conf(
		type : String,
		knockout : Bool,
		quality : Int
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
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.DISTANCE, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function angle(
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.ANGLE, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function highlight_color(
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.HIGHLIGHTCOLOR, end, start, Nymph.HEXADECIMAL );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function highlight_alpha(
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.HIGHLIGHTALPHA, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function shadow_color(
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.SHADOWCOLOR, end, start, Nymph.HEXADECIMAL );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function shadow_alpha(
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.SHADOWALPHA, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function strength(
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.STRENGTH, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function blur_x(
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.BLURX, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function blur_y(
		end : Float,
		?start : Float
	) : BevelLarva
	{
		_lay( BevelEgg, BevelEgg.BLURY, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function blur_xy(
		end_x : Float,
		end_y : Float,
		?start_x : Float,
		?start_y : Float
	) : BevelLarva
	{
		blur_x( end_x, start_x );
		blur_y( end_y, start_y );
		return this;
	}
}