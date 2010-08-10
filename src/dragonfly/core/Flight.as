package dragonfly.core 
{

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Flight 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _started : Boolean;
		private var _eggs_num : Number = 0;
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
			_eggs_num++;
			egg._on_start = __on_start;
			egg._on_progress = __on_progress;
			egg._on_complete = __on_complete;
			return egg;
		}

		private function __on_start() : void 
		{
			if( ! _started )
			{
				_started = true;
				if( _on_start == null ) return;
				_on_start.apply( _on_start.prototype, _on_start_params  );
			}
		}

		private function __on_progress() : void 
		{
			if( _on_progress == null  ) return;
			_on_progress.apply( _on_progress.prototype, _on_progress_params  );
		}

		private function __on_complete() : void 
		{
			if( ++_eggs_completed >= _eggs_num )
			{
				if( _on_complete == null ) return;
				_on_complete.apply( _on_complete.prototype, _on_complete_params  );
			}
		}
		
		public function start(
			callback : Function,
			params : Array = null
		) : Flight
		{
			_on_start = callback;
			_on_start_params = params;
			return this;
		}
		
		public function progress(
			callback : Function,
			params : Array = null
		) : Flight
		{
			_on_progress = callback;
			_on_progress_params = params;
			return this;
		}
		
		public function complete(
			callback : Function,
			params : Array = null
		) : Flight
		{
			_on_complete = callback;
			_on_complete_params = params;
			return this;
		}
	}
}