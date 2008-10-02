import dragonfly.body.Flight;
import dragonfly.plugins.larvas.MovieClipLarva;

import dragonfly.plugins.core.Conf;

import dragonfly.plugins.larvas.lib.filters.eggs.*;
import dragonfly.plugins.larvas.lib.filters.confs.*;
import dragonfly.plugins.larvas.lib.filters.FiltersManager;



/**
 * The Larva implementation from Flash filters. 
 * 
 * @see Larva
 */
class dragonfly.plugins.larvas.FiltersLarva extends MovieClipLarva {
	
	// [VARS] ******************************************************************/
	
	/**
	 *  Filters mananger instance.
	 */
	private var _filtersManager : FiltersManager;
	
	
	
	
	
	// [CONSTRUCTOR] ***********************************************************/
	
	/**
	 * Create a FiltersLava object.
	 * 
	 * @param target The larva target.
	 * @param useFrames	If <code>false</code>'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 */
	public function FiltersLarva (target : Object, useFrames : Boolean, fps : Number) {
		super(target, useFrames, fps);
		this._filtersManager = new FiltersManager( this._targets );
	}
	
	
	
	
	
	// [FILTER EGGs - control] ***********************************************/
	
	/**
	 * Applies filter egg conf.
	 * 
	 * @param eggClass The Filter Egg class to receive the Conf.
	 * @param conf Egg's configuration.
	 */
	private function applyFilterEggConf (eggClass : Function, conf : Conf) : Void {
		var prop:String;
		
		for (prop in conf) {
			// hack to avoid non-filter props
			if (prop == prop.toUpperCase() && conf[prop] !== undefined) {
				this._filtersManager.setProperty(eggClass["FILTER_NAME"], eggClass[prop], conf[prop]);
			}
		}
	}
	
	/**
	 * @private
	 * Applies filter egg values.
	 * 
	 * @param eggClass The eggClass you want to lay a new instance.
	 * @param conf The conf to be aplied into the carried Egg.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param friesPrevCalls If <code>true</code>, fries all prev Egg/prop calls, even if the tween has a delay.
	 * @param forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames	If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * @return The flight.
	 */
	private function applyFilterEggValues (eggClass : Function, conf : Conf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		var prop:String;
		var start:Object;
		var end:Object;
		
		this.openFlight();
		
		for (prop in conf.start) {
			start = conf.start[prop];
			end = conf.end[prop];
			if (start != undefined || end != undefined) {
				this.lay( eggClass, eggClass[prop], start, end, duration, delay, equation, equationArgs, forceInit, [ this._filtersManager ] );
			}
		}
		
		return this.closeFlight();
	}
	
	
	
	
	
	// [LARVA - overwriting] *************************************************/
	
	/**
	 * Resets the running filters of the given prop, if no prop is given resets all running filters.
	 */
	public function reset ( ) : Void {
		super.reset();
		this._filtersManager = new FiltersManager( this._targets );
		this.targets.each(this.resetFilters, this);
	}
	
	/**
	 * Reset the 'filters' property of each target
	 * @param	target
	 */
	private function resetFilters( target : MovieClip ):Void {
		target.filters = [];
	}
	
	
	
	
	
	// [SHORCUTS] ***********************************************************/
	
	/**
	 * Makes a 'BEVEL's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see BevelConf
	 * @see BevelEgg
	 * @see BevelValues
	 */
	public function bevel (conf : BevelConf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		this.applyFilterEggConf(BevelEgg, conf);
		return  this.applyFilterEggValues(BevelEgg, conf, duration, delay, equation, equationArgs, forceInit);
	}
	
	/**
	 * Makes a 'BLUR's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see BlurConf
	 * @see BlurEgg
	 * @see BlurValues
	 */
	public function blur (conf : BlurConf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		this.applyFilterEggConf(BlurEgg, conf);
		return  this.applyFilterEggValues(BlurEgg, conf, duration, delay, equation, equationArgs, forceInit);
	}
	
	/**
	 * Makes a 'COLORMATRIX's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param friesPrevCalls	EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see ColorMatrixEgg
	 * @see ColorMatrixFilter
	 */
	public function colorMatrix (start : Array, end : Array, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		return this.lay(ColorMatrixEgg, ColorMatrixEgg.MATRIX, start, end, duration, delay, equation, equationArgs, forceInit, [this._filtersManager]);
	}
	
	/**
	 * Makes a 'CONVOLUTION's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see ConvolutionConf
	 * @see ConvolutionEgg
	 * @see ConvolutionValues
	 */
	public function convolution (conf : ConvolutionConf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		this.applyFilterEggConf(ConvolutionEgg, conf);
		return  this.applyFilterEggValues(ConvolutionEgg, conf, duration, delay, equation, equationArgs, forceInit);
	}
	
	/**
	 * Makes a 'DISPLACEMENTMAP's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see DisplacementMapConf
	 * @see DisplacementMapEgg
	 * @see DisplacementMapValues
	 */
	public function displacementMap (conf : DisplacementMapConf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		this.applyFilterEggConf(DisplacementMapEgg, conf);
		return  this.applyFilterEggValues(DisplacementMapEgg, conf, duration, delay, equation, equationArgs, forceInit);
	}
	
	/**
	 * Makes a 'DROPSHADOW's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see DropShadowConf
	 * @see DropShadowEgg
	 * @see DropShadowValues
	 */
	public function dropShadow (conf : DropShadowConf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		this.applyFilterEggConf(DropShadowEgg, conf);
		return  this.applyFilterEggValues(DropShadowEgg, conf, duration, delay, equation, equationArgs, forceInit);
	}
	
	/**
	 * Makes a 'GLOW's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay	Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see GlowConf
	 * @see GlowEgg
	 * @see GlowValues
	 */
	public function glow (conf : GlowConf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		this.applyFilterEggConf(GlowEgg, conf);
		return  this.applyFilterEggValues(GlowEgg, conf, duration, delay, equation, equationArgs, forceInit);
	}
	
	/**
	 * Makes a 'GRADIENTBEVEL's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see GradientConf
	 * @see GradientBevelEgg
	 * @see GradientValues
	 */
	public function gradientBevel (conf : GradientConf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		this.applyFilterEggConf(GradientBevelEgg, conf);
		return  this.applyFilterEggValues(GradientBevelEgg, conf, duration, delay, equation, equationArgs, forceInit);
	}
	
	/**
	 * Makes a 'GRADIENTGLOW's larva flight.
	 * 
	 * @param conf Conf for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default=30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 * 
	 * @return The egg flight.
	 * 
	 * @see GradientConf
	 * @see GradientGlowEgg
	 * @see GradientValues
	 */
	public function gradientGlow (conf : GradientConf, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Flight {
		this.applyFilterEggConf(GradientGlowEgg, conf);
		return  this.applyFilterEggValues(GradientGlowEgg, conf, duration, delay, equation, equationArgs, forceInit);
	}
}