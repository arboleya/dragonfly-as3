package dragonfly.addons.filters.lib.eggs; 

import dragonfly.addons.filters.lib.DropShadowLarva;
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class DropShadowEgg extends Egg 
{
	/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
	public static inline var DISTANCE : String = "distance";

	public static inline var ANGLE : String = "angle";

	public static inline var COLOR : String = "color";

	public static inline var ALPHA : String = "alpha";

	public static inline var BLUR_X : String = "blurX";

	public static inline var BLUR_Y : String = "blurY";

	public static inline var STRENGTH : String = "strength";

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override public function init() : Void
	{
		_prop_target = _dropshadow_larva.filter;
	}

	/* ----- GETTER / CASTER -------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	private var _dropshadow_larva( _get_dropshadow_larva, never ) : DropShadowLarva;
	private function _get_dropshadow_larva() : DropShadowLarva
	{
		return DropShadowLarva( _larva );
	}

	/* ----- RENDERING -------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function render( prop : String, value : Dynamic ) : Void
	{
		_dropshadow_larva.filter[ prop ] = value;
		_dropshadow_larva.close.refresh( );
	}

	/* ----- START VALUE EVALUATION ------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override private function _get_start_value( prop : String ) : Dynamic
	{
		return _dropshadow_larva.filter[ prop ];
	}
}