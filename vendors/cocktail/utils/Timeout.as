package cocktail.utils 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	
	
	/**
	 * @author nybras | me@nybras.com
	 */
	public class Timeout 
	{
		private var _timer : Timer;
		private var _handler : Function;
		private var _params : *;

		
		
		public function Timeout(
			handler : Function,
			delay : int,
			params : * = null,
			auto_start : Boolean = true
		)
		{
			_timer = new Timer( delay * 1000, 1 );
			_timer.addEventListener( TimerEvent.TIMER_COMPLETE, _complete );
			
			_handler = handler;
			_params = params;
			
			if( auto_start )
				start( );
		}

		public function start() : void
		{
			_timer.start( );
		}

		public function abort() : void
		{
			if( _timer && _timer.running )
				_timer.stop( );
			
			_destroy( );
		}

		private function _destroy() : void
		{
			if( _timer )
				_timer.removeEventListener( TimerEvent.TIMER_COMPLETE, _complete );
			_timer = null;
			_handler = null;
			_params = null;
		}

		private function _complete(event : TimerEvent) : void
		{
			if( _params == null )
				_handler( );
			else
				_handler.apply( _handler.prototype, [].concat( _params ) );
			
			_destroy( );
		}
	}
}