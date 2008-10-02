//* Dragonfly
import dragonfly.body.Egg;
import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.ColorFlightEvent;
import dragonfly.plugins.larvas.lib.color.ColorManager;



/**
 * ColorEgg class.
 */
class dragonfly.plugins.larvas.lib.color.eggs.ColorEgg extends Egg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	// fake values - see ColorFlightEvent getters for HEX and RGB
	public static function get RGB () : String { return "rgb"; }
	public static function get HEX () : String { return "hex"; }
	
	// color transform properties
	public static function get RED_MULTIPLIER () : String { return "redMultiplier"; }
	public static function get GREEN_MULTIPLIER () : String { return "greenMultiplier"; }
	public static function get BLUE_MULTIPLIER () : String { return "blueMultiplier"; }
	public static function get ALPHA_MULTIPLIER () : String { return "alphaMultiplier"; }
	public static function get RED_OFFSET () : String { return "redOffset"; }
	public static function get GREEN_OFFSET () : String { return "greenOffset"; }
	public static function get BLUE_OFFSET () : String { return "blueOffset"; }
	public static function get ALPHA_OFFSET () : String { return "alphaOffset"; }
	
	
	
	
	
	// [ PRIVATE - properties ] **********************************************/
	
	private var _colorManager : ColorManager;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a ColorEgg object.
	 * 
	 * @param prop The Egg prop.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 */
	public function ColorEgg (prop : String, larva : Larva, flight : Flight, extraArgs : Array ) {
		super(prop, larva, flight);
		this._colorManager = ColorManager( extraArgs[ 0 ] );
		this.flight.setEventClass( ColorFlightEvent );
		this.flight.setEventExtraArgs ( this._colorManager );
	}
	
	
	
	
	
	// [ PRIVATE - value getter/setter ] *************************************/
	
	/**
	 * Sets the Egg prop/value.
	 * @param value Returns the new value for the prop.
	 */
	public function setValue ( value : Number ) : Void {
		if ( this.prop != ColorEgg.RGB && this.prop != ColorEgg.HEX ) {
			this._colorManager.setProperty( this.prop, value );
		}
	}
	
	/**
	 * Returns the current Egg prop/value.
	 * @return The current prop/value.
	 */
	public function getValue () : Object {
		if ( this.prop != ColorEgg.RGB && this.prop != ColorEgg.HEX ) {
			return	this._colorManager.getProperty( this.prop );
		}
	}
	
}