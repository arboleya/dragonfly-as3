import dragonfly.body.events.DragonflyEvent;

/**
 * Dragonfly engine dispatches NymphEvent objects wherever of a nimph evs occur.
 * 
 * @author nybras | nybras@codeine.it
 * @see DragonflyEvent.
 */
class dragonfly.body.events.NymphEvent extends DragonflyEvent {

	// [PRIVATE - properties] *******************************************************************/
	
	private var _data : Object;
	
	
	
	
	
	// [CONSTRUCTOR] ****************************************************************************/
	
	/**
	* Constructor.
	* @param type Event type.
	*/
	function  NymphEvent (type : String, data : Object) {
		super(type);
		this._data = data;
	}
	
	
	
	
	// [GETTERS - data] ***********************************************************************/
	
	/**
	 * Data property.
	 * @return The data.
	 */
	public function get data() : Object { return this._data; }
}