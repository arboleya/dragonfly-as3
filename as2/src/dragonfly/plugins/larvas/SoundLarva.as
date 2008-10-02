import dragonfly.body.Flight;
import dragonfly.body.Larva;
import dragonfly.plugins.larvas.lib.sound.SoundEgg;



class dragonfly.plugins.larvas.SoundLarva extends Larva {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a SoundLarva object.
	 * 
	 * @param target	The SoundLarva target sound.
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used,
	 * otherwise (<code>false</code>) <code>'setInterval'</code> mode is used.
	 * @param fp If useFrames is <code>false</code>, you can set the refresh interval
	 * for the <code>'setInterval'</code> mode (default=30).
	 */
	public function SoundLarva (target : Sound, useFrames : Boolean, fps : Number) {
		super( target, useFrames, fps );
	}
	
	
	
	
	
	// [ PUBLIC - shortcuts ]  ***********************************************/
	
	/**
	 * Makes a 'SOUND (volume)'s larva flight.
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
	public function sound (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean) : Flight {
		return this.lay.apply( this, [ SoundEgg, SoundEgg.VOLUME ].concat( arguments.slice( 1 ) ) );
	}
}