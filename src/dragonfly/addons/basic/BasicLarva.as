package dragonfly.addons.basic 
{
	import dragonfly.addons.basic.lib.eggs.BasicEgg;
	import dragonfly.core.Larva;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BasicLarva extends Larva 
	{
		public function BasicLarva( target : * )
		{
			super( target );
		}

		/* XYZ */
		public function x(
			end : Number,
			start : Number = undefined
		) : BasicLarva
		{
			_lay( BasicEgg, BasicEgg.X, end, start );
			return this;
		}

		public function y(
			end : Number,
			start : Number = undefined
		) : BasicLarva
		{
			_lay( BasicEgg, BasicEgg.Y, end, start );
			return this;
		}
		
		public function xy(
			end_x : Number,
			end_y : Number,
			start_x : Number = undefined,
			start_y : Number = undefined
		) : BasicLarva
		{
			x( end_x, start_x );
			y( end_y, start_y );
			return this;
		}
		public function z(
			end : Number,
			start : Number = undefined
		) : BasicLarva
		{
			_lay( BasicEgg, BasicEgg.Z, end, start );
			return this;
		}
		
		/* ALPHA */
		public function alpha(
			end : Number,
			start : Number = undefined
		) : BasicLarva
		{
			_lay( BasicEgg, BasicEgg.ALPHA, end, start );
			return this;
		}

		/* SCALE */
		public function xscale(
			end : Number,
			start : Number = undefined
		) : BasicLarva
		{
			_lay( BasicEgg, BasicEgg.XSCALE, end, start );
			return this;
		}

		public function yscale(
			end : Number,
			start : Number = undefined
		) : BasicLarva
		{
			_lay( BasicEgg, BasicEgg.YSCALE, end, start );
			return this;
		}
		
		public function zscale(
			end : Number,
			start : Number = undefined
		) : BasicLarva
		{
			_lay( BasicEgg, BasicEgg.ZSCALE, end, start );
			return this;
		}

		public function xyscale(
			end_x : Number,
			end_y : Number,
			start_x : Number = undefined,
			start_y : Number = undefined
		) : BasicLarva
		{
			xscale( end_x, start_x );
			yscale( end_y, start_y );
			return this;
		}

		/* ROTATION */
		public function rotation(
			end : Number,
			start : Number = undefined
		) : BasicLarva
		{
			_lay( BasicEgg, BasicEgg.ROTATION, end, start );
			return this;
		}
	}
}