package dragonfly.core; 

import dragonfly.Dragonfly;
import dragonfly.core.health.Vitamin;

import com.robertpenner.easing.Linear;


/**
 * @author nybras | nybras@codeine.it
 */
class Nymph
{
	/* ----- TYPES ---------------------------------------------------------- */
	/**
	 * TODO: write docs
	 */
	public static inline var NUMERIC : String = "numeric";

	/**
	 * TODO: write docs
	 */
	public static inline var ARRAY : String = "array";

	/**
	 ` TODO: write docs
	 */
	public static inline var HEXADECIMAL : String = "hexadecimal";

	/* ----- ON ENTER FRAME BROADCASTER ------------------------------------- */
	/**
	 * TODO: write docs
	 */
	private static var _OEF : OEF;

	/* ----- TWEEN VARIABLES ------------------------------------------------ */
	/**
	 * TODO: write docs
	 */
	private var _props : Array<String>;

	/**
	 * TODO: write docs
	 */
	private var _types : Array<String>;

	/**
	 * TODO: write docs
	 */
	private var _starts : Array<Dynamic>;

	/**
	 * TODO: write docs
	 */
	private var _ends : Array<Dynamic>;

	/**
	 * TODO: write docs
	 */
	private var _duration : Float;

	/**
	 * TODO: write docs
	 */
	private var _delay : Float;
	
	/**
	 * TODO: write docs
	 */
	private var _klass : Dynamic;
	private var _equation : Dynamic;

	/**
	 * TODO: write docs
	 */
	private var _equation_args : Array<Dynamic>;

	/* ----- CONTROLS VARIABLES --------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	private var _target : Dynamic;

	/**
	 * TODO: write docs
	 */
	private var _active : Bool;

	/**
	 * TODO: write docs
	 */
	private var _initialized : Bool;

	/* ----- TIMING VARIABLES ----------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	private var _time : Float;

	/**
	 * TODO: write docs
	 */
	private var _interval : Float;

	/**
	 * TODO: write docs
	 */
	private var _last_update_timer : Float;

	/* ----- UTILS ---------------------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	private var _egg : Egg;

	/**
	 * TODO: write docs
	 */
	private var _loop : Float;

	/* ----- CACHE ---------------------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	private var _vitamin : Array<Float>;

	/**
	 * TODO: write docs
	 */
	private var _vitamin_capsules : Int;

	/* ----- CALLBACKS ------------------------------------------------------ */
	
	/**
	 * TODO: write docs
	 */
	public var on_start : Dynamic;

	/**
	 * TODO: write docs
	 */
	public var on_progress : Dynamic;

	/**
	 * TODO: write docs
	 */
	public var on_complete : Dynamic;

	/* ----- INITIALIZING --------------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	public function new() 
	{
		if( _OEF == null )
			_OEF = new OEF( );
	}

	/**
	 * TODO: write docs
	 */
	public function config(
		egg : Egg,
		target : Dynamic,
		props : Array<String>,
		types : Array<String>,
		starts : Array<Dynamic>,
		ends : Array<Dynamic>,
		duration : Float, 
		delay : Float,
		klass : Dynamic,
		equation : Dynamic,
		equation_args : Array<Dynamic>
	) : Void
	{
		_egg = egg;
		_target = target;
		
		_props = props;
		_types = types;
		_starts = starts;
		_ends = ends;
		
		_duration = ( duration * 1000 );
		_delay = ( delay * 1000 );
		
		_klass = klass;
		_equation = equation;
		_loop = 0;
		
		if( equation_args != null )
		{
			if( Std.is( equation_args, Array ) )
				_equation_args = equation_args;
			else
				_equation_args = [ equation_args ];
		}
		else
			_equation_args = [];
		
		if( Dragonfly.boost > 0 )
		{
			_vitamin = Vitamin.drop( _equation );
			_vitamin_capsules = _vitamin.length - 1;
		}
		
		_interval = 0;
		_time = 0;
		
		_init( );
	}

	/**
	 * TODO: write docs
	 */
	private function _init() : Void 
	{
		_last_update_timer = flash.Lib.getTimer( );
		_start_updater( );
		_active = true;
	}

	/* ----- KICK / DESTROY ------------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	public function kick() : Void 
	{
		var i : Int;
		
		_time = _duration;
		
		if ( !_initialized ) 
		{
			on_start( );
			i = 0;
			while( i++ < _props.length )
				on_progress( _props[ i ], _ends[ i ] );
			
			on_complete( );
		} 
		else
		{
			_stop_updater( );
			
			i = 0;
			while( i++ < _props.length )
				on_progress( _props[ i ], _ends[ i ] );
				 
			on_complete( );
		}
	}

	/**
	 * TODO: write docs
	 */
	public function destroy() : Void 
	{
		_stop_updater( );
		
		_props = null;
		_types = null;
		_starts = null;
		_ends = null;
		_duration = 0;
		_delay = 0;
		_equation = null;
		_equation_args = null;
		
		_target = null;
		_active = false;
		_initialized = false;
		
		_time = 0;
		_interval = 0;
		_last_update_timer = 0;
		
		_egg = null;
		_loop = 0;
		
		_vitamin = null;
		_vitamin_capsules = 0;
		
		on_start = null;
		on_progress = null;
		on_complete = null;
	}

	/* ----- ON ENTER FRAME MANAGEMENT -------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	private function _start_updater() : Void 
	{
		_active = true;
		_OEF.add( _refresh );
	}

	/**
	 * TODO: write docs
	 */
	private function _stop_updater() : Void 
	{
		if( !_active )
			return;
		
		_active = false;
		_OEF.rm( _refresh );
	}

	/* ----- REFRESHING TWEEN ----------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	private function _refresh() : Void 
	{
		var flag : Bool;
		var factor : Float;
		var i : Int;
		
		if( !Dragonfly.enabled )
		{
			kick( );
			return;
		}
		
		if( _delay > 0 )
		{
			_delay -= ( flash.Lib.getTimer( ) - _last_update_timer );
			_last_update_timer = flash.Lib.getTimer( );
			return; 
		}
		else if( !_initialized )
		{
			on_start( );
			_initialized = true;
		}
		
		if( Dragonfly.boost > 0 )
			factor = _quantize( );
		else
			factor = _calculate( );
		
		i = 0;
		while( i < _props.length )
			on_progress( _props[ i ], _value( i++, factor ) );
		
		if ( _time >= _duration )
		{
			i = 0;
			while( i < _props.length )
				on_progress( _props[ i ], _ends[ i++ ] );
			
			if( _egg.flight.is_loop )
			{
				flag = ( _egg.flight.loop_times == 0 );
				flag = ( flag || ( _loop++ <= _egg.flight.loop_times ) );
				 
				if( flag )
				{
					_time = 0;
					return;
				}
			}
			
			_stop_updater( );
			on_complete( );
			return;
		}
		
		_time += ( _interval = ( flash.Lib.getTimer( ) - _last_update_timer ) );
		
		if( Dragonfly.time_perfect && ( _duration - _time ) < _interval )
			_time = _duration;
		
		_last_update_timer = flash.Lib.getTimer( );
	}

	/* ----- COMPUTES THE TWEEN CURRENT VALUE ------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	private function _value( index : Int, factor : Float ) : Dynamic
	{
		var i : Int;
		var end : Dynamic;
		var start : Dynamic;
		var type : String;
		var output : Array<Dynamic>;
		
		type = _types[ index ];
		start = _starts[ index ];
		end = _ends[ index ];
		
		if( type == HEXADECIMAL )
		{
			start = hex2rgb( start );
			end = hex2rgb( end );
			
			output = [];
			i = 0;
			while( i < 3 )
				output.push( _compute( start[ i ], end[ i++ ], factor ) );
			
			return rgb2hex( cast output );
		}
		
		if( type == ARRAY )
		{
			output = [];
			i = 0;
			while( i < Reflect.field( start, "length" ) )
				output.push( _compute( start[ i ], end[ i++ ], factor ) );
			
			return output;
		}
		
		// NUMERIC
		return _compute( start, end, factor );
	}

	/**
	 * TODO: write docs
	 */
	private function _compute(
		start : Float,
		end : Float,
		factor : Float
	) : Dynamic
	{
		return ( start + ( factor * ( end - start ) ) );
	}

	/* ----- CALCULATING & QUANTIZING --------------------------------------- */
	
	/* Computes the tween by proccessing the equation math. */
	
	/**
	 * TODO: write docs
	 */
	private function _calculate() : Dynamic
	{
		var params : Array<Dynamic>;
		
		params = [ _time, 0, 1, _duration ];
		params = params.concat( _equation_args );
		
		return Reflect.callMethod( null, _equation, params );
	}
	
	/**
	 * TODO: write docs
	 */
	/* Computes the tween by quantizing the cached equation. */
	private function _quantize() : Dynamic 
	{
		var index : Float;
		index = ( ( _time / _duration ) * _vitamin_capsules );
		return _vitamin[ Math.floor( index ) ];
	}

	/* ----- UTILS ---------------------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	public var active(get_active,set_active): Bool;
	public function get_active() : Bool
	{
		return _active;
	}
	
	public function set_active( value : Bool ) : Bool
	{
		return ( _active = value );
	}

	/**
	 * TODO: write docs
	 */
	public function time_left(get_time_left,never) : Void; 
	public function get_time_left() : Float 
	{
		return cast Math.max( 0, ( _duration - _time ) );
	}
	
	/* ----- HOLD / UNHOLD -------------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	public function hold() : Void 
	{
		_stop_updater( );
	}

	/**
	 * TODO: write docs
	 */
	public function unhold() : Void 
	{
		_start_updater( );
	}

	/* ----- HEXADECIMAL CONVERSIONS ---------------------------------------- */
	/**
	 * Conversion functions (for hexa/color tweening).
	 * @param rgb Array with the RGB (3 indexes: 0=R, 1=G, 2=B) to be
	 * converted.
	 * @return RGB Into HEXADECIMAL.
	 */
	public static function rgb2hex( rgb : Array<Int> ) : Int 
	{
		return ( rgb[0] << 16 | rgb[1] << 8 | rgb[2] );
	}

	/**
	 * Conversion functions (for hexa/color tweening).
	 * @param hex The hexadecimal to be converted.
	 * @return HEXADECIMAL INTRO RGB (array with 3 indexes: 0=R, 1=G, 2=B).
	 */
	public static function hex2rgb(hex : Int) : Array <Dynamic>
	{
		return [
			hex >> 16,
			hex >> 8 & 255,
			hex & 255
		];
	}
}

import flash.display.Sprite;
import flash.events.Event;
import flash.events.Event;

private class OEF
{
	/**
	 * TODO: write docs
	 */
	private var _display : Sprite;

	/**
	 * TODO: write docs
	 */
	private var _listeners : Array<Dynamic>;

	/**
	 * TODO: write docs
	 */
	public function new() 
	{
		_listeners = new Array( );
		_display = new Sprite( );
		_display.addEventListener( Event.ENTER_FRAME, _dispatch );
	}

	/**
	 * TODO: write docs
	 */
	public function _dispatch( event : Event ) : Void
	{
		var listener : Dynamic;
		for( listener in _listeners )
			listener( );
	}

	/**
	 * TODO: write docs
	 */
	public function add( callback_action : Dynamic ) : Void
	{
		 _listeners.push( callback_action );
	}

	/**
	 * TODO: write docs
	 */
	public function rm( callback_action : Dynamic ) : Void
	{
		var i : Int;
		for( i in 0..._listeners.length )
			if( _listeners[ i ] == callback_action )
				_listeners.splice( i, 1 );
	}
}