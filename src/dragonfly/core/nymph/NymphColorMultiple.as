package dragonfly.core.nymph 
{
	import dragonfly.Dragonfly;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class NymphColorMultiple extends NymphColor
	{

		/**
		 * Get value with desired easing.
		 * @return The current tween color.
		 */
		override protected function get _value() : * 
		{
			var i : int;
			var output: Array; 
			
			output = [];
			for(; i < ( _start as Array ).length; i++ )
				if( Dragonfly.boost )
					output.push( _quantize( _start[ i ], _end[ i ] ) );
				else
					output.push( _compute( _start[ i ], _end[ i ] ) );
			
			return output;
		}
	}
}