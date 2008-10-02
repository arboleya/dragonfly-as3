//* Dragonfly
import dragonfly.body.Efx;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.FrameFlightEvent;
import dragonfly.plugins.larvas.FrameLarva;
import dragonfly.plugins.efx.lib.timeline.TimelineFunction;

//* Cocktail
import cocktail.lib.data.ds.LinkedList;
import cocktail.utils.Delegate;

//* Vendors
import com.robertpenner.easing.Linear;


/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.efx.TimelineEfx extends Efx {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	private var _target : MovieClip;
	private var _larva : FrameLarva;
	private var _functions : LinkedList;
	
	
	
	
	
	/** [PUBLIC - Larva Utils] ********************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 * 
	 * @param	target	Movieclip you want to apply the EFX
	 */
	public function TimelineEfx( target : MovieClip ) {
		this._larva = new FrameLarva( target , true);
		this._target = target;
		this._functions = new LinkedList();
	}
	
	
	
	
	
	/** [PUBLIC - function methods] ***************************************************
	***********************************************************************************/ 
	
	/**
	 * Adds a function to be executed when timeline reachs the given frame
	 * 
	 * @param	frames	Frame in which you want to execute the function
	 * @param	func	Function to be executed at the given frame
	 * @param	scope	Scope where function should be executed
	 * @param	args	Arguments to be passed to the function
	 * @param	expires	If TRUE, function executes just one time, otherwise function executes forever, everytime the playhead reachs the given frame (default=true)
	 * @param	executions	If 'expires' is FALSE, then you can tell how many times function should be executed
	 */
	public function addFrameFunction ( frame:Number, func:Function, scope:Object, args:Array, expires:Boolean, executions:Number ):TimelineFunction {
		var tf:TimelineFunction;
		
		tf = new TimelineFunction(frame, func, scope, args, expires, executions);
		return tf.setNodeStack(this._functions.append(tf), this._functions);
	}
	
	/**
	 * Removes a previous added FrameFunction
	 * 
	 * @param	func	Function you want to remove
	 * @param	frame	Frame you want to remove the function. If no frame is given, function will be removed from all frame it was added
	 */
	public function removeFrameFunction ( func:Function, frame:Number ):Void {
		this._functions.each(Delegate.create(this.each_removeFrameFunction, this, [func, frame]));
	}
	
	public function removeAllFrameFunctions () : Void {
		this._functions.each(function(data : TimelineFunction) : Void { data.destroy(); } );
	}
	/**
	 * 
	 * @param	func	Function to be removed
	 * @param	frame	Frame to remove the function. If no frame is given, function will be removed from all frame it was added
	 * @param	data	The timeline function reference ( current ocurrence in functions loop )
	 */
	private function each_removeFrameFunction ( func:Function, frame:Number, data:TimelineFunction ):Void {
		if (data.func == func && (data.frame == frame || frame == undefined)) {
			data.destroy();
		}
	}
	
	
	
	
	
	/** [PUBLIC - playhead methods] ***************************************************
	***********************************************************************************/ 
	
	/**
	 * Plays timeline forwards
	 * 
	 * @param	frame	
	 * @param	delay	
	 * @param	equation		Equation for animation
	 * @param	equationArgs	Args to passed to the equation
	 * @return
	 */
	public function play ( frame : Number, delay : Number, equation:Function, equationArgs:Array ):Flight {
		var frames:Number;
		var target_frame : Number;
		
		target_frame = frame || this._target._totalframes;
		
		frames = (target_frame - this._target._currentframe);
		equation = (equation || Linear.easeNone);
		
		return this.listenFlight(this._larva.frame(null, target_frame, frames, delay || 0, equation, equationArgs));
	}
	
	/**
	 * Plays timeline backwards
	 * 
	 * @return	The efx flight
	 */
	public function playBackwards ( equation:Function, equationArgs:Array ):Flight {
		equation = (equation || Linear.easeNone);
		return this.listenFlight(this._larva.frame(null, 1, this._target._currentframe, 0, equation, equationArgs));
	}
	
	/**
	 * Plays timeline until the given frame
	 * 
	 * @param	frame	Frame you want to reach
	 * 
	 * @return	The efx flight
	 */
	public function playToFrame ( frame:Number ):Flight {
		var frames:Number = Math.abs(this._target._currentframe-frame);
		return this.listenFlight(this._larva.frame(null, frame, frames, 0, Linear.easeNone));
	}
	
	/**
	 * Sends timeline to the given frame
	 * 
	 * @param	frame	Frame you want to send the timeline to
	 * 
	 * @return	TRUE, it the current frame is different of the given frame, FALSE otherwise
	 */
	/**
	 * Exec target gotoAndStop passing frame
	 * @param	frame
	 * @return
	 */
	public function gotoAndStop (frame : Number) : Boolean {
		if (this._target._currentframe == frame) return false;
		
		this._target.gotoAndStop(frame);
		
		return true;
	}
	
	
	
	
	
	/** [PRIVATE - listeners] *********************************************************
	***********************************************************************************/ 
	
	/**
	 * Listens timeline flights - updated ev
	 * 
	 * @param	flight	Flight to be listened
	 * 
	 * @return	The Flight
	 */
	private function listenFlight ( flight:Flight ):Flight {
		flight.addUpdateListener(this.playhead_onUpdate, this);
		return flight;
	}
	
	/**
	 * Listens Flight.UPDATE
	 */
	private function playhead_onUpdate (event : FrameFlightEvent ):Void {
		this._functions.each(Delegate.create(this.each_playheadUpdate, this, event.FRAME ));
	}
	
	/**
	 * Functions loop execution
	 * 
	 * @param	currentFrame	Current timeline frame
	 * @param	data	LinkedList[node].data
	 */
	private function each_playheadUpdate ( currentFrame:Number , data : TimelineFunction ):Void {
		if (data.frame == currentFrame) {
			data.exec();
		}
	}
}