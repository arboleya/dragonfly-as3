import dragonfly.body.Efx;
import dragonfly.body.Nymph;
import dragonfly.body.events.NymphEvent;
import dragonfly.plugins.efx.lib.colorhsb.ColorHsbValues;

import flash.filters.ColorMatrixFilter;


/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.efx.ColorHsbEfx extends Efx {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	private var target:MovieClip;
	private var currentFilters:Array;
	private var filter:ColorMatrixFilter;
	
	private var initArray : Array;
	private var endArray : Array;
	
	private var nymph:Nymph;
	private var values : ColorHsbValues;
	
	private var IDENTITY:Array = [
		1, 0, 0, 0, 0,
		0, 1, 0, 0, 0,
		0, 0, 1, 0, 0,
		0, 0, 0, 1, 0
	];
	
	private var RLUM:Number = 0.212671;
	private var GLUM:Number = 0.715160;
	private var BLUM:Number = 0.072169;
	
	private var currentValues : ColorHsbValues;
	
	// TODO: implement these performance improvements
	//private var useHue : Boolean;
	//private var useSaturation : Boolean;
	//private var useContrast : Boolean;
	//private var useBrightness : Boolean;
	
	
	
	
	
	/** [PUBLIC - Constructor] ********************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 * 
	 * @param	target		Movieclip you want to apply the EFX
	 */
	public function ColorHsbEfx(target:MovieClip) {
		this.target = target;
		this.init();
	}
	
	
	
	
	
	/** [PRIVATE - init and all calcules] *********************************************
	***********************************************************************************/ 
	
	
	/**
	 * Starts the EFX
	 */
	private function init():Void {
		this.initArray = [0, 0, 0, 0];
		this.endArray = [0, 0, 0, 0];
		
		//this.useHue = false;
		//this.useSaturation = false;
		//this.useContrast = false;
		//this.useBrightness = false;
		
		this.filter = new ColorMatrixFilter(this.IDENTITY);
		this.currentFilters = this.target.filters;
		this.currentValues = new ColorHsbValues();
	}
	
	
	
	/**
	 * Apply all variables and calculate the result array
	 * @see start / end for params info
	 * @return	the calculated matrix array
	 */
	private function calculate(hue:Number, saturation:Number, contrast:Number, brightness:Number):Array {
		var arr:Array;
		
		arr = this.IDENTITY;
		//if( this.useHue ) arr = this.applyHue(hue, arr);
		//if( this.useSaturation ) arr = this.applySaturation(saturation, arr);
		//if( this.useContrast ) arr = this.applyContrast(contrast, arr);
		//if( this.useBrightness ) arr = this.applyBrightness(brightness, arr);
		
		arr = this.applyHue(hue, arr);
		arr = this.applySaturation(saturation, arr);
		arr = this.applyContrast(contrast, arr);
		arr = this.applyBrightness(brightness, arr);
		
		return arr;
	}
	
	
	
	/**
	 * Apply hue to the array
	 * @param	value	amount of hue to be added
	 * @param	source	current matrix array
	 * @return	the new array to be used as the matrix
	 */
	private function applyHue(value:Number, source:Array):Array {
		var angle:Number;
		var c:Number;
		var s:Number;
		
		var fr:Number;
		var fg:Number;
		var fb:Number;
		
		var result:Array;
		
		value = value || 0;
		angle = value * Math.PI / 180;
		c = Math.cos(angle);
		s = Math.sin(angle);
		
		fr = this.RLUM;
		fg = this.GLUM;
		fb = this.BLUM;
		
		result = [
			(fr + (c * (1 - fr))) + (s * ( -fr)), (fg + (c * ( -fg))) + (s * ( -fg)), (fb + (c * ( -fb))) + (s * (1 - fb)), 0, 0,
			(fr + (c * ( -fr))) + (s * 0.143), (fg + (c * (1 - fg))) + (s * 0.14), (fb + (c * ( -fb))) + (s * -0.283), 0, 0,
			(fr + (c * ( -fr))) + (s * ( -(1 - fr))), (fg + (c * ( -fg))) + (s * fg), (fb + (c * (1 - fb))) + (s * fb), 0, 0,
			0, 0, 0, 1, 0,
			0, 0, 0, 0, 1
		];
		
		return this.blend(result, source);
	}
	
	
	
	/**
	 * Apply saturation to the array
	 * @param	value	amount of saturation to be added
	 * @param	source	current matrix array
	 * @return	the new array to be used as the matrix
	 */
	private function applySaturation(value:Number, source:Array):Array {
		var r:Number;
		var g:Number;
		var b:Number;
		var ivalue:Number;
		var result:Array;
		
		value = value / 100 + 1;
		ivalue = 1 - value;
		
		r = ivalue * this.RLUM;
		g = ivalue * this.GLUM;
		b = ivalue * this.BLUM;
		
		result = [
			r + value, g, b, 0, 0,
			r, g + value, b, 0, 0,
			r, g, b + value, 0, 0,
			0, 0, 0, 1, 0
		];
		
		return this.blend(result, source);
	}
	
	
	
	/**
	 * Apply contrast to the array
	 * @param	value	amount of contrast to be added
	 * @param	source	current matrix array
	 * @return	the new array to be used as the matrix
	 */
	private function applyContrast(value:Number, source:Array):Array {
		var result:Array;
		var v:Number;
		
		v = value / 100 + 1;
		
		result =  [
			v, 0, 0, 0, 128 * (1 - v),
			0, v, 0, 0, 128 * (1 - v),
			0, 0, v, 0, 128 * (1 - v),
			0, 0, 0, 1, 0
		];
		
		return this.blend(result, source);
	}
	
	
	/**
	 * Apply brightness to the array
	 * @param	value	amount of contrast to be added
	 * @param	source	current matrix array
	 * @return	the new array to be used as the matrix
	 */
	private function applyBrightness(value:Number, source:Array):Array {
		var result:Array;
		var v:Number;
		
		v = value / 100 * 255;
		
		result = [
			1, 0, 0, 0, v,
			0, 1, 0, 0, v ,
			0, 0, 1, 0, v ,
			0, 0, 0, 1, 0
		];
		
		return this.blend(result, source);
	}
	
	
	/**
	 * Mix the current array (source) with the generated array
	 * @param	newvalues	the generated array
	 * @param	source	the current array
	 * @return	the new array to be used as matrix
	 */
	private function blend(newvalues:Array, source:Array):Array {
		var result:Array;
		
		var x:Number;
		var y:Number;
		var i:Number;
		
		result = [];
		
		i = 0;
		for (y = 0; y < 4; y++) {
			for (x = 0; x < 5; x++ ) {
				result[i + x] =	newvalues[i] 		*	source[x] + 
								newvalues[i + 1] 	*	source[x + 5] + 
								newvalues[i + 2] 	*	source[x + 10] + 
								newvalues[i + 3] 	*	source[x + 15] +
								(x == 4 ? newvalues[i + 4] : 0);
			}
			
			i += 5;
		}
		
		return result;
	}
	
	
	
	
	
	/** [PRIVATE - handles nymph evs] **********************************************
	***********************************************************************************/ 
	
	/**
	 * Listen NYNPH.START
	 * @param	event	nymph event
	 */
	private function nymph_onStart( event : NymphEvent ) : Void {
		this.dispatchEvent( event );
	}
	
	/**
	 * Listen NYNPH.UPDATE
	 * @param	event	nymph event
	 */
	private function nymph_onUpdate( event : NymphEvent ):Void {
		var data:Array;
		
		data = [].concat(event.data);
		
		this.initArray = data;
		this.filter.matrix = this.calculate(data[0], data[1], data[2], data[3] );
		this.currentValues = new ColorHsbValues( data[0], data[1], data[2], data[3] );
		this.target.filters = this.currentFilters.concat( this.filter );
		this.dispatchEvent( event );
	}
	
	/**
	 * Listen NYNPH.COMPLETE
	 * @param	event	nymph event
	 */
	private function nymph_onComplete(event : NymphEvent):Void {
		this.dispatchEvent( event );
	}
	
	
	
	
	
	/** [PUBLIC - start, end and fly methods] *****************************************
	***********************************************************************************/ 
	
	/**
	 * Makes a ColorPropertiesEfx fly
	 * 
	 * @param	start	Start value for the Egg transition.
	 * @param	end	End value for the Egg transition.
	 * @param	duration	Duration value for the Egg transition, in milleseconds
	 * @param	delay	Delay before start the Egg transition, in milleseconds
	 * @param	equation	Equation for the Egg transition
	 * @param	equationArgs	EquationArgs to be applied to the given Equation
	 * @return	The efx flight
	 */
	public function morph ( start : ColorHsbValues, end : ColorHsbValues, duration:Number, delay:Number, equation:Function, equationArgs:Array ) : Void {
		start = start || this.currentValues;
		end = end || this.currentValues;
		
		this.nymph = new Nymph( start.values, end.values, duration, delay, equation, equationArgs);
		this.nymph.addEventListener(NymphEvent.START, this.nymph_onStart, this);
		this.nymph.addEventListener(NymphEvent.UPDATE, this.nymph_onUpdate, this);
		this.nymph.addEventListener(NymphEvent.COMPLETE, this.nymph_onComplete, this);
	}
}