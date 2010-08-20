package dragonfly.core.health;

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

import flash.utils.TypedDictionary;

/**
 * @author nybras | nybras@codeine.it
 */
class Vitamin
{
	private static inline var _EQUATIONS : Array<Dynamic> = [
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
	];
	
	private static inline var _TYPES : Array<String> = [
		"easeIn", "easeOut", "easeInOut"
	];
	
	public static var VITAMINS : TypedDictionary<Dynamic,Array<Float>>;
	
	public static function load( steps : Float = 100 ) : Void
	{
		var klass : Dynamic;
		var equation : Dynamic;
		var type : String;
		var time : Int;
		var value : String;
		var params : Array<Dynamic>;
		var computed : Array<Float>;
		var index : Int;
		
		VITAMINS = new TypedDictionary();
		
		for( klass in _EQUATIONS )
		{
			for( type in _TYPES )
			{
				time = 0;
				computed = [];
				equation = Reflect.field( klass, type );
				
				while( time < steps )
				{
					params = [ time++, 0, 1, steps - 1 ];
					value = Reflect.callMethod( klass, equation, params );
					
					if( ( index  = value.indexOf( "." ) ) >= 0 )
						value = value.substr( 0, index + 4 );
					
					computed.push( Std.parseFloat( value ) );
				}
				
				VITAMINS.set( equation, computed );
			}
		}
	}
	
	public static function drop( equation : Dynamic ) : Array<Float>
	{
		return VITAMINS.get( equation );
	}
}