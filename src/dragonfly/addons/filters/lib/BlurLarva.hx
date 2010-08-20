package dragonfly.addons.filters.lib; 

import dragonfly.addons.filters.lib.eggs.BlurEgg;

import flash.filters.BlurFilter;

/**
 * @author nybras | nybras@codeine.it
 */
class BlurLarva extends BaseFilterLarva 
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _filter : BlurFilter;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function new( target : Dynamic )
	{
		super( target );
		_filter = new BlurFilter( 0, 0, 4 );
	}

	/* ----- FILTER GETTER ---------------------------------------------- */

	public var filter( _gete_filter, never ) : BlurFilter;
	private function _get_filter() : BlurFilter
	{
		return _filter;
	}
	
	/* ----- CONFIGURATION VALUES --------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function conf( quality : Int ) : BlurLarva 
	{
		_filter.quality = quality;
		return this;
	}

	/* ----- ANIMATIONS ------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function x(
		end : Float,
		?start : Float
	) : BlurLarva
	{
		_lay( BlurEgg, BlurEgg.X, end, start );
		return this;
	}

	/**
	 * TODO: write documentation
	 */
	public function y(
		end : Float,
		?start : Float
	) : BlurLarva
	{
		_lay( BlurEgg, BlurEgg.Y, end, start );
		return this;
	}		

	/**
	 * TODO: write documentation
	 */
	public function xy(
		end_x : Float,
		end_y : Float,
		?start_x : Float,
		?start_y : Float
	) : BlurLarva
	{
		x( end_x, start_x );
		x( end_y, start_y );
		return this;
	}
}