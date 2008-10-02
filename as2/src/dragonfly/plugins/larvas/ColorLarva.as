import dragonfly.body.Converter;
import dragonfly.body.Flight;
import dragonfly.body.Larva;

import dragonfly.plugins.larvas.lib.color.ColorManager;
import dragonfly.plugins.larvas.lib.color.eggs.ColorEgg;
import dragonfly.plugins.larvas.lib.color.values.ColorRgbValues;
import dragonfly.plugins.larvas.lib.color.values.ColorTransformValues;


/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.ColorLarva extends Larva {
	
	// [VARS] ******************************************************************/
	
	/**
	 *  Filters mananger instance.
	 */
	private var _colorManager : ColorManager;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a ColorLarva object.
	 * 
	 * @param target	The ColorLarva target movieclip.
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used,
	 * otherwise (<code>false</code>) <code>'setInterval'</code> mode is used.
	 * @param fp If useFrames is <code>false</code>, you can set the refresh interval
	 * for the <code>'setInterval'</code> mode (default=30).
	 */
	public function ColorLarva (target : MovieClip, useFrames : Boolean, fps : Number) {
		super( target, useFrames, fps );
		this._colorManager = new ColorManager( this._targets );
	}
	
	
	
	
	
	// [SHOTTCUTS] ***********************************************************/
	
	/**
	 * Makes a hexadecimal 'COLOR's larva flight.
	 * 
	 * @param	start	Start value for the Egg transition.
	 * @param	end	End value for the Egg transition.
	 * @param	duration	Duration value for the Egg transition, in milleseconds.
	 * @param	delay	Delay before start the Egg transition, in milleseconds.
	 * @param	equation	Equation for the Egg transition.
	 * @param	equationArgs	EquationArgs to be applied to the given Equation.
	 * @param	forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return The egg flight.
	 */
	public function hex ( start : Number, end : Number, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean ) : Flight {
		var _start : ColorRgbValues;
		var _end : ColorRgbValues;
		var rgb_start : Array;
		var rgb_end : Array;
		
		rgb_start = Converter.hex2rgb( start );
		rgb_end = Converter.hex2rgb( end );
		
		_start = ( start == null ? null : new ColorRgbValues( rgb_start[0], rgb_start[1], rgb_start[2] ) );
		_end = ( end == null ? null : new ColorRgbValues( rgb_end[0], rgb_end[1], rgb_end[2] ) );
		
		if ( _start == null ) {
			_start = new ColorRgbValues(
				this._colorManager.getProperty( ColorEgg.RED_OFFSET ),
				this._colorManager.getProperty( ColorEgg.GREEN_OFFSET ),
				this._colorManager.getProperty( ColorEgg.BLUE_OFFSET )
			);
		}
		
		if ( _end == null ) {
			_end = new ColorRgbValues(
				this._colorManager.getProperty( ColorEgg.RED_OFFSET ),
				this._colorManager.getProperty( ColorEgg.GREEN_OFFSET ),
				this._colorManager.getProperty( ColorEgg.BLUE_OFFSET )
			);
		}
		
		//trace ( "hex-start: " + [ _start.r, _start.g, _start.b ]  ) ;
		//trace ( "hex-end: "+ [ _end.r, _end.g, _end.b ] );
		
		return this.rgb.apply(this, [ _start, _end, duration, delay, equation, equationArgs, forceInit ] );
	}
	
	/**
	 * Makes a rgb 'COLOR's larva flight.
	 * 
	 * @param	start	Start value for the Egg transition.
	 * @param	end	End value for the Egg transition.
	 * @param	duration	Duration value for the Egg transition, in milleseconds.
	 * @param	delay	Delay before start the Egg transition, in milleseconds.
	 * @param	equation	Equation for the Egg transition.
	 * @param	equationArgs	EquationArgs to be applied to the given Equation.
	 * @param	forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return The egg flight.
	 */
	public function rgb ( start : ColorRgbValues, end : ColorRgbValues, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean ) : Flight {
		var _start : ColorTransformValues;
		var _end : ColorTransformValues;
		
		var ra : Number;
		var ga : Number;
		var ba : Number;
		
		ra = this._colorManager.getProperty( ColorEgg.RED_MULTIPLIER );
		ga = this._colorManager.getProperty( ColorEgg.GREEN_MULTIPLIER );
		ba = this._colorManager.getProperty( ColorEgg.BLUE_MULTIPLIER );
		
		//if ( start != null ) {
			//this._colorManager.setProperty(  );
		//}
		
		_start = new ColorTransformValues( ra, ga, ba, 1, start.r, start.g, start.b, 0 );
		//_start = new ColorTransformValues( 1, 1, 1, 1, 0, 0, 0, 0 );
		_end = new ColorTransformValues( 0, 0, 0, 1, end.r, end.g, end.b, 0 );
		
		return this.transform.apply( this, [_start, _end, duration, delay, equation, equationArgs, forceInit] );
	}
	
	/**
	 * Makes a transform 'COLOR's larva flight.
	 * 
	 * @param	start	Start value for the Egg transition.
	 * @param	end	End value for the Egg transition.
	 * @param	duration	Duration value for the Egg transition, in milleseconds.
	 * @param	delay	Delay before start the Egg transition, in milleseconds.
	 * @param	equation	Equation for the Egg transition.
	 * @param	equationArgs	EquationArgs to be applied to the given Equation.
	 * @param	forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * 
	 * @return The egg flight.
	 */
	public function transform ( start : ColorTransformValues, end : ColorTransformValues, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean ) : Flight {
		var prop : String;
		var eggClass : Function;
		
		this.openFlight();
		
		eggClass = ColorEgg;
		
		// just to be collected by the openedFlight
		this.lay( ColorEgg, ColorEgg.RGB, 0, 1, duration, delay, equation, equationArgs, forceInit, fps, useFrames, [ this._colorManager ] );
		this.lay( ColorEgg, ColorEgg.HEX, 0, 1, duration, delay, equation, equationArgs, forceInit, fps, useFrames, [ this._colorManager ] );
		
		for ( prop in start ) {
			if ( prop == prop.toUpperCase() ) {
				//trace ( "lay: (prop("+ prop +") = start("+ start[prop] +"), end("+ end[prop] +")" );
				this.lay( ColorEgg, eggClass[ prop ], start[ prop ], end[ prop ], duration, delay, equation, equationArgs, forceInit, fps, useFrames, [ this._colorManager ] );
			}
		}
		
		return this.closeFlight();
	}
	
}