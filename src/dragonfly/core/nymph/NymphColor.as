package dragonfly.core.nymph 
{

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class NymphColor extends Nymph
	{
		override protected function _calculate( start : *, end : * ) : *
		{
			var i : int;
			var values : Array;
			
			start = hex2rgb( start );
			end = hex2rgb( end );
			
			values = [];
			while( i < 3 )
				values.push( super._calculate( start[ i ], end[ i++ ] ) );
			
			start = rgb2hex( values );
			return start;
		}
		
		override protected function _quantize( start : *, end : * ) : * 
		{
			var i : int;
			var values : Array;
			
			start = hex2rgb( start );
			end = hex2rgb( end );
			
			values = [];
			while( i < 3 )
				values.push( super._quantize( start[ i ], end[ i++ ] ) );
			
			start = rgb2hex( values );
			return start;
		}
		
		
		
		/**
		 * Conversion functions (for hexa/color tweening).
		 * @param rgb Array with the RGB (3 indexes: 0=R, 1=G, 2=B) to be converted.
		 * @return RGB into HEXADECIMAL.
		 */
		public static function rgb2hex(rgb : Array) : Number 
		{
			return (rgb[0] << 16 | rgb[1] << 8 | rgb[2]);
		}

		/**
		 * Conversion functions (for hexa/color tweening).
		 * @param hex The hexadecimal to be converted.
		 * @return HEXADECIMAL INTRO RGB (array with 3 indexes: 0=R, 1=G, 2=B).
		 */
		public static function hex2rgb(hex : Number) : Array 
		{
			return new Array( (hex >> 16), (hex >> 8 & 0xff), (hex & 0xff) );
		}
	}
}