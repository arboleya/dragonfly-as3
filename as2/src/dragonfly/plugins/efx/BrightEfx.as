//* Dragonfly
import dragonfly.body.Efx;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.GenericLarva;

//* IDE imports
import flash.filters.GlowFilter;
import flash.geom.ColorTransform;
import flash.geom.Transform;


/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.efx.BrightEfx extends Efx {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	private var _target:MovieClip;
	private var _targetFilters:Array;
	private var _larva:GenericLarva;
	private var _colorEfx:ColorTransform;
	private var _trans:Transform;
	private var _filter:GlowFilter;
	private var _bright:Number;
	private var _strength:Number;
	private var _blur:Number;
	
	
	/** [PUBLIC - Constructor] ********************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 * 
	 * @param	target		Movieclip you want to apply the EFX
	 * @param	strength	The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the glow and the background. Valid values are 0 to 255. The default is 2.
	 * @param	blur		The amount of horizontal and vertical blur. Valid values are 0 to 255 (floating point). The default value is 6. Values that are a power of 2 (such as 2, 4, 8, 16 and 32) are optimized to render more quickly than other values.
	 * @param	quality		The number of times to apply the filter. Valid values are 0 to 15. The default value is 1, which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality.
	 * @param	inner		Specifies whether the glow is an inner glow. The value true indicates an inner glow. The default is false, an outer glow (a glow around the outer edges of the object).
	 * @param	knockout	Specifies whether the object has a knockout effect. The value true makes the object's fill transparent and reveals the background color of the document. The default is false (no knockout effect).
	 */
	public function BrightEfx(target:MovieClip, strength:Number, blur:Number, quality:Number, inner:Boolean, knockout:Boolean) {
		quality = quality || 1;
		
		this._strength = strength || 10;
		this._blur = blur;
		this._larva = new GenericLarva(this);
		this._target = target;
		this._targetFilters = target.filters;
		
		this._filter = new GlowFilter(0xFFFFFF, 0, 0, 0, 0, quality, inner, knockout);
		this._colorEfx = new ColorTransform(100, 100, 100, 0);
		
		this._trans = new Transform(target);
	}
	
	
	
	/** [PUBLIC - Getters / Setters] **************************************************
	***********************************************************************************/ 
	
	/**
	 * Returns the current bright prop
	 */
	public function get bright():Number {
		return this._bright;
	}
	
	/**
	 * Sets the current bright prop
	 */
	public function set bright(value:Number):Void {
		
		var alpha:Number;
		var filter_alpha:Number;
		var strength:Number;
		var blur:Number;
		var multi:Number;
		
		alpha = Math.min(value * 2, 100);
		filter_alpha = (100 - (2 * Math.abs(50 - value)));
		strength = filter_alpha * this._strength / 100;
		blur = filter_alpha * this._blur / 100;
		
		multi = (value < 50) ? 255 : 255 - ((value - 50) / 50 * 255);
		
		this._filter.alpha = filter_alpha;
		this._filter.strength = strength;
		this._filter.blurX = this._blur;
		this._filter.blurY = this._blur;
		
		this._colorEfx.alphaMultiplier = alpha / 100;
		this._colorEfx.blueOffset = multi;
		this._colorEfx.redOffset = multi;
		this._colorEfx.greenOffset = multi;
		
		this._trans.colorTransform = this._colorEfx;
		
		this._target.filters = this._targetFilters.concat(this._filter);
		
		this._bright = value;
	}
	
	
	
	/** [efx fly] *********************************************************************
	***********************************************************************************/ 
	
	/**
	 * Makes a Bright fly
	 * 
	 * @param	start	Start value for the Egg transition
	 * @param	end	End value for the Egg transition
	 * @param	duration	Duration value for the Egg transition, in milleseconds
	 * @param	delay	Delay before start the Egg transition, in milleseconds
	 * @param	equation	Equation for the Egg transition
	 * @param	equationArgs	EquationArgs to be applied to the given Equation
	 * @param	forceInit	If TRUE, the start value is initialized imediatelly, even if the tween has a delay
	 * @return	The efx flight
	 */
	public function fly (start:Number , end:Number , duration:Number , delay:Number , equation:Function , equationArgs:Array , forceInit:Boolean):Flight {
		var flight : Flight;
		
		if (start != null) {
			this.bright = start;
		} else if (this.bright == null) {
			this.bright = 100;
		}
		
		flight = this._larva.fly("bright" , start , end , duration , delay , equation , equationArgs , forceInit );
		flight.addCompleteListener ( this.resetEfx, this );
		
		return flight;
	}
	
	/**
	 * resets the efx
	 */
	private function resetEfx () : Void {
		this._target.filters = this._targetFilters;
	}
}