import dragonfly.body.Egg;
import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;

/**
 * Define the base of FilterEggs.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.body.core.Egg
 */
class dragonfly.plugins.larvas.lib.filters.eggs.FilterEgg extends Egg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * This var MUST be overwriten by child classes.
	 */
	public static function get FILTER_NAME () : String {
		throw new Error('[ FilterEgg ]: FILTER_NAME\n\t This var MUST be implemented by child classes');
		return null;
	} 
	
	
	// [PRIVATE - Properties] ***********************************************************/
	
	// The filter mananger instance.
	private var _filtersManager:FiltersManager;
	
	// The filter instance.
	private var _filter : String; 
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a FilterEgg object.
	 * 
	 * @param prop The Egg property.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 */
	public function FilterEgg (prop : String, larva : Larva, flight : Flight, filter : String, filtersManager : FiltersManager) {
		super(prop, larva, flight);
		
		this._isColor = (prop.toLowerCase().indexOf("color") != -1);
		
		this._filter = filter;
		this._filtersManager = filtersManager;
	}
	
	
	
	
	// [ PUBLIC - value accessors ] ******************************************/
	
	/**
	 * Sets the Egg prop/value.
	 * @param value the new value for the property.
	 */
	public function setValue ( value:Object ):Void {
		//trace ( "filter.setValue( filter,prop,value --> " + [this._filter, this.prop, value] +" ); " );
		this._filtersManager.setProperty(this._filter, this.prop, value);
	}
	
	/**
	 * Gets the current Egg property/value.
	 * @return The current property/value.
	 */
	public function getValue ():Object {
		//trace ( "filter.getValue( filter,prop --> "+ [this._filter, this.prop] +" ) = "+ this._filtersManager.getProperty(this._filter, this.prop) );
		return this._filtersManager.getProperty(this._filter, this.prop);
	}
}