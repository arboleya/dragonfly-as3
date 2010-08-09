package dragonfly.core 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;

	import dragonfly.core.gunz.NymphBullet;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Egg
	{
		internal var _nymph : Nymph;
		public var gunz : Gunz;
		public var gunz_on_start : Gun;
		public var gunz_on_progress : Gun;
		public var gunz_on_complete : Gun;
		protected var _prop : String;
		protected var __prop_target : *;
		protected var _larva : Larva;
		protected var _end : *;
		protected var _start : *;
		public var _active : Boolean;

		
		
		public function Egg(
			prop : String,
			larva : Larva,
			end : *,
			start : * = null
		) 
		{
			_nymph = new Nymph( );
			_nymph.gunz_on_start.add( _tween_start );
			_nymph.gunz_on_progress.add( _tween_progress );
			_nymph.gunz_on_complete.add( _tween_complete );
			
			gunz = new Gunz( this );
			gunz_on_start = new Gun( gunz, this, "start" );
			gunz_on_progress = new Gun( gunz, this, "progress" );
			gunz_on_complete = new Gun( gunz, this, "complete" );
			
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
			_nymph.config(
				__prop_target,
				_prop,
				_start,
				_end,
				duration,
				delay,
				equation,
				equation_args
			);
			return this;
		}

		private function _tween_start( bullet : NymphBullet ) : void 
		{
			_active = true;
			_larva._initialized = true;
			
			if( hasOwnProperty( "before_render" ) )
				this[ "before_render" ]( bullet );
			
			gunz_on_start.shoot( bullet );
		}

		private function _tween_progress( bullet : NymphBullet ) : void 
		{
			if( hasOwnProperty( "render" ) )
				this[ "render" ]( bullet );
			
			gunz_on_progress.shoot( bullet );
		}

		private function _tween_complete( bullet : NymphBullet ) : void 
		{
			_active = false;
			
			if( hasOwnProperty( "after_render" ) )
				this[ "after_render" ]( bullet );
			
			gunz_on_complete.shoot( bullet );
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