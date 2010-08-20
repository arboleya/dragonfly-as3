package dragonfly.addons.filters.lib; 

import dragonfly.addons.filters.FilterLarva;

import dragonfly.core.Larva;

/**
 * @author nybras | nybras@codeine.it
 */
class BaseFilterLarva extends Larva 
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _parent : FilterLarva;

	/* ----- INITIALIZING ----------------------------------------------- */	
	/**
	 * TODO: write documentation
	 */
	public function new( target : Dynamic )
	{
		super( target );
	}

	/* ----- CORE ------------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function close( _get_close, never ) : FilterLarva;
	private function _get_close() : FilterLarva
	{
		return _parent;
	}

	/**
	 * TODO: write documentation
	 */
	public var parent( never, _set_parent ) : Void;
	private function _set_parent( value : FilterLarva ) : Void
	{
		_parent = value;
	}
}