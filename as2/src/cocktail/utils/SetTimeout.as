import cocktail.utils.Delegate;

class cocktail.utils.SetTimeout {
	
	private var ID : Number;
	private var status : String;
	
	private var callback : Function;
	private var scope : Object;
	private var args : Array;
	
	private var passed : Number;
	private var totalTime : Number;
	private var startTime : Number;
	
	
	/**
	* Constructor
	* 
	* @param	callback
	* @param	interval
	* @param	scope
	*/
	
	// TODO: remove scope, args
	public function SetTimeout (callback : Function, interval : Number, scope : Object, args : Array) {
		this.totalTime = interval;
		this.startTime = getTimer();
		
		this.scope = scope;
		this.callback = callback;
		this.totalTime = totalTime;
		this.passed = 0;
		
		this.args = args;
		
		if(interval > 0) {
			this.schedule();
		} else {
			this.dispatch();
		}
	}
	
	
	
	/**
	* Schedules the event callback
	*/
	private function schedule () : Void {
		this.ID = setInterval(Delegate.create(this.dispatch, this), (this.totalTime-passed));
		this.status = "armed";
	}
	
	
	
	/**
	* Dispatch the event callback
	* 
	*/
	private function dispatch () : Void {
		this.status = "dispatched";
		this.callback.apply(this.scope, this.args);
		this.abort(false);
	}
	
	
	
	/**
	* Returns the time left for dispatch the event callback.
	* 
	*/
	public function getTimeLeft () : Number {
		if (this.status == "holded") {
			return (this.totalTime - this.passed);
		} else if (this.status == "armed") {
			return (this.totalTime - this.passed - (getTimer() - this.startTime));
		}
	}
	
	
	
	/**
	* Holds the timer
	* 
	*/
	public function hold () : Void {
		if (this.status == "armed") {
			this.status = "holded";
			clearInterval(this.ID);
			this.passed += (getTimer() - this.startTime);
		}
	}
	
	
	
	/**
	* Unhold the timer
	* 
	*/
	public function unhold () : Void {
		if (this.status == "holded") {
			this.startTime = getTimer();
			this.schedule();
		}
	}
	
	
	
	/**
	* Executes the event callback immediately
	* 
	*/
	public function fire () : Void {
		if (this.status != "dispatched") {
			this.dispatch();
		}
	}
	
	
	
	/**
	* Cancel the event callback execution
	* 
	*/
	public function abort (setStatus : Boolean) : Void {
		setStatus = (setStatus == undefined) ? true : setStatus;
		
		this.callback = undefined;
		clearInterval(this.ID);
		
		if(setStatus) {
			this.status = "aborted";
		}
	}
}
