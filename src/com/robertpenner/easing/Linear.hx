package com.robertpenner.easing;

import dragonfly.core.health.Descriptor;
		
class Linear 
{
	public static function easeNone(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		return c * t / d + b;
	}

	public static function easeIn(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		return c * t / d + b;
	}

	public static function easeOut(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		return c * t / d + b;
	}

	public static function easeInOut(t : Float, b : Float, c : Float, d : Float) : Float 
	{
		Descriptor.describe();
		return c * t / d + b;
	}
}