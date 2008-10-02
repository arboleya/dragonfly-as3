import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.Egg;
import dragonfly.body.events.DragonflyEvent;


/**
 * Dragonfly engine dispatches LarvaEvent objects wherever flight evs occurs.
 * @see DragonflyEvent.
 */
class dragonfly.body.events.LarvaEvent extends DragonflyEvent {
	
	// [PRIVATE - properties] ************************************************/
	
	private var _eggs : LinkedList;
	
	
	
	
	
	// [CONSTRUCTOR] *********************************************************/
	
	/**
	 * Creates a new LarvaEvent.
	 * 
	 * @param	type	Event type.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 * 
	 */
	public function LarvaEvent ( type : String, eggs : LinkedList ) {
		super(type);
		this._eggs = eggs;
	}
	
	
	
	
	
	// [GETTERS - data, eggs] ************************************************/
	
	/**
	 * Reads a egg value according the given prop, in all larva eggs stack.
	 * @param	prop	Prop you want to read 
	 */
	public function read ( prop : String ) : Object {
		var value : Object;
		
		this._eggs.each( function ( egg : Egg ) {
			if ( egg.prop == prop && value == undefined) {
				value = egg.getValue();
			}
		} );
		
		return value;
	}
	
	
	
	
	
	// [GETTERS - data, eggs] ************************************************/
	
	/**
	 * Returns an array of objects containing prop and value
	 */
	public function get flightObj () : Object {
		var obj : Object = new Object;
		
		this._eggs.each( function ( egg : Egg ) {
			obj[ egg.prop ] = egg.getValue();
		} );
		
		return obj;
	}
	
	/**
	 * Simultaneous layed eggs list.
	 * @return The layed eggs list.
	 */
	public function get eggs() : LinkedList {
		return this._eggs;
	}
}
