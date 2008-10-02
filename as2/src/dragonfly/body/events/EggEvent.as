import dragonfly.body.Egg;
import dragonfly.body.events.DragonflyEvent;



/**
 * Dragonfly engine dispatches EggEvent objects wherever egg evs occur.
 * 
 * @author nybras | nybras@codeine.it
 * @see DragonflyEvent.
 */
class dragonfly.body.events.EggEvent extends DragonflyEvent {
	
	// [PRIVATE - properties] ************************************************/
	
	private var _egg : Egg;
	private var _prop : String;
	private var _value : Object;
	
	
	
	
	
	// [CONSTRUCTOR] *********************************************************/
	
	/**
	 * Creates a new EggEvent.
	 * 
	 * @param type	Event type.
	 * @param egg	Eggs that's dispatching the event.
	 * @param prop	The egg prop.
	 * @param value	The egg value ( current tween value ).
	 */
	public function EggEvent ( type : String, egg : Egg, prop : String, value : Object ) {
		super(type);
		this._egg = egg;
		this._prop = prop;
		this._value = value;
	}
	
	
	
	
	
	// [GETTERS - data, eggs] ************************************************/
	
	/**
	 * Return the eggs that's dispatching the event.
	 * @return The egg that's dispatching the event.
	 */
	public function get egg() : Egg { return this._egg; }
	
	/**
	 * Egg property.
	 * @return The egg.
	 */
	public function get prop() : String { return this._prop; }
	
	/**
	 * Egg value.
	 * @return The egg.
	 */
	public function get value() : Object { return this._value; }
}
