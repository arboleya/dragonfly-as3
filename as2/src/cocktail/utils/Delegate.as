import cocktail.utils.SetTimeout;

class cocktail.utils.Delegate {
	
	/**
	 * Return a function delegated to desired scope passing desired args.
	 * @param	func	reference to function you will exec.
	 * @param	scope	scope that you want exec
	 * @param	args	arguments that you want pass
	 * @param	delay	delay you want before calling all that shit
	 * @return
	 */
	public static function create (func:Function, scope:Object, args:Object, delay:Number):Function {
		var tmp:Function;
		
		tmp = function () {
			var self:Function = arguments.callee;
			
			if (self.delay) {
				return new SetTimeout(self.func, self.delay, self.scope, self.args.concat(arguments));
			}
			
			return self.func.apply(self.scope, self.args.concat(arguments));
		};
		tmp.func = func;
		tmp.scope = scope;
		tmp.delay = delay;
		tmp.args = [].concat((args == undefined ? [] : args));
		
		return tmp;
	}
	
}