package dragonfly.addons.filters.lib.eggs; 

import dragonfly.addons.filters.lib.BlurLarva;
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class BlurEgg extends Egg 
{
	/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
	public static inline var X : String = "blurX";

	public static inline var Y : String = "blurY";

	public static inline var QUALITY : String = "quality";

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override public function init() : Void
	{
		_prop_target = _blur_larva.filter;
	}

	/* ----- GETTER / CASTER -------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public var _blur_larva( _get_blur_larva, never ) : BlurLarva;
	private function _get_blur_larva() : BlurLarva
	{
		return BlurLarva( _larva );
	}

	/* ----- RENDERING -------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function render( prop : String, value : Dynamic ) : Void
	{
		_blur_larva.filter[ prop ] = value;
		_blur_larva.close.refresh( );
	}

	/* ----- START VALUE EVALUATION ------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override private function _get_start_value( prop : String ) : Dynamic
	{
		return _blur_larva.filter[ prop ];
	}
}