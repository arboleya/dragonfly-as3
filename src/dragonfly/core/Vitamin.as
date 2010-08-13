package dragonfly.core 
{
	import com.robertpenner.easing.Back;
	import com.robertpenner.easing.Bounce;
	import com.robertpenner.easing.Circ;
	import com.robertpenner.easing.Cubic;
	import com.robertpenner.easing.Elastic;
	import com.robertpenner.easing.Expo;
	import com.robertpenner.easing.Linear;
	import com.robertpenner.easing.Quad;
	import com.robertpenner.easing.Quart;
	import com.robertpenner.easing.Quint;
	import com.robertpenner.easing.Sine;

	import flash.utils.Dictionary;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Vitamin
	{
		public static var VITAMINS : Dictionary;
		
		{
			load( 100 );
		}
		
		public static function load( steps : Number = 100 ) : void
		{
			var klass : Class;
			var equation : Function;
			var type : String;
			var time : int;
			var value : String;
			var params : Array;
			var computed : Array;
			var decimal_stripper : RegExp;
			
			VITAMINS = new Dictionary( );
			decimal_stripper = /[0-9]+(\.*)[0-9]{0,3}/;
			
			for each( klass in [
				Back,
				Bounce,
				Circ,
				Cubic,
				Elastic,
				Expo,
				Linear,
				Quad,
				Quart,
				Quint,
				Sine
			])
			{
				for each( type in [ "easeIn", "easeOut", "easeInOut" ])
				{
					time = 0;
					computed = [];
					equation = klass[ type ];
					
					while( time < steps )
					{
						params = [ time++, 0, 1, steps ];
						value = equation.apply( equation.prototype, params );
						computed.push( value.match( decimal_stripper )[0] );
					}
					
					VITAMINS[ equation ] = computed;
				}
			}
		}
		
		public static function drop( equation : Function ) : Array
		{
			return VITAMINS[ equation ];
		}
	}
}