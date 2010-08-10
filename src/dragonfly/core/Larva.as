package dragonfly.core 
{
	import cocktail.utils.ArrayUtil;

	import flash.utils.getTimer;

	public class Larva
	{
		internal var _initialized : Boolean;
		private var _targets : Array;
		private var _flights : Array;
		private var _larvas : Array;
		private var _eggs : Array;

		internal var _call_timer : int;

		/**
		 * Create a Larva object.
		 * 
		 * @param target	The larva target.
		 * @param use_frames If <code>true</code> 'onEnterFrame' mode used,
		 * otherwise (<code>false</code>) <code>'setInterval'</code> mode is
		 * used.
		 * @param fp If useFrames is <code>false</code>, you can set the refresh
		 * interval for the <code>'setInterval'</code> mode (default=30).
		 */
		public function Larva( target : * )
		{
			_eggs = [];
			_targets = [];
			_flights = [];
			_larvas = [];
			
			_targets.push( target );
		}

		/**
		 * Adds a target into the Larva.
		 * @param Target	The target to be added.
		 * 
		 * @return The added target id.
		 */
		public function add_target(target : * ) : * 
		{
			var larva : Larva;
			
			for each( larva in _larvas )
				larva._targets.push( target );
			
			_targets.push( target );
			
			return target;
		}

		/**
		 * Removes one target from a Larva.
		 * @param target Target to be removed.
		 */
		public function remove_target(target : * ) : void 
		{
			var larva : Larva;
			
			for each( larva in _larvas )
				ArrayUtil.del( larva._targets, target );
			
			ArrayUtil.del( _targets, target );
			
			if ( !this._targets.length ) 
				trace( "WARNING: Your larva has no target!" );
		}

		/**
		 * Removes all targets from a Larva ( except the default target ).
		 */
		public function remove_all_targets() : void 
		{
			var larva : Larva;
			
			for each( larva in _larvas )
				larva._targets = [ targets[ 0 ] ];
			
			_targets = [ targets[ 0 ] ];
		}

		/**
		 * Returns the larva's eggs.
		 * @return The larva's eggs.
		 */
		public function get eggs() : Array 
		{
			return _eggs;
		} 

		/**
		 * Returns the larva's targets.
		 * @return The larva's targets.
		 */
		public function get targets() : Array 
		{
			return _targets;
		}

		/**
		 * Returns the larva's targets.
		 * @return The larva's targets.
		 */
		public function get larvas() : Array 
		{
			return _larvas;
		} 

		/**
		 * Returns the larva's default target.
		 * @return The larva's target.
		 */
		public function get default_target() : * 
		{
			return _targets[ 0 ];
		}

		/**
		 * Gets the thotal time left to larva has until get stopped.
		 * @return The total left time larva has until get stopped.
		 */
		public function get time_left() : Number 
		{
			var time_left : Number;
			var egg : Egg;
			
			time_left = 0;
			for each( egg in _eggs )
				time_left = Math.max( egg.time_left, time_left );
			
			return time_left;
		}

		/**
		 * Holds the running eggs.
		 */
		public function hold() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.hold( );
		}

		/**
		 * Unholds the running eggs.
		 */
		public function unhold() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.unhold( );
		}

		/**
		 * Resets the running eggs.
		 */
		public function reset() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.fries( );
		}

		/**
		 * Returns the larva's status.
		 * 
		 * @return The larva's status.
		 */
		public function get active() : Number 
		{
			var active_eggs : Number;
			var larva : Larva;
			
			active_eggs = 0;
			
			for each( larva in _larvas )
				active_eggs += larva.active;
			
			for each( var egg : Egg in _eggs )
				if( egg.active ) active_eggs++;
			
			return active_eggs;
		}

		protected function _lay(
			egg_class : Class,
			egg_type : String,
			end : *,
			start : *
		) : Egg
		{
			var egg : Egg;
			
			egg = new ( egg_class )( egg_type, this, end, start );
			
			if( ! _flights.length )
				_call_timer = getTimer();
			
			_eggs.push( egg );
			_flights.push( egg );
			
			return egg;
		}

		public function fly(
			duration : Number,
			delay : Number = undefined,
			equation : Function = null,
			equation_args : * = null
		) : Flight
		{
			var flight : Flight;
			var larva : Larva;
			var children_eggs : Array;
			
			flight = new Flight( );
			
			children_eggs = [];
			for each( larva in _larvas )
				children_eggs = children_eggs.concat( larva._flights );
			
			for each( var egg : Egg in _flights.concat( children_eggs ) )
				flight._add_egg( egg )._shoke(
					duration * 1000,
					delay,
					equation,
					equation_args
				);
			
			_flights = [];
			return flight;
		}

		protected function _plug_larva( larva_class : Class ) : Larva 
		{
			var larva : Larva;
			_larvas.push( larva = new ( larva_class )( default_target ) );
			return larva; 
		}

		protected function _unplug_larva( larva : Larva ) : void 
		{
			ArrayUtil.del( _larvas, larva );
		}
		
		public function get initialized() : Boolean
		{
			return _initialized;
		}
	}
}