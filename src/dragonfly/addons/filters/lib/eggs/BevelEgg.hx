package dragonfly.addons.filters.lib.eggs; 
import dragonfly.addons.filters.lib.BevelLarva;
import dragonfly.core.Egg;

/**
 * @author nybras | nybras@codeine.it
 */
class BevelEgg extends Egg 
{
	/* ----- FILTER PROPERTIES (tweenable) ------------------------------ */
	public static inline var DISTANCE : String = "distance";

	public static inline var ANGLE : String = "angle";

	public static inline var HIGHLIGHTCOLOR : String = "highlightColor";

	public static inline var HIGHLIGHTALPHA : String = "highlightAlpha";

	public static inline var SHADOWCOLOR : String = "shadowColor";

	public static inline var SHADOWALPHA : String = "shadowAlpha";

	public static inline var BLURX : String = "blurX";

	public static inline var BLURY : String = "blurY";

	public static inline var STRENGTH : String = "strength";

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override public function init() : Void
	{
		_prop_target = _bevel_larva.filter;
	}

	/* ----- GETTER / CASTER -------------------------------------------- */
		
	/**
	 * TODO: write documentation
	 */
	private var _bevel_larva( _get_bevel_larva, never ) : BevelLarva;
	private function _get_bevel_larva() : BevelLarva
	{
		return BevelLarva( _larva );
	}

	/* ----- RENDERING -------------------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	public function render( prop : String, value : Dynamic ) : Void
	{
		_bevel_larva.filter[ prop ] = value;
		_bevel_larva.close.refresh( );
	}

	/* ----- START VALUE EVALUATION ------------------------------------- */
	
	/**
	 * TODO: write documentation
	 */
	override function _get_start_value( prop : String ) : Dynamic
	{
		return _bevel_larva.filter[ prop ];
	}
}