package com.robertpenner.easing;

import dragonfly.core.health.Descriptor;

class Circ 
{
	public static function easeIn(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		return -c * (Math.sqrt( 1 - (t /= d) * t ) - 1) + b;
	}

	public static function easeOut(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		return c * Math.sqrt( 1 - (t = t / d - 1) * t ) + b;
	}

	public static function easeInOut(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		if ((t /= d / 2) < 1) return -c / 2 * (Math.sqrt( 1 - t * t ) - 1) + b;
		return c / 2 * (Math.sqrt( 1 - (t -= 2) * t ) + 1) + b;
	}
}