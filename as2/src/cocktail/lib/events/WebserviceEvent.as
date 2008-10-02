import cocktail.lib.events.Event;

/**
* Basic object to handle webservice calls
* @author hems
* @version 0.1
*/

class cocktail.lib.events.WebserviceEvent extends Event {

	public static function get SEND () : String {
		return 'send';
	}
	
	public static function get RESULT () : String {
		return 'result';
	}
	
	public static function get STATUS () : String {
		return 'status';
	}
	
	//webservice error
	public var code : String;
	public var data : Object;
	public var fault_string : Object;
	
	
	//webservice return
	public var result : Object;
	
	public var call_timer : Number;
	public var callback_timer : Number;
	public var operation : String;
	
	public function get time_elapsed () : Number {
		return this.callback_timer ? this.callback_timer - this.call_timer : getTimer() - this.call_timer;
	}
	
	public function WebserviceEvent (type : String, result : Object) {
		super(type);
		this.result = result;
	}
}