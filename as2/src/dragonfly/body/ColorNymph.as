import dragonfly.body.Converter;
import dragonfly.body.Nymph;

/**
 * Color nymph class is who do hexadecimal color tweens
 * 
 * @author nybras | nybras@codeine.it
 * @author henrique | henrique@codeine.it
 * @see Nymph 
 */
class dragonfly.body.ColorNymph extends Nymph {
	
	/**
	 * Create a ColorNymph object. Pretty the same, the unique diff is the hex calculation.
	 * 
	 * @param start
	 * @param end
	 * @param duration
	 * @param equation
	 * @param colorMode
	 * @param EggListener
	 * @param equationArgs
	 * @param fps
	 */
	public function ColorNymph (start : Object, end : Object, duration : Number, delay : Number, equation : Function, equationArgs : Array, fps : Number, useFrames : Boolean) {
		super(start, end, duration, delay, equation, equationArgs, fps, useFrames);
	}

	/**
	 * @private
	 * Get hex value with desired easing
	 * 
	 * @param timer The current tween timer.
	 * @param start Start color.
	 * @param end End Color.
	 * 
	 * @return The current tween color.
	 */
	private function getValue(timer : Number, start : Number, end : Number) : Number {
		var i:String;
		var rgb_values:Array;
		var rgb_start:Array;
		var rgb_end:Array;
		
		rgb_start = Converter.hex2rgb(start);
		rgb_end = Converter.hex2rgb(end);
		rgb_values = [];
		
		for (i in rgb_start) {
			rgb_values.unshift(super.getValue(timer, rgb_start[i], rgb_end[i]));
		}
		
		return Converter.rgb2hex(rgb_values);
	}
}