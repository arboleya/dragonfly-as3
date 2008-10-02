
import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.Converter;
import dragonfly.body.Egg;
import dragonfly.body.events.FlightEvent;
import dragonfly.plugins.larvas.lib.color.eggs.ColorEgg;
import dragonfly.plugins.larvas.lib.color.values.ColorRgbValues;
import dragonfly.plugins.larvas.lib.color.ColorManager;


/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.events.ColorFlightEvent extends FlightEvent {
	
	// [ VARS ] **************************************************************/
	
	private var colorManager : ColorManager;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new ColorFlightEvent.
	 * 
	 * @param	type	Event type.
	 * @param	egg	The caller egg.
	 * @param	prop	The egg property.
	 * @param	value	The egg value.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 */
	public function ColorFlightEvent ( type : String, egg : Egg, prop : String, value : Object, eggs : LinkedList, colorManager : ColorManager ) {
		super( type, egg, prop, value, eggs );
		this.colorManager = colorManager;
	}
	
	
	
	
	
	// [ GETTERS ] ***********************************************************/
	
	/**
	 * TODO: add comments.
	 */
	public function get HEX () : Number {
		trace ( ">>> "+ [this.RED_OFFSET, this.GREEN_OFFSET, this.BLUE_OFFSET] );
		return Converter.rgb2hex( [this.RED_OFFSET, this.GREEN_OFFSET, this.BLUE_OFFSET] );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get RGB () : ColorRgbValues {
		var rgb : Array;
		rgb = Converter.hex2rgb( this.HEX );
		return new ColorRgbValues ( rgb[0], rgb[1], rgb[2] );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get RED_MULTIPLIER () : Number {
		return Number( this.read( ColorEgg.RED_MULTIPLIER ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get GREEN_MULTIPLIER () : Number {
		return Number( this.read( ColorEgg.GREEN_MULTIPLIER ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BLUE_MULTIPLIER () : Number {
		return Number( this.read( ColorEgg.BLUE_MULTIPLIER ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get ALPHA_MULTIPLIER () : Number {
		return Number( this.read( ColorEgg.ALPHA_MULTIPLIER ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get RED_OFFSET () : Number {
		return Number( this.read( ColorEgg.RED_OFFSET ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get GREEN_OFFSET () : Number {
		return Number( this.read( ColorEgg.GREEN_OFFSET ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BLUE_OFFSET () : Number {
		return Number( this.read( ColorEgg.BLUE_OFFSET ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get ALPHA_OFFSET () : Number {
		return Number( this.read( ColorEgg.ALPHA_OFFSET ) );
	}
	
}