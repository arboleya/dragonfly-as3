package dragonfly  {
	import dragonfly.core.health.Vitamin;			/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Dragonfly 
	{
		private static var _boost : Number = 0;
		private static var _enabled : Boolean = true;		private static var _time_perfect : Boolean = true;
						/**
		 * Constructor
		 */
		public function Dragonfly()
		{
			throw new Error( "Dragonfly is a static class and should not be instantiated." );
		}
		/**
		 * Check if the Dragonfly engine is ON or OFF
		 * 
		 * @return	TRUE if engine is active, FALSE otherwise
		 */
		public static function get enabled() : Boolean 
		{
			return _enabled;
		}
		/**
		 * Enable the Dragonfly engine ( transition mode ON )
		 */
		public static function enable() : void 
		{
			_enabled = true;
		}
		/**
		 * Disable the Dragonfly engine ( transition mode OFF )
		 */
		public static function disable() : void 
		{
			_enabled = false;
		}		
		public static function set boost( value : int ) : void 
		{			if( ( _boost = value ) )				Vitamin.load( value );						_time_perfect = ( _boost == 0 );
		}		public static function get boost() : int
		{
			return _boost;
		}		
		public static function get time_perfect() : Boolean
		{
			return _time_perfect;
		}	}
}