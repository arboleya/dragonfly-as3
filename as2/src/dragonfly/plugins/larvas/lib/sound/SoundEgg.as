import dragonfly.body.Egg;
import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.SoundFlightEvent;



/**
 * SoundEgg class.
 * 
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.lib.sound.SoundEgg extends Egg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	public static function get VOLUME () : String { return "_volume"; }
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	* Create a SoundEgg object.
	* 
	* @param prop The Egg prop.
	* @param larva The larva that owns the Egg.
	* @param flight The larva flight.
	*/
	public function SoundEgg (prop : String, larva : Larva, flight : Flight) {
		super(prop, larva, flight);
		this.flight.setEventClass( SoundFlightEvent );
	}
	
	
	
	
	
	// [ PUBLIC - value getter/setter ] **************************************/
	
	/**
	 * Sets the Egg prop/value.
	 * 
	 * @param value Returns the new value for the prop.
	 */
	public function setValue (value : Object ) : Void {
		this._targets.each(function (target : Object) : Void {
			Sound(target).setVolume(Number(value));
		}, this);
	}
	
	/**
	 * Returns the current Egg prop/value.
	 * 
	 * @return The current prop/value
	 */
	public function getValue () : Object {
		return Sound(this._targets.head.data).getVolume();
	}
}
