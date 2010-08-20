package dragonfly.addons.filters.lib.eggs; 

import dragonfly.addons.filters.lib.GlowLarva;
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class GlowEgg extends Egg 
{
	/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
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
		_prop_target = _glow_larva.filter;
	}

	/* ----- GETTER / CASTER -------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	private var _glow_larva( _get_glow_larva, never ) : GlowLarva;
	private function _get_glow_larva() : GlowLarva
	{
		return GlowLarva( _larva );
	}

	/* ----- RENDERING -------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function render( prop : String, value : Dynamic ) : Void
	{
		_glow_larva.filter[ prop ] = value;
		_glow_larva.close.refresh( );
	}

	/* ----- START VALUE EVALUATION ------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override private function _get_start_value( prop : String ) : Dynamic
	{
		return _glow_larva.filter[ prop ];
	}
}