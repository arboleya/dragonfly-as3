package dragonfly.core 
{
	import cocktail.utils.ArrayUtil;

	import flash.utils.Dictionary;

	
	
	public class Larva
	{
		internal var _initialized : Boolean;
		
		private var _target : *;
		
		protected var _laid : Dictionary;
		protected var _larvas : Array;
		protected var _eggs : Dictionary;
		
		public function Larva( target : * )
		{
			_target = target;
			_larvas = [];
			_eggs = new Dictionary();
			_laid = new Dictionary();
		}
		
		public function get eggs() : Dictionary 
		{
			return _eggs;
		} 

		public function get target() : * 
		{
			return _target;
		}

		public function get larvas() : Array 
		{
			return _larvas;
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

		public function hold() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.hold( );
		}

		public function unhold() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.unhold( );
		}

		public function reset() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.destroy( );
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
			klass : Class,
			prop : String,
			end : *,
			start : * = null,
			type : String = null
		) : void
		{
			var laid : Object;
			var key : String;
			
			key = String( klass );
			
			if( _laid == null )
				_laid = new Dictionary();
			
			if( ! _laid.hasOwnProperty( key ) )
			{
				_laid[ key ] = {
					klass:klass,
					props: [],
					types: [],
					starts: [],
					ends: []
				};
			}
			
			laid = _laid[ key ]; 
			( laid[ "props" ] as Array ).push( prop );
			( laid[ "types" ] as Array ).push( type || Nymph.NUMERIC );
			( laid[ "starts" ] as Array ).push( start );
			( laid[ "ends" ] as Array ).push( end );
		}
		
		public function fly(
			duration : Number,
			delay : Number = undefined,
			equation : Function = null,
			equation_args : * = null,
			flight : Flight = null
		) : Flight
		{
			var egg : Egg;
			var larva : Larva;
			var item : Object;
			
			flight = ( flight || new Flight( ) );
			
			for each( larva in _larvas )
				larva.fly( duration, delay, equation, equation_args, flight );
			
			for each( item in _laid )
			{
				egg = new ( item[ "klass" ] )(
					this,
					item[ "props" ],
					item[ "types" ],
					item[ "ends" ],
					item[ "starts" ] 
				);
				
				flight._add_egg(
					egg._shoke( duration, delay, equation, equation_args )
				);
				
				_eggs[ egg ] = this;
			}
			
			_laid = null;
			return flight;
		}

		protected function _plug_larva( larva_class : Class ) : Larva 
		{
			var larva : Larva;
			_larvas.push( larva = new ( larva_class )( target ) );
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