import cocktail.lib.events.Event;

/**
 * Dragonfly engine dispatches FrameEvent objects wherever of a frame event occur.
 * 
 * @author nybras | nybras@codeine.it
 */
class dragonfly.body.events.FrameEvent extends Event {

	// [CONSTANTS] *******************************************************************/
	
	/**
	 * On enter frame event type.
	 * @return <code>onEnterFrame</code> ev type.
	 */
	public static function get ON_ENTER_FRAME ():String { return "onEnterFrame"; }
	
	
	
	
	
	// [CONSTRUCTOR] *****************************************************************/
	
	/**
	* Constructor.
	* @param type Event type.
	*/
	function  FrameEvent (type : String) {
		super(type);
	}
}