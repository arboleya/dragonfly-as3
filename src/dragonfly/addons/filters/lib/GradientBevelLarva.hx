package dragonfly.addons.filters.lib;

import dragonfly.addons.filters.lib.eggs.GradientBevelEgg;

import flash.filters.GradientBevelFilter;

/**
 * @author nybras | nybras@codeine.it
 */
class GradientBevelLarva extends BaseFilterLarva 
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _filter : GradientBevelFilter;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function new( target : Dynamic )
	{
		super( target );
		_filter = new GradientBevelFilter( 0, 0, [ 0x000000 ], [ 0 ], [], 0, 0, 0, 0 );
	}

	/* ----- FILTER GETTER ---------------------------------------------- */

	/**
	 * TODO: write documentation
	 */
	public var filter( _gete_filter, never ) : GradientBevelFilter;
	private function _get_filter() : GradientBevelFilter
	{
		return _filter;
	}

	/* ----- CONFIGURATION VALUES --------------------------------------- */
	public function conf(
		colors : Array<Int>,
		alphas : Array<Float>,
		ratios : Array<Int>,
		type : String,
		knockout : Bool,
		quality : Int
	) : GradientBevelLarva
	{
		_filter.colors = colors;
		_filter.alphas = alphas;
		_filter.ratios = ratios;
		_filter.type = type;
		_filter.knockout = knockout;
		_filter.quality = quality;
		return this;
	}

	/* ----- ANIMATIONS ------------------------------------------------- */
	public function distance(
		end : Float,
		?start : Float
	) : GradientBevelLarva
	{
		_lay( GradientBevelEgg, GradientBevelEgg.DISTANCE, end, start );
		return this;
	}

	public function angle(
		end : Float,
		?start : Float
	) : GradientBevelLarva
	{
		_lay( GradientBevelEgg, GradientBevelEgg.ANGLE, end, start );
		return this;
	}

	public function blur_x(
		end : Float,
		?start : Float
	) : GradientBevelLarva
	{
		_lay( GradientBevelEgg, GradientBevelEgg.BLUR_X, end, start );
		return this;
	}

	public function blur_y(
		end : Float,
		?start : Float
	) : GradientBevelLarva
	{
		_lay( GradientBevelEgg, GradientBevelEgg.BLUR_Y, end, start );
		return this;
	}

	public function blur_xy(
		end_x : Int,
		end_y : Int,
		?start_x : Int = undefined,
		?start_y : Int = undefined
	) : GradientBevelLarva
	{
		blur_x( end_x, start_x );
		blur_y( end_y, start_y );
		return this;
	}

	public function strength(
		end : Float,
		?start : Float
	) : GradientBevelLarva
	{
		_lay( GradientBevelEgg, GradientBevelEgg.STRENGTH, end, start );
		return this;
	}
}