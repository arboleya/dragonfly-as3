import cocktail.lib.data.ds.LinkedList;
import cocktail.utils.SetTimeout;

import flash.geom.ColorTransform;

/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.lib.color.ColorManager {
	
	private var _targets : LinkedList;
	private var _colorTransform : ColorTransform;
	
	private var cycleTimeout : SetTimeout;
	
	
	
	
	
	// [CONSTRUCTOR] *********************************************************************************/ 
	
	/**
	 * Create a FiltersManager object.
	 * 
	 * @param targets Targets to be managed.
	 */
	function ColorManager ( targets : LinkedList ) {
		this._targets = targets;
		this._colorTransform = MovieClip(this._targets.head.data).transform.colorTransform;
	}
	
	
	
	
	
	// [PRIVATE - createInstances / Refresh] **********************************************************/
	
	//private function refreshCycle () : Void {
		//this.cycleTimeout.abort();
		//this.cycleTimeout = new SetTimeout(this.refresh, 5, this );
	//}
	
	/**
	 * Refreshes all targets / transforms.
	 */
	private function refresh () : Void {
		this._targets.each(this.each_refresh, this);
	}
	
	/**
	 * Refresh the Target Transform.
	 * 
	 * @param target Target to be refreshed.
	 */
	private function each_refresh ( target : MovieClip ) : Void {
		target.transform.colorTransform = this._colorTransform;
	}
	
	
	
	
	
	// [PRIVATE - setProperty / getProperty] **********************************************************/
	
	/**
	 * Sets the given ColorTransform Property/Value.
	 * 
	 * @param property Desired ColorTransform property.
	 * @param value	Value to the given Property.
	 */
	public function setProperty ( property : String, value : Number ) : Void {
		if ( !isNaN( value ) ) {
			this._colorTransform[ property ] = value;
		}
		//this.refreshCycle();
		this.refresh();
	}
	
	/**
	 * Gets the given ColorTransform Property/Value.
	 * 
	 * @param property Desired property.
	 * @return The property value.
	 */
	public function getProperty ( property : String ) : Number {
		return this._colorTransform[ property ];
	}
	
	
}