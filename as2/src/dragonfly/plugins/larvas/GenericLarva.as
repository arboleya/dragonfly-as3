import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.lib.generic.*;



class dragonfly.plugins.larvas.GenericLarva extends Larva {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a new GenericLarva instance.
	 * 
	 * @param target	The LarvaMovieClip target.
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used,
	 * otherwise (<code>false</code>) <code>'setInterval'</code> mode is used.
	 * @param fp If useFrames is <code>false</code>, you can set the refresh interval
	 * for the <code>'setInterval'</code> mode (default=30).
	 */
	public function GenericLarva (target : Object, useFrames : Boolean, fps : Number) {
		super( target, useFrames, fps );
	}
	
	
	
	
	
	// [ PUBLIC - Generic's ]  ***********************************************/
	
	/**
	 * Makes a 'Generic's larva flight.
	 * 
	 * @param prop The generic prop you want to make fly.
	 * @param start Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param friesPrevCalls EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>true</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 */
	public function fly (prop : String, start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, friesPrevCalls : Boolean, forceInit : Boolean) : Flight {
		return this.lay.apply( this, [ GenericEgg, prop ].concat( arguments.slice( 1 ) ) );
	}
}