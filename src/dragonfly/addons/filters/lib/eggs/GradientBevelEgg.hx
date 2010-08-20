package dragonfly.addons.filters.lib.eggs; 

import dragonfly.addons.filters.lib.GradientBevelLarva;
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class GradientBevelEgg extends Egg 
{
	/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
	public static inline var DISTANCE : String = "distance";

	public static inline var ANGLE : String = "angle";

	public static inline var BLUR_X : String = "blurX";

	public static inline var BLUR_Y : String = "blurY";

	public static inline var STRENGTH : String = "strength";

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override public function init() : Void
	{
		_prop_target = _gradient_bevel_larva.filter;
	}

	/* ----- GETTER / CASTER -------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	private var _gradient_bevel_larva( _get_gradient_bevel_larva, never ) : GradientBevelLarva;
	private function _get_gradient_bevel_larva() : GradientBevelLarva
	{
		return GradientBevelLarva( _larva );
	}

	/* ----- RENDERING -------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function render( prop : String, value : Dynamic ) : Void
	{
		_gradient_bevel_larva.filter[ prop ] = value;
		_gradient_bevel_larva.close.refresh( );
	}

	/* ----- START VALUE EVALUATION ------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override private function _get_start_value( prop : String ) : Dynamic
	{
		return _gradient_bevel_larva.filter[ prop ];
	}
}