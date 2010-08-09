package dragonfly  {
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Dragonfly 
	{
		private static var _enabled : Boolean = true;
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
			return Dragonfly._enabled;
		}
		/**
		 * Enable the Dragonfly engine ( transition mode ON )
		 */
		public static function enable() : void 
		{
			Dragonfly._enabled = true;
		}
		/**
		 * Disable the Dragonfly engine ( transition mode OFF )
		 */
		public static function disable() : void 
		{
			Dragonfly._enabled = false;
		}
	}
}