
import dragonfly.body.Larva;


/**
 * 
 */
class dragonfly.Dragonfly {
	
	// [ PUBLIC - properties ] ***********************************************/
	
	private static var _defaultFps:Number = 30;
	private static var _enabled:Boolean = true;
	private static var _useFrames:Boolean = false;
	
	
	
	
	
	/**
	 * Constructor
	 */
	public function Dragonfly () {
		throw new Error ("Dragonfly is a static class and should not be instantiated.");
	}
	
	
	
	
	
	/** [ PUBLIC - fps ] *************************************************************
	***********************************************************************************/ 
	
	/**
	 * Gets the default fps
	 * 
	 * @param	fps	The default engine FPS
	 */
	public static function setDefaultFps ( fps:Number ):Void {
		Dragonfly._defaultFps = fps;
	}
	
	
	/**
	 * Gets the default engine FPS
	 */
	public static function get defaultFps ():Number {
		return Dragonfly._defaultFps;
	}
	
	
	/** [PUBLIC - userFrames getter/setter] *******************************************
	***********************************************************************************/
	
	/**
	 * TRUE if frame-mode is enabled, FALSE otherwise
	 */
	public static function get useFrames ():Boolean {
		return Dragonfly._useFrames;
	}
	
	/**
	 * Sets the frame-mode accoding the given value
	 */
	public static function set useFrames ( value:Boolean ):Void {
		Dragonfly._useFrames = value;
	}
	
	
	
	
	
	/** [PUBLIC - enable/disable] *****************************************************
	***********************************************************************************/ 
	
	/**
	* Check if the Dragonfly engine is ON or OFF
	* 
	* @return	TRUE if engine is active, FALSE otherwise
	*/
	public static function get enabled ():Boolean {
		return Dragonfly._enabled;
	}
	
	/**
	* Enable the Dragonfly engine ( transition mode ON )
	*/
	public static function enable ():Void {
		Dragonfly._enabled = true;
	}
	
	/**
	* Disable the Dragonfly engine ( transition mode OFF )
	*/
	public static function disable ():Void {
		Dragonfly._enabled = false;
	}
	
	
	
	
	
	/** [PUBLIC - clone/kill]**********************************************************
	***********************************************************************************/ 
	
	/**
	* Clones a new Larva instance within the given target
	* 
	//* @param	target - The larva target ( usually a movieclip )
	* @return	A new Larva instance
	*/
	public static function cloneLarva (target:Object):Larva {
		return new Larva(target);
	}
	
	/**
	* kill the given Larva instance
	* 
	* @param	larva	The larva instance to be murdered
	*/
	public static function killLarva (larva:Larva):Void {
		larva = null;
		delete larva;
	}
}
