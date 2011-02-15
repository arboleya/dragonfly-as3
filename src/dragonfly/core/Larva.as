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
	import flash.utils.Dictionary;

	public class Larva
	{
		/* ----- VARIABLES -------------------------------------------------- */
		/**
		 * TODO: write docs
		 */
		internal var _initialized : Boolean;

		/**
		 * TODO: write docs
		 */
		private var _target : *;

		/**
		 * TODO: write docs
		 */
		protected var _laid : Object;

		/**
		 * TODO: write docs
		 */
		protected var _larvas : Dictionary;

		/**
		 * TODO: write docs
		 */
		protected var _eggs : Dictionary;

		/* ----- INITIALIZING ----------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		public function Larva( target : * )
		{
			_target = target;
			_larvas = new Dictionary( );
			_eggs = new Dictionary( );
		}

		/* ----- GETTERS ---------------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		public function get eggs() : Dictionary 
		{
			return _eggs;
		}

		/**
		 * TODO: write docs
		 */
		public function get target() : * 
		{
			return _target;
		}

		/**
		 * TODO: write docs
		 */
		public function get larvas() : Dictionary 
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

		/**
		 * TODO: write docs
		 */
		public function get initialized() : Boolean
		{
			return _initialized;
		}

		/* ----- CONTROLS --------------------------------------------------- */
		
		/**
		 * TODO: write docs
		 */
		public function hold() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.hold( );
		}

		/**
		 * TODO: write docs
		 */
		public function unhold() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.unhold( );
		}

		/* ----- GC --------------------------------------------------------- */
		/**
		 * TODO: write docs
		 */
		public function destroy() : void 
		{
			for each( var egg : Egg in _eggs )
				egg.destroy( );
			
			_initialized = undefined;
			_target = undefined;
			_laid = undefined;
			_larvas = undefined;
			_eggs = undefined;
		}

		/**
		 * Returns the larva's activity status.
		 * @return <code>true</code> it the larva is active (tweening something)
		 * or <code>false</false> otherwise.
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

		/* ----- LAYING EGGS and MAKING THEM TO FLY ------------------------- */
		
		/**
		 * TODO: write docs
		 */
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
			var index : int;
			
			key = String( klass );
			
			if( _laid == null )
				_laid = new Object( );
			
			if( !_laid.hasOwnProperty( key ) )
			{
				_laid[ key ] = {
					klass:klass,
					props: [],
					types: [],
					starts: [],
					ends: [],
					indexes: {}
				};
			}
			
			laid = _laid[ key ];
			
			if( ( laid[ "indexes" ] as Object ).hasOwnProperty( prop ) )
				index = laid[ "indexes" ][ prop ];
			else
				index = ( laid[ "props" ] as Array ).length;
			
			laid[ "indexes" ][ prop ] = index;
			laid[ "props" ][ index ] = prop;
			laid[ "types" ][ index ] = type || Nymph.NUMERIC;
			laid[ "starts" ][ index ] = start;
			laid[ "ends" ][ index ] = end;
		}

		/**
		 * TODO: write docs
		 */
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
				Egg( egg = new ( item[ "klass" ] ) ).config(
					this,
					item[ "props" ],
					item[ "types" ],
					item[ "ends" ],
					item[ "starts" ],
					item[ "indexes" ]
				).init( );
				
				_eggs[ egg ] = egg;
				
				egg._shoke( duration, delay, equation, equation_args );
				flight._add_egg( egg );
			}
			
			_laid = null;
			return flight;
		}

		/* ----- KILL IDENTICAL EGGS PREVIOUSLY LAID ------------------------ */
		
		/**
		 * TODO: write docs
		 */
		internal function kill_flying_properties(
			caller : Egg,
			props : Array
		) : void
		{
			var egg : Egg;
			var egg_type : String;
			var caller_type : String;
			
			caller_type = String( caller );
			for each( egg in _eggs )
			{
				egg_type = String( egg );
				if ( egg_type == caller_type && egg != caller )
					if( egg.active )
						egg.remove_properties( props );
			}
		}
		
		public function kill_all(): Larva
		{
			var egg : Egg;
			var larva : Larva;
			
			for each( larva in _larvas )
				larva.kill_all();
			
			for each( egg in _eggs )
				egg.destroy();
			
			_laid = {};
			
			return this;
		}
		
		/* ----- PLUG and UNPLUG of SUB-LARVAS ------------------------------ */
		
		/**
		 * TODO: write docs
		 */
		protected function _plug_larva( larva_class : Class ) : Larva 
		{
			var larva : Larva;
			_larvas[ larva = new ( larva_class )( target ) ] = larva;
			return larva; 
		}

		/**
		 * TODO: write docs
		 */
		protected function _unplug_larva( larva : Larva ) : void 
		{
			_larvas[ larva ] = null;
			delete _larvas[ larva ];
		}
	}
}