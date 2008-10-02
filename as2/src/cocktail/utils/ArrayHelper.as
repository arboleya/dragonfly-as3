
class cocktail.utils.ArrayHelper {
	
	/**
	* Return true if array contains value otherwise returns false
	* @param	value
	* @param	array
	* @return
	*/
	public static function contains(value:Object, array:Array, attribute:String):Boolean {
		return Boolean(ArrayHelper.indexOf(value, array, attribute)+1);
	}

	/**
	* return how many times value occurs in array
	* @param	value
	* @param	array
	* @param	attribute
	* @return
	*/
	public static function count(value:Object, array:Array, attribute:String):Number {
		var c:Number;
		var o:Number;

		o = 0;
		c = 0;
		while(( o = ArrayHelper.indexOf(value, array, attribute, o)) != undefined){
			c++;
			o++;
		}

		return c;
	}

	/**
	* remove value from array
	* @param	value
	* @param	array
	* @return	removed iitem
	*/
	public static function remove(value:Object, array:Array, attribute:String):Object {
		var i:Number;
		var removed:Object;

		while((i = ArrayHelper.indexOf(value, array, attribute)) != undefined) {
			array.splice(i, 1);
			removed = value;
		}

		return removed;
	}

	/**
	* Return index of value in array, if not found return -1
	* @param	value
	* @param	array
	* @return
	*/
	public static function indexOf(value:Object, array:Array, attribute:String, offset:Number):Number {
		var i:Number;
		var len:Number;
		var row:Object;

		if(!array.length) return -1;

		i = offset || 0;
		len = array.length;

		for(; i<len ; i++){
			row = array[i];
			
			if(attribute) {
				if( typeof(row[attribute]) != "function" ){
					row = row[attribute];
				} else {
					row = row[attribute]();
				}
			}
				
			if(row === value){
				return i;
			}
		}

		return -1;
	}

	/**
	* Return last index of value in array, if not found return -1
	* @param	value
	* @param	array
	* @return
	*/
	public static function lastIndexOf(value:Object, array:Array, attribute:String):Number {
		var i:Number;
		var row:Object;

		if(!array.length) return -1;

		i = array.length;
		while(i--) {
			row = array[i];
			
			if(attribute) {
				if( typeof(row[attribute]) != "function" ){
					row = row[attribute];
				} else {
					row = row[attribute]();
				}
			}
			
			if(row === value) {
				return i;
			}
		}
		
		return -1;
	}

	/**
	* Find the first index of the object on array and returns it
	* @param	value
	* @param	array
	* @param	attribute
	* @return
	*/
	public static function find (value:Object, array:Array, attribute:String):Object {
		return array[ArrayHelper.indexOf(value, array, attribute)];
	}
	
	/**
	* Exec conditions passing each item as first parameter, return all itens that returned true
	* @param	value
	* @param	array
	* @param	attribute
	* @return
	*/
	public static function findAll (array:Array, conditions:Function):Array {
		var i:Number;
		var len:Number;
		var row:Object;
		var found:Array;
		
		if(!array.length) return undefined;
		
		i = 0;
		len = array.length;
		found = new Array();
		
		for(; i<len ; i++) {
			row = array[i];
			
			if(conditions(row)){
				found.push(row);
			}
		}
		
		return found;
	}
	
	/**
	* 
	* @param	array
	* @return	sum of all number indexes
	*/
	public static function sum(array:Array, attribute:String, start : Number, end : Number ):Number {
		var value:Number;
		var sum:Number;

		if(!array.length) return undefined;
		
		sum = 0;
		
		start = (start == undefined ? 0 : start);
		end = (end == undefined ? array.length : end);
		
		
		for( ; start < end ; start++) {
			value = attribute ? array[start][attribute] : array[start];
			sum += isNaN(value) ? 0 : value;
		}

		return sum;
	}

	public static function joinAttribute(array:Array, attribute:String):Array {
		var i:Number;
		var len:Number;
		var row:Object;
		var result:Array;

		if(!array.length) return undefined;

		i = 0;
		len = array.length;
		result = new Array();

		for(; i<len ; i++){
			row = attribute ? array[i][attribute] : array[i];
			result.push(row);
		}

		return result;
	}
	/**
	* 
	* @param	array
	* @param	attribute attribute where get value
	* @return	the maximun value that array contains
	*/
	public static function max(array:Array, attribute:String):Number {
		var i:Number;
		var num:Number;
		var value:Number;

		if(!array.length) return undefined;

		i = array.length;
		num = array[0];
		while(i-- > 0) {
		//TODO: test line below, updated in taxi
		//while(--i) {
			value = attribute ? array[i][attribute] : array[i];
			if(isNaN(value)) continue;
			num = (num > value) ? num : value;
		}

		return num;
	}

	/**
	* 
	* @param	array
	* @param	inAttribute attribute where get value
	* @return	the minimun value that array contains
	*/
	public static function min(array:Array, attribute:String):Number {
		var i:Number;
		var value:Number;
		var num:Number;

		if(!array.length) return undefined;

		i = array.length;
		num = array[0];
		while(i-- > 0) {
			value = attribute ? array[i][attribute] : array[i];
			if(isNaN(value)) continue;
			num = (num < value) ? num : value;
		}

		return num;
	}

	/**
	 * Shuffles the passed-in <code>array</code>.
	 * @param array array to shuffle
	 */
	public static function shuffle(array:Array):Array {
		var len:Number = array.length; 
		var rand:Number;
		var temp:Object;
		
		for (var i:Number = len-1; i >= 0; i--){ 
			rand = Math.floor(Math.random ()*len); 
			temp = array[i]; 
			array[i] = array[rand]; 
			array[rand] = temp; 
		} 

		return array;
	}
}