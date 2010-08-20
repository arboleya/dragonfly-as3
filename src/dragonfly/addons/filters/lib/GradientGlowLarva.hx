package dragonfly.addons.filters.lib;
 
import dragonfly.addons.filters.lib.eggs.GradientGlowEgg;

import flash.filters.GradientGlowFilter;

/**
 * @author nybras | nybras@codeine.it
 */
class GradientGlowLarva extends BaseFilterLarva 
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _filter : GradientGlowFilter;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function new( target : Dynamic )
	{
		super( target );
		_filter = new GradientGlowFilter( 0, 0, [ 0x000000 ], [ 0 ], [ 0 ], 0, 0, 0, 0 );
	}

	/* ----- FILTER GETTER ---------------------------------------------- */

	/**
	 * TODO: write documentation
	 */
	public var filter( _get_filter, never ) : GradientGlowFilter;
	private function _get_filter() : GradientGlowFilter
	{
		return _filter;
	}

	/* ----- CONFIGURATION VALUES --------------------------------------- */
	public function conf(
		colors : Array<Int>,
		alphas : Array<Float>,
		ratios : Array<Float>,
		type : String,
		knockout : Bool,
		quality : Float
	) : GradientGlowLarva
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
	) : GradientGlowLarva
	{
		_lay( GradientGlowEgg, GradientGlowEgg.DISTANCE, end, start );
		return this;
	}

	public function angle(
		end : Float,
		?start : Float 
	) : GradientGlowLarva
	{
		_lay( GradientGlowEgg, GradientGlowEgg.ANGLE, end, start );
		return this;
	}

	public function blur_x(
		end : Float,
		?start : Float 
	) : GradientGlowLarva
	{
		_lay( GradientGlowEgg, GradientGlowEgg.BLUR_X, end, start );
		return this;
	}

	public function blur_y(
		end : Float,
		?start : Float 
	) : GradientGlowLarva
	{
		_lay( GradientGlowEgg, GradientGlowEgg.BLUR_Y, end, start );
		return this;
	}

	public function blur_xy(
		end_x : Float,
		end_y : Float,
		?start_x : Float ,
		?start_y : Float 
	) : GradientGlowLarva
	{
		blur_x( end_x, start_x );
		blur_y( end_y, start_y );
		return this;
	}

	public function strength(
		end : Float,
		?start : Float 
	) : GradientGlowLarva
	{
		_lay( GradientGlowEgg, GradientGlowEgg.STRENGTH, end, start );
		return this;
	}
}