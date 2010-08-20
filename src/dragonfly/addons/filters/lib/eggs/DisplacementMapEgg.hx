package dragonfly.addons.filters.lib.eggs;

import dragonfly.addons.filters.lib.DisplacementMapLarva;
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class DisplacementMapEgg extends Egg 
{
	/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
	public static inline var SCALE_X : String = "scaleX" ;

	public static inline var SCALE_Y : String = "scaleY";

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override public function init() : Void
	{
		_prop_target = _displacement_map_larva.filter;
	}

	/* ----- GETTER / CASTER -------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	private var _displacement_map_larva( _get_displacement_map_larva, never ) : DisplacementMapLarva;
	private function _get_displacement_map_larva() : DisplacementMapLarva
	{
		return DisplacementMapLarva( _larva );
	}

	/* ----- RENDERING -------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function render( prop : String, value : Dynamic ) : Void
	{
		_displacement_map_larva.filter[ prop ] = value;
		_displacement_map_larva.close.refresh( );
	}

	/* ----- START VALUE EVALUATION ------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override private function _get_start_value( prop : String ) : Dynamic
	{
		return _displacement_map_larva.filter[ prop ];
	}
}