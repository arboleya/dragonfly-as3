import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.lib.frame.*;



class dragonfly.plugins.larvas.FrameLarva extends Larva {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a FrameLarva object.
	 * 
	 * @param target	The FrameLarva target movieclip.
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used,
	 * otherwise (<code>false</code>) <code>'setInterval'</code> mode is used.
	 * @param fp If useFrames is <code>false</code>, you can set the refresh interval
	 * for the <code>'setInterval'</code> mode (default=30).
	 */
	public function FrameLarva (target : MovieClip, useFrames : Boolean, fps : Number) {
		super( target, useFrames, fps );
	}
	
	
	
	
	
	// [ PUBLIC - shortcuts ] ************************************************/
	
	/**
	 * Makes a 'FRAME's larva flight.
	 * 
	 * @param start Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return The egg flight.
	 */
	public function frame (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean) : Flight {
		return this.lay.apply( this, [ FrameEgg, FrameEgg.FRAME ].concat( arguments ) );
	}
}