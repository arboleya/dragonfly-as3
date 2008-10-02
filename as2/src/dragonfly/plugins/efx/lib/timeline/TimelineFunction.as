import cocktail.lib.data.ds.LinkedList;
import cocktail.lib.data.ds.Node;

class dragonfly.plugins.efx.lib.timeline.TimelineFunction {
	
	// [ PRIVATE - properties ] **********************************************/
	
	private var nodeRef:Node;
	private var stackRef:LinkedList;
	
	
	
	
	
	// [ PUBLIC - properties ] ***********************************************/
	
	public var frame:Number;
	public var func:Function;
	public var scope:Object;
	public var args:Array;
	public var expires:Boolean;
	public var executions:Number;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Adds a function to be executed when timeline reachs the given frame
	 * 
	 * @param frame Frame in which you to execute the fucntion
	 * @param func Function to be executed at the given frame
	 * @param scope Scope where function should be executed
	 * @param args Arguments to be passed to the function
	 * @param expires If TRUE, function executes just ont time, otherwise function executes forever, everytime the playhead reachs the given frame (default=true)
	 * @param executions If 'expires' is FALSE, then you can tell how many times function should be executed. If no 'executions' is given, function will be executed forever
	 */
	public function TimelineFunction (frame : Number, func : Function, scope : Object, args : Array, expires : Boolean, executions : Number) {
		this.frame = frame;
		this.func = func;
		this.scope = scope;
		this.args = (args || []);
		this.expires = (expires !== false);
		this.executions = executions;
	}
	
	
	
	
	
	// [ PUBLIC - Node/Stack Set, Exec & Destroy Feature ] *******************/
	
	/**
	 * Sets the node reference to the EventListener in the EventDispatcher listeners stack,
	 * and also a reference to the listeners stack as well.
	 * 
	 * @param node Node reference.
	 * @param stack	Functions stack reference.
	 */
	public function setNodeStack (node : Node, stack : LinkedList) : TimelineFunction {
		this.nodeRef = node;
		this.stackRef = stack;
		return this;
	}
	
	/**
	 * Execs the fucntion until (if) it get expired
	 */
	public function exec () : Void {
		this.func.apply(this.scope, this.args);
		
		if (! this.expires) {
			if (this.executions === undefined || --this.executions) {
				return;
			}
		}
		
		this.destroy();
	}
	
	/**
	 * Destroys the EventLister and removes it from the EventDispatcher listeners stack
	 */
	public function destroy ():Void {
		this.stackRef.remove( this.nodeRef );
	}
	
}