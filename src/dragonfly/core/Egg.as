package dragonfly.core 
{

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Egg
	{
		internal var _nymph : Nymph;
//		internal var _nymph : NymphCache;
		
		/* ----- VARIABLE --------------------------------------------------- */
		protected var _prop : String;
		protected var __prop_target : *;
		protected var _larva : Larva;
		protected var _end : *;
		protected var _start : *;
		public var _active : Boolean;

		/* ----- CALLBACKS -------------------------------------------------- */
		internal var _on_start : Function;
		internal var _on_progress : Function;
		internal var _on_complete : Function;
		
		public function Egg(
			prop : String,
			larva : Larva,
			end : *,
			start : * = null
		) 
		{
			_nymph = new Nymph( );
//			_nymph = new NymphCache( );
			_prop = prop;
			_larva = larva;
			_end = end;
			_start = start || _get_start_value();
		}

		internal function _shoke(
			duration : Number,
			delay : Number,
			equation : Function,
			equation_args : *
		) : Egg
		{
			_nymph._on_start = _tween_start;
			_nymph._on_progress = _tween_progress;
			_nymph._on_complete = _tween_complete;
			_nymph.config(
				__prop_target,
				_prop,
				_start,
				_end,
				duration,
				delay,
				equation,
				equation_args,
				_larva._call_timer
			);
			return this;
		}

		private function _tween_start() : void 
		{
			_active = true;
			_larva._initialized = true;
			
			if( hasOwnProperty( "before_render" ) )
				this[ "before_render" ]();
			
//			trace( "Egg.onStart" );
			_on_start();
		}
		
		private function _tween_progress( value : * ) : void 
		{
			if( hasOwnProperty( "render" ) )
				this[ "render" ]( value );
			
//			trace( "Egg.onProgress" );
			_on_progress();
		}

		private function _tween_complete() : void 
		{
			_active = false;
			
			if( hasOwnProperty( "after_render" ) )
				this[ "after_render" ]();
			
//			trace( "Egg.onComplete" );
			_on_complete();
		}
		
		public function hold() : Egg 
		{
			_nymph.hold( );
			return this;
		}

		public function unhold() : Egg 
		{
			_nymph.unhold( );
			return this;
		}

		public function fries() : Egg 
		{
			_nymph.destroy( );
			return this;
		}

		public function get targets() : Array
		{
			return _larva.targets;
		}

		public function get time_left() : Number 
		{
			return _nymph.time_left;
		}

		public function get active() : Boolean 
		{
			return _active;
		}
		
		protected function _get_start_value() : *
		{
			return _larva.default_target[ _prop ];
		}
		
		protected function get _prop_target() : *
		{
			return __prop_target;
		}
		
		protected function set _prop_target( value : * ) : void
		{
			__prop_target = value;
		}
	}
}