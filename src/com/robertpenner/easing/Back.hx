package com.robertpenner.easing;

import dragonfly.core.health.Descriptor;

class Back
{
	public static function easeIn(t : Float, b : Float, c : Float, d : Float, s : Float = 0 ) : Float 
	{
		Descriptor.describe();
		if ( s <= 0 ) s = 1.70158;
		return c * (t /= d) * t * ((s + 1) * t - s) + b;
	}

	public static function easeOut(t : Float, b : Float, c : Float, d : Float, s : Float = 0 ) : Float 
	{
		Descriptor.describe();
		if ( s <= 0 ) s = 1.70158;
		return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
	}

	public static function easeInOut(t : Float, b : Float, c : Float, d : Float, s : Float = 0 ) : Float 
	{
		Descriptor.describe();
		if ( s <= 0 ) s = 1.70158; 
		if ((t /= d / 2) < 1) return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b;
		return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b;
	}
}