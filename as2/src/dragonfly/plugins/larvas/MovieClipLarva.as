import dragonfly.body.Flight;
import dragonfly.plugins.larvas.GenericLarva;
import dragonfly.plugins.larvas.lib.movieclip.MovieClipEgg;



/**
 * MovieClipLarva class.
 * 
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.MovieClipLarva extends GenericLarva {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a MovieClipLarva object.
	 * 
	 * @param target	The MovieClipLarva target.
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used,
	 * otherwise (<code>false</code>) <code>'setInterval'</code> mode is used.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval
	 * for the <code>'setInterval'</code> mode (default=30).
	 */
	public function MovieClipLarva (target : Object, useFrames : Boolean, fps : Number) {
		super( target, useFrames, fps );
	}
	
	
	
	
	
	// [ PUBLIC - shortcuts ]  ***********************************************/
	
	/**
	 * Makes a 'X's MovieClipLarva flight.
	 * 
	 * @param start	Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay	Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param useFrames	If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight
	 */
	public function x (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		return this.lay( MovieClipEgg, MovieClipEgg.X, start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames );
	}
	
	/**
	 * Makes a 'Y's MovieClipLarva flight.
	 * 
	 * @param start Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween manjahas a delay.
	 * 
	 * @return The egg flight.
	 */
	public function y (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		return this.lay( MovieClipEgg, MovieClipEgg.Y, start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames );
	}
	
	/**
	 * Makes a 'X and Y's MovieClipLarva flight.
	 * 
	 * @param startX Start X-value for the Egg transition.
	 * @param startY Start Y-value for the Egg transition.
	 * @param endX End X-value for the Egg transition.
	 * @param endY End Y-value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay	Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return	The egg flight.
	 */
	public function xy (startX : Number, startY : Number, endX : Number, endY : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		this.openFlight();
		this.x( startX, endX, duration, delay, equation, equationArgs, forceInit , fps , useFrames );
		this.y( startY, endY, duration, delay, equation, equationArgs, forceInit , fps , useFrames );
		return this.closeFlight();
	}
	
	/**
	 * Makes a 'XSCALE's MovieClipLarva flight.
	 * 
	 * @param start	Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return	The egg flight.
	 */
	public function xscale (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		return this.lay( MovieClipEgg, MovieClipEgg.ALPHA, start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames );
	}
	
	/**
	 * Makes a 'YSCALE's MovieClipLarva flight.
	 * 
	 * @param start Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If TRUE, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return	The egg flight.
	 */
	public function yscale (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		return this.lay( MovieClipEgg, MovieClipEgg.YSCALE, start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames );
	}
	
	/**
	 * Makes a 'XSCALE and YSCALE's MovieClipLarva flight.
	 * 
	 * @param startX Start X-value for the Egg transition.
	 * @param startY Start Y-value for the Egg transition.
	 * @param endX End X-value for the Egg transition.
	 * @param endY End Y-value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay	Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit	If TRUE, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return	The egg flight.
	 */
	public function xyscale (startX : Number, startY : Number, endX : Number, endY : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		this.openFlight();
		this.xscale(startX, endX, duration, delay, equation, equationArgs, forceInit, fps, useFrames);
		this.yscale(startY, endY, duration, delay, equation, equationArgs, forceInit, fps, useFrames);
		return this.closeFlight();
	}
	
	/**
	 * Makes a 'WIDTH's MovieClipLarva flight.
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
	public function width (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		return this.lay( MovieClipEgg, MovieClipEgg.WIDTH, start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames );
	}
	
	/**
	 * Makes a 'HEIGHT's MovieClipLarva flight.
	 * 
	 * @param start	Start value for the Egg transition.
	 * @param end	End value for the Egg transition.
	 * @param duration	Duration value for the Egg transition, in milleseconds.
	 * @param delay	Delay before start the Egg transition, in milleseconds.
	 * @param equation	Equation for the Egg transition.
	 * @param equationArgs	EquationArgs to be applied to the given Equation.
	 * @param friesPrevCalls	EquationArgs to be applied to the given Equation.
	 * @param forceInit	If TRUE, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return The egg flight.
	 */
	public function height (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		return this.lay( MovieClipEgg, MovieClipEgg.HEIGHT, start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames );
	}
	
	/**
	 * Makes a 'ALPHA's MovieClipLarva flight.
	 * 
	 * @param start Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return The egg flight
	 */
	public function alpha (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		return this.lay( MovieClipEgg, MovieClipEgg.ALPHA, start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames );
	}
	
	/**
	 * Makes a 'ROTATION's MovieClipLarva flight.
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
	public function rotation (start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		return this.lay( MovieClipEgg, MovieClipEgg.ROTATION, start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames );
	}
}