import dragonfly.plugins.core.Conf;

/**
 * Configure values for BlurFilter effects.
 * @see dragonfly.plugins.larvas.lib.filters.values.BlurValues
 * @see dragonfly.plugins.larvas.lib.filters.eggs.BlurEgg
 * @see dragonfly.plugins.larvas.lib.filters.confs.Conf
 */
class dragonfly.plugins.larvas.lib.filters.confs.BlurConf extends Conf {

	// [ CONSTANTS - properties ] ********************************************/
	
	/**
	 * The number of times to perform the blur. Valid values are from 0-15. The default value is 1,
	 * which is equivalent to low quality. A value of 2 is medium quality. A value of 3 is high quality
	 * and approximates a Gaussian blur.
	 */
	public var QUALITY:Number;




	// [ CONSTRUCTOR ] *******************************************************/
		
	/**
	 * Create a BlurConf object.
	 * 
	 * @param quality The number of times to apply the filter. The default value is 1, which is equivalent to low quality. A value of 2 is medium quality, and a value of 3 is high quality and approximates a Gaussian blur.
	 */
	public function BlurConf (quality : Number) {
		this.QUALITY = quality;
	}
}