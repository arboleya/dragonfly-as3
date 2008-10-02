import cocktail.utils.Delegate;

class cocktail.utils.FunctionHelper {

	/**
	* Return a function that executes all function in a array
	* 
	* @param	functions
	* @return
	*/
	public static function join(functions:Array):Function{
		var joiner:Function;

		joiner = function(funcs){
			var i:Number;
			var func:Function;

			i = 0;
			for(; (func=funcs[i]) != undefined; i++) func();
		};

		return Delegate.create(joiner, null, [ functions ]);
	}

	/**
	 * Bridge one property to another, like a bind but from an object to other
	 * @param	source
	 * @param	source_prop
	 * @param	target
	 * @param	target_prop	If nothing is passed, will be the same as source_prop
	 * @return
	 */
	static function bridge (source : Object, source_prop : String, target : Object, target_prop : Object) : Boolean {
		target_prop = target_prop || source_prop;
		
		return source.watch(source_prop, function(prop, old_value, new_value, bridge_info) {
			var tgt;
			var tgt_prop;
			
			tgt = bridge_info[0];;
			tgt_prop = bridge_info[1];;
			
			tgt[tgt_prop] =  new_value;
			
			return new_value;
		}, [target, target_prop]);
	}
	
	/**
	* Return a function that will copy source properties to target obj (1x1)
	* 
	* @param	source
	* @param	target
	* @param	overwrite
	* @return
	*/
	public static function copyObj(source:Object, target:Object, overwrite:Boolean):Function{
		var initializer:Function;

		overwrite = overwrite !== false;

		initializer = function(props:Object){
			var prop:String;

			for(prop in props){
				if( prop == '__remove__' ){
					switch(typeof(this)){
						case 'movieclip':
							prop = 'removeMovieClip';
						break;
						default:
							prop = 'removeTextField';
					}
				}
				
				if( typeof(this[prop]) != "function" ){
					this[prop] =  ((this[prop] !== undefined && overwrite) || this[prop] === undefined) ? props[prop] : this[prop];
				} else {
					this[prop].apply(this, [].concat(props[prop]));
				}
			}

		};

		return Delegate.create(initializer, target, source);
	}

	/**
	* Return a function that will copy properties to target obj(s) (1x1|1xN)
	* 
	* @param	props
	* @param	items
	* @param	overwrite
	* @return
	*/
	public static function copyProps(props, items, overwrite:Boolean):Function{
		var propsToFunctions:Array;
		var i:Number;

		items = [].concat(items);

		propsToFunctions = new Array();

		for (i = 0; i < items.length ; i++){
			propsToFunctions.push(FunctionHelper.copyObj((props instanceof Array) ? props[i] : props, items[i], overwrite));
		}

		return FunctionHelper.join(propsToFunctions);
	}

	/**
	* Return obj if def is not defined otherwise returns def
	* 
	* @param	def
	* @param	obj
	*/
	public static function gd(def:Object, obj:Object){
		return ( (def === undefined) ? obj : def);
	}
}