package dragonfly ;  

import dragonfly.core.health.Vitamin;

/**
 * @author nybras | nybras@codeine.it
 */
class Dragonfly 
{
	/* ----- VARIABLES -------------------------------------------------- */
	/** 
	 * Specify whether dragonfly will use cached or not, if boost=0 no cache
	 * is used, otherwise boost > 0, it means the number of cached steps to
	 * use in all tweens.
	 */
	private static var _boost : Int;
	
	/**
	 * Specify whether dragonfly is enable or not. When disable, all start,
	 * progress and complete events fires as usual, but without tween. 
	 */
	private static var _enabled : Bool = true;
	
	/**
	 * Specify whether dragonfly should force time-perfect execution for
	 * tween, enforcing that the end of the tween matches its duration
	 * as more precise as possible.
	 */
	private static var _time_perfect : Bool = true;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * Dragonfly is a static class and should'n be instantiated!
	 */
	public function new()
	{
		var msg : String;
		msg = "Dragonfly is a static class and should not be instantiated.";
		trace( msg );
	}

	/* ----- GETTERS / SETTERS ------------------------------------------ */
	
	/* ENABLE / DISABLE */
	
	/**
	 * Check if the Dragonfly engine is ON or OFF.
	 * @return	<code>true</code> if engine is active, <code>false</code>
	 * otherwise. When it's disabled, all start, progress and complete
	 * events fires as usual, but without tween. It's pretty usefull for
	 * debugging purposes, whe the motion is ok and you just want to debug
	 * the rest.
	 */
	public static var enabled(get_enabled,never) : Bool;
	private static function get_enabled() : Bool 
	{
		return _enabled;
	}

	/**
	 * Enables the Dragonfly engine (transition mode ON).
	 */
	public static function enable() : Void 
	{
		_enabled = true;
	}

	/**
	 * Disables the Dragonfly engine (transition mode OFF).
	 */
	public static function disable() : Void 
	{
		_enabled = false;
	}

	/* BOOST */
	
	/**
	 * Boost the Dragonfly by using cached equations and quantization
	 * instead of computing the equation every tween Interaction.
	 * @param value	Number of steps to cache / use, keep in mind that the
	 * number of steps should be something around your tween avarage
	 * duration divided by something about 50ms.
	 * 
	 * By default, it disables the Dragonfly.time_perfect feature for better 
	 * results.
	 */
	public static var boost(get_boost,set_boost) : Int;
	
	public static function get_boost() : Int
	{
		return _boost;
	}
	
	public static function set_boost( value : Int ) : Int 
	{
		if( ( _boost = value ) > 0 )
			Vitamin.load( value );
		
		_time_perfect = ( _boost == 0 );
		
		return value;
	}
	
	/* TIMING */
	
	/**
	 * Enables / disables the Dragonfly "time-perfect" execution. It enforces
	 * that the end of the tween matches its duration  as more precise
	 * as possible.
	 */
	public static var time_perfect(get_time_perfect,set_time_perfect) : Bool;
	
	public static function get_time_perfect() : Bool
	{
		return _time_perfect;
	}
	
	public static function set_time_perfect( value : Bool ) : Bool
	{
		return _time_perfect = value;
	}
}