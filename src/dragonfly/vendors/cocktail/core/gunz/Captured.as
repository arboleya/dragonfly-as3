package cocktail.core.gunz 
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	
	
	/**
	 * Captures any Adobe AS3 Event, and proxy it in a gracefully and painless
	 * way with the Gunz system.
	 * @author nybras | me@nybras.com
	 */
	internal class Captured
	{
		/* VARS */
		
		/** Gun bind to proxy all events. */
		private var _gun : Gun;
		/** Keeps the method that generates any specific gun type. */
		private var _bullet_feed : Function;
		/** Target to be listened. */
		private var _target : IEventDispatcher;
		/** Event type to listen. */
		private var _type : String;

		
		
		/* INITIALIZING */
		
		/**
		 * Creates a new FlashPlayer captured item.
		 * @param gun	Gun to receive the proxied calls.
		 * @param target	Target to be listened.
		 * @param type	Event type to listen in the target.
		 */
		public function Captured(
			gun : Gun,
			target : IEventDispatcher,
			type : String
		)
		{
			_gun = gun;
			_target = target;
			_type = type;
		
			_target.addEventListener( _type, _proxy );
		}

		/* PROXY */
		
		/**
		 * Receives the FlashPlayer event dispatching and proxies it to the
		 * gun receiver.
		 * @event	Any Adobe AS3 Event type.
		 */
		private function _proxy( event : Event ) : void 
		{
			var bullet : Bullet;
		
			if( _bullet_feed == null )
			{
				_gun.shoot( );
				return;
			}
			
			bullet = _bullet_feed( _gun.type );
			bullet.event = event;
		
			_gun.shoot( bullet );
		}

		/* BULLET FEED */
		
		/**
		 * Tells the Capture instance which handler use to retrieve a new bullet.
		 * @param handler	Must be called, informing a method that generates
		 * and returns a new Bullet, of the desired type.
		 */
		public final function feed( handler : Function ) : void
		{
			_bullet_feed = handler;
		}

		/* DESTROY */
		
		/**
		 * Stop listening the captured item and do some gc, reseting all class
		 * variables.
		 */
		internal function _destroy() : void
		{
			_target.removeEventListener( _type, _proxy );
			_target = null;
			_gun = null;
			_bullet_feed = null;
			_type = null;
		}
	}
}