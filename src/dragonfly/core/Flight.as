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

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Flight 
	{
		/* ----- LOOP ------------------------------------------------------- */
		internal var _loop : Boolean;

		internal var _loop_times : Number;

		/* ----- YOYO ------------------------------------------------------- */
		private var _yoyo : Boolean;

		private var _yoyo_back_equation : Function;

		/* ----- VARIABLES -------------------------------------------------- */
		private var _started : Boolean;

		private var _eggs : Array = [];

		private var _eggs_completed : Number = 0;

		/* ----- CALLBACKS -------------------------------------------------- */
		internal var _on_start : Function;

		internal var _on_progress : Function;

		internal var _on_complete : Function;

		internal var _on_start_params : Array = [];

		internal var _on_progress_params : Array = [];

		internal var _on_complete_params : Array = [];

		/* ----- INITIALIZING ----------------------------------------------- */
		internal function _add_egg( egg : Egg ) : Egg
		{
			_eggs.push( egg );
			egg._flight = this;
			egg._on_start = _on_egg_start;
			egg._on_progress = _on_egg_progress;
			egg._on_complete = _on_egg_complete;
			return egg;
		}

		/* ----- HANDLING EGG EVENTS ---------------------------------------- */
		private function _on_egg_start() : void 
		{
			if( !_started )
			{
				_started = true;
				if( _on_start == null ) return;
				_on_start.apply( _on_start.prototype, _on_start_params );
			}
		}

		private function _on_egg_progress() : void 
		{
			if( _on_progress == null  ) return;
			_on_progress.apply( _on_progress.prototype, _on_progress_params );
		}

		private function _on_egg_complete() : void 
		{
			var egg : Egg;
			
			if( ++_eggs_completed < _eggs.length )
				return;
			
			for each( egg in _eggs )
			{
				egg.larva.eggs[ egg ] = null;
				delete egg.larva.eggs[ egg ];
				egg.destroy( );
			}
			
			if( _on_complete != null )
				_on_complete.apply( _on_complete.prototype, _on_complete_params );
		}

		/* ----- AVAILABLE EVENT FOR LISTENING ------------------------------ */
		public function on_start(
			callback : Function,
			params : Array = null
		) : Flight
		{
			_on_start = callback;
			_on_start_params = params;
			return this;
		}

		public function on_progress(
			callback : Function,
			params : Array = null
		) : Flight
		{
			_on_progress = callback;
			_on_progress_params = params;
			return this;
		}

		public function on_complete(
			callback : Function,
			params : Array = null
		) : Flight
		{
			_on_complete = callback;
			_on_complete_params = params;
			return this;
		}

		/* ----- LOOPING FEATURE -------------------------------------------- */
		public function loop( times : Number = 0 ) : void
		{
			_loop = true;
			_loop_times = times;
		}

		public function get is_loop() : Boolean
		{
			return _loop;
		}

		public function get loop_times() : Number
		{
			return _loop_times;
		}

		/* ----- YOYO FEATURE ----------------------------------------------- */
		public function yoyo( back_equation : Function ) : void
		{
			_yoyo = true;
			_yoyo_back_equation = back_equation;
		}

		public function get is_yoyo() : Boolean
		{
			return _loop;
		}

		public function get yoyo_back_equation() : Function
		{
			return _yoyo_back_equation;
		}
	}
}