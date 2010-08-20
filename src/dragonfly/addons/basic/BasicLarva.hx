package dragonfly.addons.basic;

import dragonfly.core.Larva;

import dragonfly.addons.basic.lib.eggs.BasicEgg;

/**
 * @author nybras | nybras@codeine.it
 */
class BasicLarva extends Larva
{
	public function new( target : Dynamic )
	{
		super( target );
	}

	/* XYZ */
	public function x(
		end : Float,
		?start : Float 
	) : BasicLarva
	{
		_lay( BasicEgg, BasicEgg.X, end, start );
		return this;
	}

	public function y(
		end : Float,
		?start : Float 
	) : BasicLarva
	{
		_lay( BasicEgg, BasicEgg.Y, end, start );
		return this;
	}

	public function xy(
		end_x : Float,
		end_y : Float,
		?start_x : Float ,
		?start_y : Float 
	) : BasicLarva
	{
		x( end_x, start_x );
		y( end_y, start_y );
		return this;
	}

	public function z(
		end : Float,
		?start : Float 
	) : BasicLarva
	{
		_lay( BasicEgg, BasicEgg.Z, end, start );
		return this;
	}

	/* ALPHA */
	public function alpha(
		end : Float,
		?start : Float 
	) : BasicLarva
	{
		_lay( BasicEgg, BasicEgg.ALPHA, end, start );
		return this;
	}

	/* SCALE */
	public function xscale(
		end : Float,
		?start : Float 
	) : BasicLarva
	{
		_lay( BasicEgg, BasicEgg.XSCALE, end, start );
		return this;
	}

	public function yscale(
		end : Float,
		?start : Float 
	) : BasicLarva
	{
		_lay( BasicEgg, BasicEgg.YSCALE, end, start );
		return this;
	}

	public function zscale(
		end : Float,
		?start : Float 
	) : BasicLarva
	{
		_lay( BasicEgg, BasicEgg.ZSCALE, end, start );
		return this;
	}

	public function xyscale(
		end_x : Float,
		end_y : Float,
		?start_x : Float ,
		?start_y : Float 
	) : BasicLarva
	{
		xscale( end_x, start_x );
		yscale( end_y, start_y );
		return this;
	}

	/* ROTATION */
	public function rotation(
		end : Float,
		?start : Float 
	) : BasicLarva
	{
		_lay( BasicEgg, BasicEgg.ROTATION, end, start );
		return this;
	}
}