import cocktail.lib.events.Event;



/**
 * DragonflyEvent is used for the base class for the creation of Dragonfly engine evs.
 * 
 * @author nybras | nybras@codeine.it
 */
class dragonfly.body.events.DragonflyEvent extends Event {
	
	// [CONSTANTS] *******************************************************************/
	
	/**
	* <code>START</code> ev type.
	* @return A <code>START</code> ev type.
	*/
	public static function get START () : String { return "START"; }
	
	/**
	* <code>UPDATE</code> ev type.
	* @return A <code>UPDATE</code> ev type.
	*/
	public static function get UPDATE () : String { return "UPDATE"; }
	
	/**
	* <code>COMPLETE</code> ev type.
	* @return A <code>COMPLETE</code> ev type.
	*/
	public static function get COMPLETE () : String { return "COMPLETE"; }
	
	
	
	// [CONSTRUCTOR] *******************************************************************/
	
	/**
	* Creates a new DragonflyEvent.
	* @param type Event type.
	*/
	function  DragonflyEvent (type : String) {
		super(type);
	}
	
}