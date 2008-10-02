import dragonfly.body.Egg;
import dragonfly.body.Flight;
import dragonfly.body.Larva;



/**
 * GenericEgg class.
 * 
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.lib.generic.GenericEgg extends Egg {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a GenericEgg object.
	 * 
	 * @param prop The Egg prop.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 */
	public function GenericEgg (prop : String, larva : Larva, flight : Flight) {
		super(prop, larva, flight);
	}
	
	
	
	
	
	// [ PRIVATE - value getter/setter ] *************************************/
	
	/**
	 * Sets the Egg prop/value.
	 * 
	 * @param value Returns the new value for the prop.
	 */
	public function setValue (value : Object) : Void {
		var prop : String = this.prop;
		this._targets.each(function (target : Object) : Void {
			target[ prop ] = value;
		}, this);
	}
	
	/**
	 * Returns the current Egg prop/value.
	 * 
	 * @return The current prop value.
	 */
	public function getValue () : Object {
		return this._targets.head.data[this.prop];
	}
	
}
