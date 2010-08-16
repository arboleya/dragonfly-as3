package dragonfly.core 
{

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Egg
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _active : Boolean;

		protected var _larva : Larva;

		protected var __prop_target : *;

		protected var _indexes : Object;

		protected var _types : Array;

		public var _props : Array;

		protected var _starts : Array;

		public var _ends : Array;

		internal var _nymph : Nymph;

		internal var _flight : Flight;

		/* ----- CALLBACKS -------------------------------------------------- */
		internal var _on_start : Function;

		internal var _on_progress : Function;

		internal var _on_complete : Function;

		/* ----- INITIALIZING ----------------------------------------------- */
		internal function config(
			larva : Larva,
			props : Array,
			types : Array,
			ends : Array,
			starts : Array,
			indexes : Object
		) : Egg
		{
			_nymph = new Nymph( );
			_larva = larva;
			_props = props;
			_types = types;
			_ends = ends;
			_starts = starts;
			_indexes = indexes;
			return this;
		}

		public function init() : void
		{
			throw new Error( "You need to override this method in subclass!" );
		}

		internal function _shoke(
			duration : Number,
			delay : Number,
			equation : Function,
			equation_args : *
		) : Egg
		{
			_nymph._on_start = _nymph_start;
			_nymph._on_progress = _nymph_progress;
			_nymph._on_complete = _nymph_complete;
			_nymph.config( this, __prop_target, _props, _types, _starts, _ends, duration, delay, equation, equation_args );
			return this;
		}

		private function _nymph_start() : void 
		{
			var i : int;
			
			_larva.kill_flying_properties( this, _props );
			
			for( i = 0; i < _ends.length; i++ )
				if( isNaN( _starts[ i ] ) )
					_starts[ i ] = _get_start_value( _props[ i ] );
			
			_active = true;
			_larva._initialized = true;
			
			if( hasOwnProperty( "before_render" ) )
				this[ "before_render" ]( );
			
			_on_start( );
		}

		private function _nymph_progress( prop : String, value : * ) : void 
		{
			if( hasOwnProperty( "render" ) )
				this[ "render" ]( prop, value );
			_on_progress( );
		}

		private function _nymph_complete() : void 
		{
			_active = false;
			
			if( hasOwnProperty( "after_render" ) )
				this[ "after_render" ]( );
			
			_on_complete( );
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

		public function destroy() : void 
		{
			_nymph.destroy( );
			_active = undefined;
			_larva = undefined;
			__prop_target = undefined;
			_types = undefined;
			_props = undefined;
			_starts = undefined;
			_ends = undefined;
			_nymph = undefined;
			_flight = undefined;
			_on_start = undefined;
			_on_progress = undefined;
			_on_complete = undefined;
		}

		public function remove_properties( props : Array ) : void
		{
			var index : int;
			var prop : String;
			
			for each( prop in props )
			{
				index = _indexes[ prop ];
				
				_indexes[ prop ] = null;
				delete _indexes[ prop ];
				
				_props.splice( index, 1 );
				_types.splice( index, 1 );
				_ends.splice( index, 1 );
				_starts.splice( index, 1 );
			}
		}

		public function get time_left() : Number 
		{
			return _nymph.time_left;
		}

		public function get active() : Boolean 
		{
			return _active;
		}

		protected function _get_start_value( prop : String ) : *
		{
			return _larva.target[ prop ];
		}

		protected function get _prop_target() : *
		{
			return __prop_target;
		}

		protected function set _prop_target( value : * ) : void
		{
			__prop_target = value;
		}

		public function get flight() : Flight
		{
			return _flight;
		}

		public function get larva() : Larva
		{
			return _larva;
		}
	}
}