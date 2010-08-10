package dragonfly.core 
{
	import cocktail.utils.Timeout;

	import com.robertpenner.easing.Linear;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	internal class NymphCache
	{
		/* ----- ON ENTER FRAME BROADCASTER --------------------------------- */
		private static const _OEF : Sprite = new Sprite();
		/* ----- TWEEN VARIABLES -------------------------------------------- */
		private var _start : *;
		private var _end : *;
		private var _diff : *;
		private var _duration : Number;
		private var _equation : Function;
		private var _equation_args : Array;
		
		/* ----- CONTROLS VARIABLES ----------------------------------------- */
		private var _target : *;
		private var _prop : String;
		private var _active : Boolean;
		private var _timeout : Timeout;
		private var _inititalized : Boolean;
		
		private var _vitamin : Array;
		private var _vitamin_capsules : int;
		
		
		/* ----- TIMING VARIABLES ------------------------------------------- */
		private var _timer : Number;
		private var _interval : int;
		private var _last_update_timer : Number;
		private var _is_multiple : Boolean;
		
		/* ----- CALLBACKS -------------------------------------------------- */
		internal var _on_start : Function;
		internal var _on_progress : Function;
		internal var _on_complete : Function;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */

		/**
		 * Configures the Nymph object.
		 * 
		 * @param egg
		 * @param start
		 * @param end
		 * @param duration
		 * @param delay
		 * @param equation
		 * @param equation_args
		 * @param fps
		 * @param use_frames
		 */
		public function config(
			target : *,
			prop : *,
			start : *,
			end : *,
			duration : Number, 
			delay : Number,
			equation : Function,
			equation_args : Array,
			call_timer : Number
		) : void
		{
			_target = target;
			_prop = prop;
			_start = start;
			_end = end;
			_diff = ( end - start );
			_duration = Math.max( duration, 1 );
			_equation = equation || Linear.easeNone;
			
			if( equation_args != null )
			{
				if( equation_args is Array )
					_equation_args = equation_args;
				else
					_equation_args = [ equation_args ];
			}
			else
				_equation_args = [];
			
			_interval = 0;
			_timer = ( getTimer() - call_timer );
			_is_multiple = ( start is Array && end is Array );
			
			_vitamin = Vitamin.CUBIC_IN;
			_vitamin_capsules = _vitamin.length;
			
			if( delay )
				_timeout = new Timeout( _init, delay, null, true );
			else
				_init();
		}

		/**
		 * Returns the egg status: TRUE if active, FALSE otherwise.
		 * 
		 * @return The Egg status.
		 */
		public function get active() : Boolean 
		{
			return _active;
		}

		/**
		 * Holds the tween.
		 */
		public function hold() : void 
		{
			_stop_updater( );
		}

		/**
		 * Unholds the tween.
		 */
		public function unhold() : void 
		{
			_start_updater( );
		}

		/**
		 * Stops and Resets the tween.
		 */
		public function destroy() : void 
		{
			_timeout.abort( );
			_timer = 0;
			_stop_updater( );
		}

		/**
		 * The current tween's time left
		 */
		public function get time_left() : Number 
		{
			return Math.max( 0, ( _duration - _timer ) );
		}

		/**
		 * @private
		 * Initializes the module.
		 */
		private function _init() : void 
		{
			_inititalized = true;
			_last_update_timer = getTimer( );
			_start_updater( );
			_on_start();
		}

		/**
		 * Executes the START, UPDATE and COMPLETE events, bypassing the tween
		 * animation.
		 */
		public function kick() : void 
		{
			var end : *;
			var start : *;
			
			start = _start;
			end = _end;
			
			_timer = _duration;
			
			if ( !_inititalized ) 
			{
				_timeout.abort( );
				_on_start();
				_on_progress();
				_on_complete();
			} 
			else
			{
				_stop_updater( );
				_on_progress( _end );
				_on_complete();
			}
		}

		/**
		 * @private
		 * Starts the updater.
		 */
		private function _start_updater() : void 
		{
			_active = true;
			_OEF.addEventListener( Event.ENTER_FRAME, _refresh );
		}

		/**
		 * @private
		 * Stops the updater.
		 */
		private function _stop_updater() : void 
		{
			if( ! _active )
				return;
			
			_active = false;
			_OEF.removeEventListener( Event.ENTER_FRAME, _refresh );
		}

		/**
		 * @private
		 * Updates the Nymph Engine.
		 */
		private function _refresh( event : Event = null ) : void 
		{
			_on_progress( _quantize );
			
			if ( _timer >= _duration ) 
			{
				if( _timeout )
					_timeout.abort();
				
				_stop_updater( );
				_on_complete( );
				return;
			}
			
			_timer += ( _interval = ( getTimer( ) - _last_update_timer ) );
			
			if( ( _duration - _timer ) < _interval )
				_timer = _duration;
			
			_last_update_timer = getTimer( );
		}
		
		private function get _quantize( ) : Number 
		{
			var index : Number;
			var time : Number;
			
			time = Math.min( _timer / _duration, 1 );
			index = Math.floor( time * _vitamin_capsules );
		
			return ( _start + ( _diff * _vitamin[ index ] ) );
		}
	}
}




internal class Vitamin
{
	public static const ELASTIC_OUT : Array = [ 0,0.029,0.047,0.055,0.089,0.125,0.185,0.228,0.281,0.337,0.344,0.401,0.462,0.494,0.546,0.575,0.623,0.673,0.723,0.775,0.797,0.846,0.895,0.959,1.004,1.046,1.080,1.101,1.137,1.166,1.197,1.225,1.238,1.262,1.285,1.304,1.321,1.329,1.342,1.353,1.364,1.369,1.372,1.373,1.372,1.370,1.366,1.360,1.352,1.348,1.339,1.327,1.315,1.302,1.294,1.279,1.264,1.238,1.223,1.205,1.187,1.178,1.159,1.141,1.123,1.104,1.097,1.078,1.061,1.046,1.029,1.021,1.006,0.992,0.971,0.958,0.946,0.934,0.929,0.920,0.910,0.902,0.895,0.892,0.886,0.881,0.877,0.873,0.872,0.870,0.868,0.868,0.868,0.869,0.871,0.872,0.875,0.878,0.882,0.886,0.888,0.893,0.898,0.903,0.909,0.912,0.918,0.924,0.933,0.940,0.946,0.952,0.956,0.963,0.968,0.974,0.980,0.983,0.989,0.994,1.000,1.005,1.007,1.012,1.017,1.023,1.026,1.029,1.032,1.034,1.036,1.039,1.041,1.042,1.043,1.044,1.045,1.046,1.046,1.046,1.046,1.046,1.045,1.044,1.043,1.042,1.041,1.040,1.038,1.036,1.034,1.034,1.031,1.029,1.027,1.025,1.024,1.022,1.019,1.016,1.014,1.012,1.009,1.008,1.006,1.004,1.002,1.000,0.999,0.998,0.996,0.994,0.993,0.992,0.991,0.990,0.988,0.987,0.986,0.985,0.985,0.984,0.984,0.984,0.983,0.983,0.983,0.983,0.983,0.983,0.983,0.984,0.984,0.985,0.985,0.986,0.986,0.987,0.987,0.988,0.989,0.989,0.990,0.990,0.991,0.992,0.993,0.993,0.994,0.995,0.996,0.997,0.997,0.998,0.999,0.999,1.000,1.000,1.001,1.001,1.002,1.002,1.003,1.003,1.003,1.004,1.004,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.005,1.004,1.004,1.004,1.003,1.003,1.003,1.003,1.003,1.002,1.002,1.002,1.002,1.001,1.001,1.001,1.001,1.000,1.000,1.000,0.999,0.999,0.999,0.999,0.999,0.999,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.997,0.997,0.997,0.997,0.997,0.997,0.997,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.998,0.999,0.999,0.999,0.999,0.999,0.999,0.999,0.999,0.999,0.999,0.999,0.999,1.000,1.000,1.000,1.000,1.000,1.000,1.000,1 ]; 
	public static const CUBIC_IN : Array = [ 0,8,6.4,1.406,7.535,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.002,0.002,0.002,0.002,0.002,0.002,0.003,0.003,0.003,0.003,0.003,0.004,0.004,0.004,0.004,0.005,0.005,0.005,0.006,0.006,0.006,0.007,0.007,0.007,0.008,0.008,0.008,0.009,0.009,0.010,0.010,0.010,0.011,0.012,0.012,0.013,0.013,0.014,0.014,0.015,0.015,0.016,0.016,0.017,0.018,0.019,0.019,0.020,0.020,0.021,0.022,0.023,0.024,0.025,0.025,0.026,0.027,0.028,0.029,0.029,0.030,0.031,0.032,0.033,0.034,0.035,0.036,0.038,0.039,0.040,0.041,0.042,0.043,0.044,0.046,0.047,0.048,0.049,0.050,0.052,0.053,0.054,0.055,0.057,0.059,0.060,0.062,0.064,0.064,0.066,0.068,0.070,0.071,0.072,0.074,0.075,0.077,0.079,0.080,0.082,0.084,0.087,0.089,0.091,0.093,0.094,0.096,0.098,0.100,0.102,0.104,0.106,0.108,0.110,0.113,0.114,0.116,0.119,0.122,0.125,0.127,0.130,0.131,0.134,0.136,0.139,0.142,0.143,0.146,0.149,0.152,0.154,0.156,0.159,0.162,0.166,0.169,0.172,0.175,0.177,0.180,0.183,0.187,0.190,0.192,0.195,0.198,0.202,0.205,0.207,0.211,0.214,0.220,0.223,0.227,0.230,0.232,0.236,0.240,0.244,0.248,0.250,0.254,0.258,0.262,0.266,0.268,0.272,0.277,0.283,0.287,0.292,0.297,0.298,0.303,0.308,0.312,0.317,0.319,0.324,0.328,0.333,0.338,0.340,0.345,0.350,0.358,0.363,0.368,0.374,0.376,0.381,0.387,0.392,0.397,0.400,0.405,0.411,0.416,0.422,0.425,0.430,0.436,0.445,0.451,0.457,0.462,0.466,0.472,0.478,0.484,0.490,0.493,0.499,0.506,0.512,0.519,0.522,0.529,0.535,0.545,0.552,0.558,0.565,0.569,0.575,0.582,0.589,0.597,0.600,0.607,0.614,0.622,0.629,0.632,0.640,0.647,0.659,0.666,0.674,0.681,0.686,0.693,0.701,0.710,0.718,0.721,0.729,0.738,0.745,0.754,0.758,0.766,0.774,0.787,0.796,0.804,0.813,0.817,0.826,0.836,0.845,0.853,0.858,0.867,0.876,0.885,0.894,0.899,0.908,0.918,0.932,0.941,0.951,0.962,0.965,0.976,0.986,0.995,1 ];
}