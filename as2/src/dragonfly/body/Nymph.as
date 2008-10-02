import dragonfly.body.events.NymphEvent;
import dragonfly.Dragonfly;
import dragonfly.body.Frame;
import dragonfly.body.events.FrameEvent;

import cocktail.utils.Delegate;
import cocktail.utils.SetTimeout;
import cocktail.lib.events.EventDispatcher;
import cocktail.lib.events.EventListener;


/**
 * Nymph class.
 */
class dragonfly.body.Nymph extends EventDispatcher {
	
	// [ PRIVATE - properties ]***********************************************/
	
	private var init_st:SetTimeout;
	private var inititalized:Boolean;
	
	private var start:Array;
	private var end:Array;
	private var duration:Number;
	private var equation:Function;
	private var equationArgs:Array;
	
	private var fps:Number;
	private var useFrames:Boolean;
	
	private var timer:Number;
	private var updating:Number;
	private var lastUpdateTimer:Number;
	private var hasMultipleValues:Boolean;
	
	private var _active:Boolean;
	
	private var frameListener:EventListener;
	
	private static var frame:Frame = new Frame();
	
	
	
	
	
	// [ CONSTRUCTOR ]********************************************************/
	
	/**
	 * Create a Nymph object.
	 * 
	 * @param start
	 * @param end
	 * @param duration
	 * @param equation
	 * @param colorMode
	 * @param EggListener
	 * @param equationArgs
	 * @param fps
	 */
	public function Nymph (start : Object, end : Object, duration : Number, delay : Number, equation : Function, equationArgs : Array, fps : Number, useFrames : Boolean)  {
		this.start = [].concat(start);
		this.end = [].concat(end);
		this.duration = Math.max(duration, 1);
		this.equation = equation;
		this.equationArgs = equationArgs;
		this.fps = (isNaN(fps) ? Dragonfly.defaultFps : fps);
		this.useFrames = (useFrames || Dragonfly.useFrames);
		
		this.hasMultipleValues = (this.start.length > 1);
		this.timer = 0;
		
		this.init_st = new SetTimeout(this.init, Math.max(delay, 1), this, [true]);
	}
	
	
	
	
	
	// [ PUBLIC - get active ]************************************************/
	
	/**
	 * Returns the egg status: TRUE if active, FALSE otherwise.
	 * 
	 * @return The Egg status.
	 */
	public function get active () : Boolean {
		return this._active;
	}
	
	
	// [ PRIVATE - set active ]***********************************************/
	
	/**
	 * @private
	 * Change the Egg status.
	 * 
	 * @param status New Egg status: <code>true</code> if active, <code>false</code> otherwise.
	 */
	private function setActive (status : Boolean) : Void {
		this._active = status;
	}
	
	
	
	
	// [ PUBLIC - hold, unhold, reset, timeleft ]*****************************/
	
	/**
	 * Holds the tween.
	 */
	public function hold () : Void {
		this.stopUpdater();
	}
	
	/**
	 * Unholds the tween.
	 */
	public function unhold () : Void {
		this.startUpdater();
	}
	
	/**
	 * Stops and Resets the tween.
	 */
	public function reset () : Void {
		this.timer = 0;
		this.stopUpdater();
	}
	
	
	
	/**
	 * The current tween's time left
	 */
	public function get timeLeft () :Number {
		return Math.max(0, (this.duration - this.timer));
	}
	
	
	
	
	// [ PRIVATE - init, kick ] **********************************************/
	
	
	/**
	 * @private
	 * Initializes the module.
	 */
	private function init () : Void {
		var start:Object;
		
		this.inititalized = true;
		this.lastUpdateTimer = getTimer();
		
		this.startUpdater();
		
		start = (this.hasMultipleValues ? this.start : this.start[0]);
		this.dispatchEvent(new NymphEvent(NymphEvent.START, start));
	}
	
	/**
	 * Executes the START, UPDATE and COMPLETE events, bypassing the tween animation.
	 */
	public function kick () : Void {
		var end:Object;
		var start:Object;
		
		start = (this.hasMultipleValues ? this.start : this.start[0]);
		end = (this.hasMultipleValues ? this.end : this.end[0]);
		
		this.timer = this.duration;
		
		if ( !this.inititalized ) {
			this.init_st.abort();
			this.dispatchEvent(new NymphEvent(NymphEvent.START, start));	
		} else {
			this.stopUpdater();
			
			this.dispatchEvent(new NymphEvent(NymphEvent.UPDATE, end));
			this.dispatchEvent(new NymphEvent(NymphEvent.COMPLETE, end));
		}
	}
	
	
	
	
	
	// [ PRIVATE - updater ] *************************************************/
	
	
	/**
	 * @private
	 * Starts the updater.
	 */
	private function startUpdater () : Void {
		this.setActive(true);
		
		if (this.useFrames) {
			// We delegate the updater-method listener here to avoid multiple removal ( as the updater function
			// is the same in all instances of nymph and the Frame class is unique ), otherwise always that one
			// nymph removes it's listener ( in FRAME-MODE ) all the others nymphs running in FRAME-MODE would
			// remove it's listener too... yes, it's a crap but this way it worls pretty well. |m| 
			this.frameListener = Nymph.frame.addEventListener(FrameEvent.ON_ENTER_FRAME, Delegate.create( this.updater, this ) );
		} else {
			this.updating = setInterval(Delegate.create(this.updater, this), this.fps);
		}
	}
	
	/**
	 * @private
	 * Stops the updater.
	 */
	private function stopUpdater () : Void {
		this.setActive(false);
		
		if (this.useFrames) {
			// As we've delegated the method listener when adding it, now we don't use the 'removeEventListener',
			// because we don't have a reference to the delegated function. Instead, we keep the EventListener
			// instance ( returned by the addEventListener methoed ) and use it's 'destroy' method to remove it.
			// God Bless the big plus of the EventListner's destroy method. :-P
			this.frameListener.destroy();
		} else {
			clearInterval(this.updating);
		}
	}
	
	/**
	 * @private
	 * Updates the Nymph Engine.
	 */
	private function updater () : Void {
		var value:Number;
		var values:Array;
		var output:Object;
		var timer:Number;
		var args:Array;
		var i:Number;
		var len:Number;
		
		values = new Array;
		output = new Array;
		
		timer = Math.min(this.timer, this.duration);
		
		i = 0;
		len = this.start.length;
		
		for (; i < len; i++ ) {
			values.push(this.getValue(timer, this.start[i], this.end[i]));
		}
		
		output = (this.hasMultipleValues ? values : values[0]);
		this.dispatchEvent(new NymphEvent(NymphEvent.UPDATE, output));
		
		if (this.timer >= this.duration) {
			this.stopUpdater();
			this.dispatchEvent(new NymphEvent(NymphEvent.COMPLETE, output));
		} else {
			this.timer += (this.useFrames ? 1 : (getTimer()-this.lastUpdateTimer));
		}
		
		this.lastUpdateTimer = getTimer();
	}
	
	/**
	 * @private
	 * Get value with desired easing
	 * 
	 * @param timer The current tween timer.
	 * @param start Start color.
	 * @param end End Color.
	 * 
	 * @return The current tween color.
	 */
	private function getValue(timer : Number, start : Number, end : Number) : Number {
		return Number(this.equation.apply(this, [timer, start, (end - start), this.duration].concat(this.equationArgs)));
	}
	
}
