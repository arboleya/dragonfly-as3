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
	internal class Nymph
	{
		/* ----- ON ENTER FRAME BROADCASTER --------------------------------- */
		private static const _OEF : Sprite = new Sprite();
		/* ----- TWEEN VARIABLES -------------------------------------------- */
		private var _start : *;
		private var _end : *;
		private var _duration : Number;
		private var _equation : Function;
		private var _equation_args : Array;
		
		/* ----- CONTROLS VARIABLES ----------------------------------------- */
		private var _target : *;
		private var _prop : String;
		private var _active : Boolean;
		private var _timeout : Timeout;
		private var _inititalized : Boolean;
		
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
		public function Nymph() 
		{
		}

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
			_on_progress( _value );
			
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

		/**
		 * @private
		 * Get value with desired easing.
		 * @return The current tween color.
		 */
		private function get _value() : * 
		{
			var params : Array;
			var timer : Number;
			var end : *;
			var start : *; 
			var output: Array; 
			var i : int;
			
			timer = Math.min( _timer, _duration );
			
			if( ! _is_multiple )
			{
				params = [ timer, _start, (_end - _start), _duration ];
				params = params.concat( _equation_args );
				return Number( _equation.apply( this, params ) );
			}
			
			output = [];
			for(; i < ( _start as Array ).length; i++ )
			{
				start = _start[ i ];
				end = _end[ i ];
				params = [ timer, start, ( end -  start ), _duration ];
				params = params.concat( _equation_args );
				
				output.push( _equation.apply( this, params ) );
			}
			
			return output;
		}
	}
}