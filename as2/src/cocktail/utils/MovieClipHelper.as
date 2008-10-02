class cocktail.utils.MovieClipHelper {
	
	/**
	* Attaches the given clip into the given target and link it with the given class
	* 
	* @param	scope
	* @param	linkage
	* @param	name	movieClip name @ scope
	* @param	depth	depth @ scope to be attached
	* @param	extendClass	class to extend attached movie
	* @param	initobj
	* @return
	*/
	public static function attachMovie (scope:Object, linkage:String, name:String, depth:Number, extendClass:Function, initobj:Object):MovieClip {
		if (extendClass instanceof Function) {
			Object.registerClass(linkage, extendClass);
		}
		
		if (typeof(scope) != "movieclip") {
			trace('[MovieClipHelper.attachMovie] ERROR : scope (' + scope + ') is not a  movieclip');
		}
		
		depth = depth || scope.getNextHighestDepth()
		
		if (! name) {
			name = 'at_' + depth;
		}
		
		
		return scope.attachMovie(linkage, name, depth, initobj);
	}
	
	/**
	* Attaches the given linkage into the given scope with a unique name and link it with the given class
	* 
	* @param	linkage
	* @param	scope
	* @param	extendClass
	* @param	initObj
	* @return
	*/
	public static function attachMovieUniqueName (scope:MovieClip, linkage:String, extendClass:Function, initObj:Object, depth:Number):MovieClip {
		var name:String;
		
		if (typeof(scope) != "movieclip") {
			trace('[MovieClipHelper] ERROR: scope('+scope+') for element('+linkage+') isn\'t a movieclip');
		}
		
		depth = depth || scope.getNextHighestDepth() ;
		
		name = linkage.split(".").join("_") + "_at_" +depth;
		
		initObj._uniqueName = name;
		
		return MovieClipHelper.attachMovie(scope, linkage, name, depth, extendClass, initObj);
	}
	
	
	/**
	 * Create MovieClip extended class
	 * 
	 * 
	 * @param	scope
	 * @param	classRef
	 * @param	name
	 * @param	depth
	 * @param	initObj
	 * @return
	 */
	public static function createEmptyMovieClip(scope:Object, extendClass:Function, name:String, depth, initObj:Object):MovieClip {
		var mc:MovieClip;
		var prop:String;
		
		if (typeof(scope) != "movieclip") {
			trace('[MovieClipHelper] ERROR: scope(' + scope + ') is not movieclip');
		}
		
		if (! depth) {
			depth = scope.getNextHighestDepth();
		}
		
		if (! name) {
			name = 'empty_at_' + depth;
		}
		
		mc = scope.createEmptyMovieClip(name, depth);
		mc.__proto__ = extendClass.prototype;
		mc.constructor = extendClass;
		
		if(initObj) {
			for(prop in initObj) {
				mc[prop] = initObj[prop];
			}
		}
		
		extendClass.call(mc);
		
		return mc;
	}
}