


class cocktail.lib.events.Event {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/
	
	private var _type:String;
	private var _target:Object;
	private var _args:Object;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/
	
	/**
	 * Constructor
	 * 
	 * @param	type	Event type
	 */
	public function Event( type:String, target:Object, args:Object ){
		this.type = type;
		this.target = target;
		this.args = args;
	}
	
	
	
	
	
	/** [PUBLIC - getter/setter] ******************************************************
	***********************************************************************************/
	
	/**
	 * Sets the event type
	 */
	public function set type( type:String ):Void {
		this._type = type;
	}
	
	/**
	 * Returns the event type
	 */
	public function get type( ):String {
		return this._type;
	}
	
	
	/**
	 * Sets the event target
	 */
	public function set target(value:Object):Void{
		this._target = value;
	}
	
	/**
	 * Returns the event target
	 */
	public function get target( ):Object{
		return this._target;
	}
	
	/**
	 * Sets the event target
	 */
	public function set args(value:Object):Void{
		this._args = value;
	}
	
	/**
	 * Returns the event target
	 */
	public function get args( ):Object{
		return this._args;
	}
}