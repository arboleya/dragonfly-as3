import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.MovieClipFlightEvent;
import dragonfly.plugins.larvas.lib.generic.GenericEgg;



/**
 * MovieClipEgg class.
 */
class dragonfly.plugins.larvas.lib.movieclip.MovieClipEgg extends GenericEgg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	public static function get X () : String { return "_x"; }
	public static function get Y () : String { return "_y"; }
	
	public static function get XSCALE () : String { return "_xscale"; }
	public static function get YSCALE () : String { return "_yscale"; }
	
	public static function get WIDTH () : String { return "_width"; }
	public static function get HEIGHT () : String { return "_height"; }
	public static function get ALPHA () : String { return "_alpha"; }
	public static function get ROTATION () : String { return "_rotation"; }
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a MovieClipEgg object.
	 * 
	 * @param prop The Egg prop.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 */
	public function MovieClipEgg (prop : String, larva : Larva, flight : Flight) {
		super(prop, larva, flight);
		this.flight.setEventClass( MovieClipFlightEvent );
	}
	
}
