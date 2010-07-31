package dragonfly.core 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;
	import cocktail.utils.Timeout;

	import dragonfly.Dragonfly;
	import dragonfly.core.gunz.NymphBullet;

	import com.robertpenner.easing.Linear;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.clearInterval;
	import flash.utils.getTimer;
	import flash.utils.setInterval;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Nymph
	{
		/* ----- TWEEN VARIABLES -------------------------------------------- */
		private var _start : *;
		private var _end : *;
		private var _duration : Number;
		private var _equation : Function;
		private var _equation_args : Array;
		private var _fps : Number;
		private var _use_frames : Boolean;
		
		/* ----- CONTROLS VARIABLES ----------------------------------------- */
		private var _egg : Egg;
		private var _target : *;
		private var _prop : String;
		private var _active : Boolean;
		private var _timeout : Timeout;
		private var _inititalized : Boolean;
		
		/* ----- TIMING VARIABLES ------------------------------------------- */
		private var _timer : Number;
		private var _updating : Number;
		private var _last_update_timer : Number;
		private var _is_multiple : Boolean;
		
		/* ----- GUNZ ------------------------------------------------------- */
		public var gunz : Gunz;
		public var gunz_on_start : Gun;
		public var gunz_on_progress : Gun;
		public var gunz_on_complete : Gun;
		
		private static var _oef_broadcaster : MovieClip = new MovieClip( );

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function Nymph() 
		{
			gunz = new Gunz( this );
			gunz_on_start = new Gun( gunz, this, "start" );
			gunz_on_progress = new Gun( gunz, this, "progress" );
			gunz_on_complete = new Gun( gunz, this, "complete" );
			
			_timer = 0;
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
			egg : Egg,
			target : *,
			prop : *,
			start : *,
			end : *,
			duration : Number, 
			delay : Number,
			equation : Function,
			equation_args : Array,
			fps : Number,
			use_frames : Boolean
		) : void
		{
			_egg = egg;
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
			
			_fps = (isNaN( fps ) ? Dragonfly.default_fps : fps);
			_use_frames = (use_frames || Dragonfly.use_frames);
			_is_multiple = ( start is Array && end is Array );
			
			_timeout = new Timeout( _init, Math.max( delay, 1 ), null, true );
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
			
			gunz_on_start.shoot( new NymphBullet( _target, _prop, _start ) );
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
				gunz_on_start.shoot( new NymphBullet( _target, _prop, start ) );
			} 
			else 
			{
				_stop_updater( );
				gunz_on_progress.shoot( new NymphBullet( _target, _prop, end ) );
				gunz_on_start.shoot( new NymphBullet( _target, _prop, end ) );
			}
		}

		/**
		 * @private
		 * Starts the updater.
		 */
		private function _start_updater() : void 
		{
			_active = true;
			
			if (_use_frames) 
				_oef_broadcaster.addEventListener( Event.ENTER_FRAME, _refresh );
			else 
				_updating = setInterval( _refresh, _fps );
		}

		/**
		 * @private
		 * Stops the updater.
		 */
		private function _stop_updater() : void 
		{
			_active = false;
			
			if ( _use_frames ) 
				_oef_broadcaster.removeEventListener( Event.ENTER_FRAME, _refresh );
			else
				clearInterval( _updating );
		}

		/**
		 * @private
		 * Updates the Nymph Engine.
		 */
		private function _refresh() : void 
		{
			var bullet : NymphBullet;
			
			bullet = new NymphBullet( _target, _prop, _value );
			gunz_on_progress.shoot( bullet );
			
			if ( _timer >= _duration ) 
			{
				_stop_updater( );
				gunz_on_complete.shoot( bullet );
			} 
			else if( _use_frames )
				_timer++;
			else
				_timer += ( getTimer( ) - _last_update_timer );
			
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