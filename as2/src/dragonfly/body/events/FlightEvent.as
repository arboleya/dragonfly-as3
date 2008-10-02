import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.Egg;
import dragonfly.body.events.DragonflyEvent;


/**
 * Dragonfly engine dispatches FlightEvent objects wherever flight evs occurs.
 * @see DragonflyEvent.
 */
class dragonfly.body.events.FlightEvent extends DragonflyEvent {
	
	// [PRIVATE - properties] ************************************************/
	
	private var _egg : Egg;
	private var _prop : Object;
	private var _value : Object;
	private var _eggs : LinkedList;
	
	
	
	
	
	// [CONSTRUCTOR] *********************************************************/
	
	/**
	 * Creates a new FlightEvent.
	 * 
	 * @param	type	Event type.
	 * @param	egg	The caller egg.
	 * @param	prop	The egg property.
	 * @param	value	The egg value.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 */
	public function FlightEvent ( type : String, egg : Egg, prop : String, value : Object, eggs : LinkedList ) {
		super(type);
		
		if ( eggs == undefined ) {
			this._egg = egg;
			this._prop = prop;
			this._value = value;
		} else {
			this._eggs = eggs;
		}
	}
	
	
	
	
	
	// [GETTERS - data, eggs] ************************************************/
	
	/**
	 * 
	 * @param	prop	Prop you want to read 
	 */
	private function read ( prop : String ) : Object {
		var value : Object;
		
		if ( ! this.hasMultiple() ) {
			if ( this._egg.prop == prop ) {
				return this._egg.getValue();
			}
		}
		
		this._eggs.each( function ( egg : Egg ) {
			if ( egg.prop == prop && value == undefined) {
				value = egg.getValue();
			}
		} );
		
		return value;
	}
	
	
	
	
	
	// [GETTERS - data, eggs] ************************************************/
	
	/**
	 * Checks if the FlightEvent has multiple values
	 * @return	TRUE if FlightEvent has multiple values, FALSE otherwise
	 */
	private function hasMultiple () : Boolean {
		return ( this._eggs != undefined );
	}
	
	/**
	 * Returns an array of objects containing prop and value
	 */
	public function get flightObj () : Object {
		var obj : Object = new Object;
		
		if ( ! this.hasMultiple ) {
			obj[ this._egg.prop ] = this._egg.getValue();
			//obj[ this._egg.prop ] = this[ this._egg.prop.toUpperCase() ];
		} else {
			this._eggs.each( function ( egg : Egg ) {
				obj[ egg.prop ] = egg.getValue();
				//obj[ egg.prop ] = this[  ];
			}, this );
		}
		
		return obj;
	}
	
}