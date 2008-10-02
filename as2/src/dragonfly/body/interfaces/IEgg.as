/**
 * IEgg defines core methods of Egg values operation.
 */
interface dragonfly.body.interfaces.IEgg {
	
	/**
	 * This method usually don't need to be overwriten by childs classes
	 * in case you need to make a different use of some prop/value, try to call
	 * the super-method with the same arguments before, so the queue execution
	 * won't get broken.
	 * @param start	Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit If TRUE, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the 'setInterval' mode (default value is 30).
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used, otherwise (<code>false</code>) 'setInterval' mode is used.
	 */
	public function shoke (start:Object, end:Object, duration:Number, delay:Number, equation:Function, equationArgs:Array, forceInit:Boolean, fps:Number, useFrames:Boolean):Void;
	
	/**
	 * These methods MUST to be overwriten by childs classes, it's obrigatory
	 * jusr because it can be such specific for each egg you create. That way,
	 * you can easilly create any kind of Egg you need... in other words: freedom.
	 * 
	 * Check the existent eggs as examples to fill these two methods, take a breath,
	 * and follow your intuition.
	 */
	public function getValue ():Object;
	public function setValue (value:Object):Void;
}