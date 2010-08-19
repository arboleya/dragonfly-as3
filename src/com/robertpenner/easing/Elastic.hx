package com.robertpenner.easing;

class Elastic 
{
	public static function easeIn(t : Float, b : Float, c : Float, d : Float, a : Float = null, p : Float = 0 ) : Float 
	{
		var s : Dynamic;
		if (t == 0) return b;  
		if ((t /= d) == 1) return b + c;  
		if ( p <= 0 ) p = d * .3;
		if ( a <= 0 || a < Math.abs( c )) 
		{ 
			a = c; 
			s = p / 4; 
		}
		else s = p / (2 * Math.PI) * Math.asin( c / a );
		return -(a * Math.pow( 2, 10 * (t -= 1) ) * Math.sin( (t * d - s) * (2 * Math.PI) / p )) + b;
	}

	public static function easeOut(t : Float, b : Float, c : Float, d : Float, a : Float = 0 , p : Float = 0 ) : Float 
	{
		var s : Dynamic;
		if (t == 0) return b;  
		if ((t /= d) == 1) return b + c;  
		if ( p <= 0 ) p = d * .3;
		if ( a <= 0 || a < Math.abs( c )) 
		{ 
			a = c; 
			s = p / 4; 
		}
		else s = p / (2 * Math.PI) * Math.asin( c / a );
		return (a * Math.pow( 2, -10 * t ) * Math.sin( (t * d - s) * (2 * Math.PI) / p ) + c + b);
	}

	public static function easeInOut(t : Float, b : Float, c : Float, d : Float, a : Float = 0 , p : Float = 0 ) : Float 
	{
		var s : Dynamic;
		if (t == 0) return b;  
		if ((t /= d / 2) == 2) return b + c;  
		if ( p <= 0 ) p = d * (.3 * 1.5);
		if ( a <= 0 || a < Math.abs( c )) 
		{ 
			a = c; 
			s = p / 4; 
		}
		else s = p / (2 * Math.PI) * Math.asin( c / a );
		if (t < 1) return -.5 * (a * Math.pow( 2, 10 * (t -= 1) ) * Math.sin( (t * d - s) * (2 * Math.PI) / p )) + b;
		return a * Math.pow( 2, -10 * (t -= 1) ) * Math.sin( (t * d - s) * (2 * Math.PI) / p ) * .5 + c + b;
	}
}