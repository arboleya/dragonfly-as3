package com.robertpenner.easing;

import dragonfly.core.health.Descriptor;

class Quad 
{
	public static function easeIn(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		return c * (t /= d) * t + b;
	}

	public static function easeOut(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		return -c * (t /= d) * (t - 2) + b;
	}

	public static function easeInOut(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		if ((t /= d / 2) < 1) return c / 2 * t * t + b;
		return -c / 2 * ((--t) * (t - 2) - 1) + b;
	}
}