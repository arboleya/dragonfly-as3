/* -----------------------------------------------------------------------------
Dragonfly - ActionScript Animation Suite. Copyright (C) 2010 Codeine.
--------------------------------------------------------------------------------
   
This library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.
		
This library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this library; if not, write to the Free Software Foundation,
Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

===================
Codeine
http://codeine.it
contact@codeine.it
===================

----------------------------------------------------------------------------- */

package dragonfly.core 
{
	import dragonfly.Dragonfly;
	import dragonfly.core.health.Vitamin;

	import com.robertpenner.easing.Linear;

	import flash.utils.getTimer;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Nymph
	{
		/* ----- TYPES ------------------------------------------------------ */
		/**
		 * TODO: write docs
		 */
		public static const NUMERIC : String = "numeric";

		/**
		 * TODO: write docs
		 */
		public static const ARRAY : String = "array";

		/**
		 * TODO: write docs
		 */
		public static const HEXADECIMAL : String = "hexadecimal";

		/* ----- ON ENTER FRAME BROADCASTER --------------------------------- */
		/**
		 * TODO: write docs
		 */
		private static var _OEF : OEF;

		/* ----- TWEEN VARIABLES -------------------------------------------- */
		/**
		 * TODO: write docs
		 */
		protected var _props : Array;

		/**
		 * TODO: write docs
		 */
		protected var _types : Array;

		/**
		 * TODO: write docs
		 */
		protected var _starts : Array;

		/**
		 * TODO: write docs
		 */
		protected var _ends : Array;

		/**
		 * TODO: write docs
		 */
		protected var _duration : Number;

		/**
		 * TODO: write docs
		 */
		protected var _delay : Number;

		/**
		 * TODO: write docs
		 */
		protected var _is_color : Array;

		/**
		 * TODO: write docs
		 */
		protected var _equation : Function;

		/**
		 * TODO: write docs
		 */
		protected var _equation_args : Array;

		/* ----- CONTROLS VARIABLES ----------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		protected var _target : *;

		/**
		 * TODO: write docs
		 */
		protected var _active : Boolean;

		/**
		 * TODO: write docs
		 */
		protected var _inititalized : Boolean;

		/* ----- TIMING VARIABLES ------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		protected var _time : Number;

		/**
		 * TODO: write docs
		 */
		protected var _interval : int;

		/**
		 * TODO: write docs
		 */
		protected var _last_update_timer : Number;

		/* ----- UTILS ------------------------------------------------------ */
		
		/**
		 * TODO: write docs
		 */
		protected var _egg : Egg;

		/**
		 * TODO: write docs
		 */
		protected var _loop : Number;

		/* ----- CACHE ------------------------------------------------------ */
		
		/**
		 * TODO: write docs
		 */
		protected var _vitamin : Array;

		/**
		 * TODO: write docs
		 */
		protected var _vitamin_capsules : int;

		/* ----- CALLBACKS -------------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		public var _on_start : Function;

		/**
		 * TODO: write docs
		 */
		public var _on_progress : Function;

		/**
		 * TODO: write docs
		 */
		public var _on_complete : Function;

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		public function Nymph() 
		{
			if( _OEF == null )
				_OEF = new OEF( );
		}

		/**
		 * TODO: write docs
		 */
		public function config(
			egg : Egg,
			target : *,
			props : Array,
			types : Array,
			starts : Array,
			ends : Array,
			duration : Number, 
			delay : Number,
			equation : Function,
			equation_args : Array
		) : void
		{
			_egg = egg;
			_target = target;
			
			_props = props;
			_types = types;
			_starts = starts;
			_ends = ends;
			
			_duration = ( duration * 1000 );
			_delay = ( delay * 1000 );
			_equation = equation || Linear.easeNone;
			
			_loop = 0;
			
			if( equation_args != null )
			{
				if( equation_args is Array )
					_equation_args = equation_args;
				else
					_equation_args = [ equation_args ];
			}
			else
				_equation_args = [];
			
			if( Dragonfly.boost )
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
		private function _init() : void 
		{
			_last_update_timer = getTimer( );
			_start_updater( );
			_active = true;
		}
		
		
		/* ----- REMOVING PROPERTIES ON THE FLY ----------------------------- */
		
		internal function _remove_property_by_index( index : int ) : void
		{
			_props.splice( index, 1 );
			_types.splice( index, 1 );
			_ends.splice( index, 1 );
			_starts.splice( index, 1 );
		}
		
		
		/* ----- KICK / DESTROY --------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		public function kick() : void 
		{
			var i : int;
			
			_time = _duration;
			
			if ( !_inititalized ) 
			{
				_on_start( );
				while( i++ < _props.length )
					_on_progress( _props[ i ], _ends[ i ] );
				_on_complete( );
			} 
			else
			{
				_stop_updater( );
				
				while( i++ < _props.length )
					_on_progress( _props[ i ], _ends[ i ] );
					 
				_on_complete( );
			}
		}

		/**
		 * TODO: write docs
		 */
		public function destroy() : void 
		{
			_stop_updater( );
			
			_props = undefined;
			_types = undefined;
			_starts = undefined;
			_ends = undefined;
			_duration = undefined;
			_delay = undefined;
			_is_color = undefined;
			_equation = undefined;
			_equation_args = undefined;
			
			_target = undefined;
			_active = undefined;
			_inititalized = undefined;
			
			_time = undefined;
			_interval = undefined;
			_last_update_timer = undefined;
			
			_egg = undefined;
			_loop = undefined;
			
			_vitamin = undefined;
			_vitamin_capsules = undefined;
			
			_on_start = undefined;
			_on_progress = undefined;
			_on_complete = undefined;
		}

		/* ----- ON ENTER FRAME MANAGEMENT ---------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		private function _start_updater() : void 
		{
			_active = true;
			_OEF.add( _refresh );
		}

		/**
		 * TODO: write docs
		 */
		private function _stop_updater() : void 
		{
			_active = false;
			_OEF.rm( _refresh );
		}

		/* ----- REFRESHING TWEEN ------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		private function _refresh() : void 
		{
			var flag : Boolean;
			var factor : Number;
			var i : int;
			
			if( !Dragonfly.enabled )
			{
				kick( );
				return;
			}
			
			if( _delay > 0 )
			{
				_delay -= ( getTimer( ) - _last_update_timer );
				_last_update_timer = getTimer( );
				return; 
			}
			else if( !_inititalized )
			{
				_on_start( );
				_inititalized = true;
			}
			
			if( Dragonfly.boost )
				factor = _quantize( );
			else
				factor = _calculate( );
			
			
			while( i < _props.length )
				_on_progress( _props[ i ], _value( i++, factor ) );
			
			if ( _time >= _duration )
			{
				i = 0;
				while( i < _props.length )
					_on_progress( _props[ i ], _ends[ i++ ] );
				
				if( _egg.flight.is_loop )
				{
					flag = ( _egg.flight.loop_times == 0 );
					flag ||= _loop++ <= _egg.flight.loop_times;
					 
					if( flag )
					{
						_time = 0;
						return;
					}
				}
				
				_stop_updater( );
				_on_complete( );
				return;
			}
			
			_time += ( _interval = ( getTimer( ) - _last_update_timer ) );
			
			if( Dragonfly.time_perfect && ( _duration - _time ) < _interval )
				_time = _duration;
			
			_last_update_timer = getTimer( );
		}

		/* ----- COMPUTES THE TWEEN CURRENT VALUE --------------------------- */
		
		/**
		 * TODO: write docs
		 */
		protected function _value( index : int, factor : Number ) : * 
		{
			var i : int;
			var end : *;
			var start : *;
			var type : String;
			var output : Array;
			
			type = _types[ index ];
			start = _starts[ index ];
			end = _ends[ index ];
			
			if( type == HEXADECIMAL )
			{
				start = hex2rgb( start );
				end = hex2rgb( end );
				
				output = [];
				while( i < 3 )
					output.push( _compute( start[ i ], end[ i++ ], factor ) );
				
				return rgb2hex( output );
			}
			
			if( type == ARRAY )
			{
				output = [];
				while( i < start[ "length" ] )
					output.push( _compute( start[ i ], end[ i++ ], factor ) );
				
				return output;
			}
			
			// NUMERIC
			return _compute( start, end, factor );
		}

		/**
		 * TODO: write docs
		 */
		protected function _compute(
			start : Number,
			end : Number,
			factor : Number
		) : *
		{
			return ( start + ( factor * ( end - start ) ) );
		}

		/* ----- CALCULATING & QUANTIZING ----------------------------------- */
		
		/* Computes the tween by proccessing the equation math. */
		
		/**
		 * TODO: write docs
		 */
		protected function _calculate() : *
		{
			var params : Array;
			
			params = [ _time, 0, 1, _duration ];
			params = params.concat( _equation_args );
			
			return Number( _equation.apply( this, params ) );
		}

		/**
		 * TODO: write docs
		 */
		/* Computes the tween by quantizing the cached equation. */
		protected function _quantize() : * 
		{
			var index : Number;
			index = ( ( _time / _duration ) * _vitamin_capsules );
			return _vitamin[ Math.floor( index ) ];
		}

		/* ----- UTILS ------------------------------------------------------ */
		
		/**
		 * TODO: write docs
		 */
		public function get active() : Boolean 
		{
			return _active;
		}

		/**
		 * TODO: write docs
		 */
		public function get time_left() : Number 
		{
			return Math.max( 0, ( _duration - _time ) );
		}

		/* ----- HOLD / UNHOLD ---------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		public function hold() : void 
		{
			_stop_updater( );
		}

		/**
		 * TODO: write docs
		 */
		public function unhold() : void 
		{
			_start_updater( );
		}

		/* ----- HEXADECIMAL CONVERSIONS ------------------------------------ */
		/**
		 * Conversion functions (for hexa/color tweening).
		 * @param rgb Array with the RGB (3 indexes: 0=R, 1=G, 2=B) to be
		 * converted.
		 * @return RGB into HEXADECIMAL.
		 */
		public static function rgb2hex(rgb : Array) : Number 
		{
			return (rgb[0] << 16 | rgb[1] << 8 | rgb[2]);
		}

		/**
		 * Conversion functions (for hexa/color tweening).
		 * @param hex The hexadecimal to be converted.
		 * @return HEXADECIMAL INTRO RGB (array with 3 indexes: 0=R, 1=G, 2=B).
		 */
		public static function hex2rgb(hex : Number) : Array 
		{
			return new Array( (hex >> 16), (hex >> 8 & 0xff), (hex & 0xff) );
		}
	}
}
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;

internal class OEF
{
	/**
	 * TODO: write docs
	 */
	private var _display : Sprite;

	/**
	 * TODO: write docs
	 */
	private var _listeners : Dictionary;

	/**
	 * TODO: write docs
	 */
	public function OEF() 
	{
		_listeners = new Dictionary( );
		_display = new Sprite( );
		_display.addEventListener( Event.ENTER_FRAME, _dispatch );
	}

	/**
	 * TODO: write docs
	 */
	public function _dispatch( event : Event ) : void
	{
		var listener : *;
		for( listener in _listeners )
			listener( );
	}

	/**
	 * TODO: write docs
	 */
	public function add( callback : Function ) : void
	{
		_listeners[ callback ] = this;
	}

	/**
	 * TODO: write docs
	 */
	public function rm( callback : Function ) : void
	{
		_listeners[ callback ] = null;
		delete _listeners[ callback ];
	}
}