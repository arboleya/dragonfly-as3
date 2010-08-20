package dragonfly.addons.filters.lib; 

import dragonfly.addons.filters.lib.eggs.ConvolutionEgg;

import dragonfly.core.Nymph;

import flash.filters.ConvolutionFilter;

/**
 * @author nybras | nybras@codeine.it
 */
class ConvolutionLarva extends BaseFilterLarva 
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _filter : ConvolutionFilter;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function new( target : Dynamic )
	{
		super( target );
		_filter = new ConvolutionFilter( 1, 1, [ 1 ], 1, 0 );
	}

	/* ----- FILTER GETTER ---------------------------------------------- */

	/*
	 * TODO: write documentation
	 */
	public var filter( _gete_filter, never ) : ConvolutionFilter;
	private function _get_filter() : ConvolutionFilter
	{
		return _filter;
	}

	/* ----- CONFIGURATION VALUES --------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function conf(
		preserve_alpha : Bool,
		clamp : Bool,
		matrix_x : Int,
		matrix_y : Int,
		color : Int,
		alpha : Int
	) : ConvolutionLarva 
	{
		_filter.preserveAlpha = preserve_alpha;
		_filter.clamp = clamp;
		_filter.matrixX = matrix_x;
		_filter.matrixY = matrix_y;
		_filter.color = color;
		_filter.alpha = alpha;
		return this;
	}

	/* ----- ANIMATIONS ------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function matrix(
		end : Array<Float>,
		?start : Array<Float>
	) : ConvolutionLarva
	{
		_lay( ConvolutionEgg, ConvolutionEgg.MATRIX, end, start, Nymph.ARRAY );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function divisor(
		end : Float,
		?start : Float
	) : ConvolutionLarva
	{
		_lay( ConvolutionEgg, ConvolutionEgg.DIVISOR, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function bias(
		end : Float,
		?start : Float
	) : ConvolutionLarva
	{
		_lay( ConvolutionEgg, ConvolutionEgg.BIAS, end, start );
		return this;
	}
}