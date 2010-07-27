package cocktail.utils 
{

	
	
	/**
	 * Utilities for array manipulation.
	 * @author nybras | nybras@codeine.it
	 */
	public class ArrayUtil
	{
		/**
		 * Compares two arrays.
		 * @param array1	First array for comparison.
		 * @param array2	Second array for comparison.
		 * @return	<code>true</code> if both arrays are indentical or
		 * <code>false</code> otherwise.
		 */
		public static function compare(
			array1 : Array,
			 array2 : Array
		) : Boolean
		{
			var i : int;
			
			if ( array1.length != array2.length )
				return false;
			
			i = 0;
			do 
			{
				if ( array1[ i ] != array2[ i ] )
					return false;
			} while ( ++i < array1.length );
			
			return true;
		}

		/**
		 * Deletes some item of the given array.
		 * @param array	Array source.
		 * @param value	Value to searched and delted.
		 * @param prop	If informed, the value must be an object or something
		 * like that and the method compares the "prop" that must exist inside
		 * the given value instead of the value itself.
		 * @return	The same given array, for inline re-use.
		 */
		public static function del(
			array : Array,
			value : *,
			prop : * = null
		) : Array
		{
			var i : Number;
			
			for ( i = ( array.length - 1 ) ; i >= 0 ; i-- )
			{
				if ( prop != null )
				{
					if ( array[ i ][ prop ] == value  )
						array.splice( i, 1 );
				}
				else
				{
					if ( array[ i ] == value )
						array.splice( i, 1 );
				}
			}
			
			return array;
		}

		/**
		 * Search the given array for the given value/key.
		 * @param array	Array source.
		 * @param value	Value to searched.
		 * @param prop	If informed, the value must be an object or something
		 * like that and the method compares the "prop" that must exist inside
		 * the given value instead of the value itself.
		 * @return	The found item.
		 */
		public static function find(
			array : Array,
			value : *,
			 prop : * = null
		) : *
		{
			var i : Number;
			
			for ( i = ( array.length - 1 ) ; i >= 0 ; i-- )
			{
				if ( prop != null )
				{
					if ( array[ i ][ prop ] == value  )
						return array[ i ];
				}
				else
				{
					if ( array[ i ] == value )
						return array[ i ];
				}
			}
			
			return null;
		}

		/**
		 * Check if the array has some item or not.
		 * @param array	Array source.
		 * @param value		Value to be compared.
		 * @param prop	If informed, the value must be an object or something
		 * like that and the method compares the "prop" that must exist inside
		 * the given value instead of the value itself.
		 */
		public static function has(
			array : Array,
			value : *,
			prop : * = null
		) : Boolean
		{
			var item : *;
			
			for each ( item in array )
				if ( prop != null && item[ prop ] == value )
					return true;
				else if ( item == value )
					return true;
			
			return false;
		}

		/**
		 * Clones the given array and return it.
		 * @param array	Source array to be cloned
		 * @return	Cloned array.
		 */
		public static function clone( array : Array ) : Array
		{
			var item : *;
			var clone : Array = new Array;
			
			for each ( item in array )
				clone.push( item );
				
			return clone;
		}
	}
}