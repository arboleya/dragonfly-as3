package dragonfly  {

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Dragonfly 
	{
		private static var _default_fps : Number = 30;
		private static var _enabled : Boolean = true;
		private static var _use_frames : Boolean = false;

		
		
		/**
		 * Constructor
		 */
		public function Dragonfly()
		{
			throw new Error( "Dragonfly is a static class and should not be instantiated." );
		}

		/**
		 * Gets the default fps
		 * @param	fps	The default engine FPS
		 */
		public static function set default_fps( fps : Number ) : void 
		{
			Dragonfly._default_fps = fps;
		}

		/**
		 * Gets the default engine FPS
		 */
		public static function get default_fps() : Number 
		{
			return Dragonfly._default_fps;
		}

		/**
		 * TRUE if frame-mode is enabled, FALSE otherwise
		 */
		public static function get use_frames() : Boolean 
		{
			return Dragonfly._use_frames;
		}

		/**
		 * Sets the frame-mode accoding the given value
		 */
		public static function set use_frames( value : Boolean ) : void 
		{
			Dragonfly._use_frames = value;
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