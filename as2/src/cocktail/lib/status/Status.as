
class cocktail.lib.status.Status {
	
	// Loading status
	private static var _CREATED:String = "created";
	
	private static var _LOADING:String = "loading";
	private static var _PRELOADED:String = "preloaded";
	private static var _LOADED:String = "loaded";
	private static var _UNLOADED:String = "unloaded";
	
	// Playback status
	private static var _RENDERING:String = "rendering";
	private static var _RENDERED:String = "rendered";
	
	private static var _DESTROING:String = "destroing";
	private static var _DESTROYED:String = "destroyed";
	
	private static var _MOUNTING:String = "mounting";
	private static var _MOUNTED:String = "mounted";
	
	private static var _UNMOUNTING:String = "unmounting";
	private static var _UNMOUNTED:String = "unmounted";
	
	private static var _PLAYING:String = "playing";
	private static var _PLAYED:String = "played";
	private static var _PAUSED:String = "paused";
	private static var _STOPPED:String = "stopped";
	
	private static var _REWINDING:String = "rewinding";
	private static var _REWINDED:String = "rewinded";
	
	private static var _MUTED:String = "muted";
	private static var _UNMUTED:String = "unmuted";
	
	// Logic status
	private static var _INITIALIZED:String = "initialized";
	private static var _UNINITIALIZED:String = "uninitialized";
	
	private static var _CONFIGURED:String = "configured";
	private static var _DECONFIGURED:String = "deconfigured";
	
	private static var _STARTED:String = "started";
	private static var _TERMINATED:String = "terminated";
	
	// Usable status
	private static var _TRUE:String = "true";
	private static var _FALSE:String = "false";
	
	private static var _BTRUE:Boolean = true;
	private static var _BFALSE:Boolean = false;
	
	private static var _ACTIVE:String = "active";
	private static var _INACTIVE:String = "inactive";
	
	private static var _ENABLED:String = "enabled";
	private static var _DISABLED:String = "disabled";
	
	private static var _ON:String = "on";
	private static var _OFF:String = "off";
	
	private static var _OVER:String = "over";
	private static var _OUT:String = "out";
	
	private static var _SUCCESS:String = "success";
	private static var _FAILED:String = "failed";
	
	/**
	* 
	* GETTER METHODS
	* 
	*/
	
	// Loading
	public static function get CREATED( ):String {
		return Status._CREATED;
	}
	
	public static function get LOADING( ):String {
		return Status._LOADING;
	}
	
	public static function get PRELOADED( ):String {
		return Status._PRELOADED;
	}
	
	public static function get LOADED( ):String {
		return Status._LOADED;
	}
	
	public static function get UNLOADED( ):String {
		return Status._UNLOADED;
	}
	
	public static function get RENDERING( ):String {
		return Status._RENDERING;
	}
	
	public static function get RENDERED( ):String {
		return Status._RENDERED;
	}
	
	public static function get DESTROING( ):String {
		return Status._DESTROING;
	}
	
	public static function get DESTROYED( ):String {
		return Status._DESTROYED;
	}
	
	public static function get MOUNTING( ):String {
		return Status._MOUNTING;
	}
	
	public static function get MOUNTED( ):String {
		return Status._MOUNTED;
	}
	
	public static function get UNMOUNTING( ):String {
		return Status._UNMOUNTING;
	}
	
	public static function get UNMOUNTED( ):String {
		return Status._UNMOUNTED;
	}
	
	public static function get PLAYING( ):String {
		return Status._PLAYING;
	}
	
	public static function get PLAYED( ):String {
		return Status._PLAYED;
	}
	
	public static function get PAUSED( ):String {
		return Status._PAUSED;
	}
	
	public static function get STOPPED( ):String {
		return Status._STOPPED;
	}
	
	public static function get REWINDING( ):String {
		return Status._REWINDING;
	}
	
	public static function get REWINDED( ):String {
		return Status._REWINDED;
	}
	
	public static function get MUTED( ):String {
		return Status._MUTED;
	}
	
	public static function get UNMUTED( ):String {
		return Status._UNMUTED;
	}
	
	// Logic
	public static function get INITIALIZED( ):String {
		return Status._INITIALIZED;
	}
	
	public static function get UNINITIALIZED( ):String {
		return Status._UNINITIALIZED;
	}
	
	public static function get CONFIGURED( ):String {
		return Status._CONFIGURED;
	}
	
	public static function get DECONFIGURED( ):String {
		return Status._DECONFIGURED;
	}
	
	public static function get STARTED( ):String {
		return Status._STARTED;
	}
	
	public static function get TERMINATED( ):String {
		return Status._TERMINATED;
	}
	
	// Usable
	public static function get TRUE( ):String {
		return Status._TRUE;
	}
	
	public static function get FALSE( ):String {
		return Status._FALSE;
	}
	
	public static function get BTRUE( ):Boolean {
		return Status._BTRUE;
	}
	
	public static function get BFALSE( ):Boolean {
		return Status._BFALSE;
	}
	
	public static function get ACTIVE( ):String {
		return Status._ACTIVE;
	}
	
	public static function get INACTIVE( ):String {
		return Status._INACTIVE;
	}
	
	public static function get ENABLED( ):String {
		return Status._ENABLED;
	}
	
	public static function get DISABLED( ):String {
		return Status._DISABLED;
	}
	
	public static function get ON( ):String {
		return Status._ON;
	}
	
	public static function get OFF( ):String {
		return Status._OFF;
	}
	
	public static function get OVER( ):String {
		return Status._OVER;
	}
	
	public static function get OUT( ):String {
		return Status._OUT;
	}
	
	public static function get SUCCESS( ):String {
		return Status._SUCCESS;
	}
	
	public static function get FAILED( ):String {
		return Status._FAILED;
	}
}
