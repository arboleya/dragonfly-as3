import dragonfly.plugins.core.Conf;

import flash.display.BitmapData;
import flash.geom.Point;

/**
 * Configure values for DisplacementMap effects.
 * 
 * @author nybras | nybras@codeine.it
 * @see dragonfly.plugins.larvas.lib.filters.values.DisplacementMapValues
 * @see dragonfly.plugins.larvas.lib.filters.eggs.DisplacementMapEgg
 * @see dragonfly.plugins.larvas.lib.filters.confs.Conf
 */
class dragonfly.plugins.larvas.lib.filters.confs.DisplacementMapConf extends Conf {
	
	// [ PROPERTIES ] ********************************************************/
	
	/**
	 * Describes which color channel to use in the map image to displace the x result.
	 * Possible values are 1 (red), 2 (green), 4 (blue), and 8 (alpha).
	 */
	public var COMPONENT_X:Number;
	
	/**
	 * Describes which color channel to use in the map image to displace the y result.
	 * Possible values are 1 (red), 2 (green), 4 (blue), and 8 (alpha).
	 */
	public var COMPONENT_Y:Number;
	
	/**
	 * The mapBitmap property cannot be changed by directly modifying its value.
	 * Instead, you must get a reference to mapBitmap, make the change to the reference,
	 * and then set mapBitmap to the reference.
	 */
	public var MAP_BITMAP:BitmapData;
	
	/**
	 * A flash.geom.Point value that contains the offset of the upper-left corner of the target
	 * movie clip from the upper-left corner of the map image.<br><br>The mapPoint property cannot be changed
	 * by directly modifying its value. Instead, you must get a reference to mapPoint, make the change to
	 * the reference, and then set mapPoint to the reference.
	 */
	public var MAP_POINT:Point;
	
	/**
	 * Specifies what color to use for out-of-bounds displacements. The valid range of displacements
	 * is 0.0 to 1.0. Values are in hexadecimal format. The default value for color is 0.
	 * Use this property if the mode property is set to 3, COLOR.
	 */
	public var COLOR:Number;
	
	/**
	 * Specifies the alpha transparency value to use for out-of-bounds displacements.
	 * This is specified as a normalized value from 0.0 to 1.0. For example, 0.25 sets
	 * a transparency value of 25%. The default is 0. Use this property if the mode property
	 * is set to 3, COLOR.
	 */
	public var ALPHA:Number;
	
	/**
	 * The mode for the filter. Possible values are the following:
	 * <ul type="circle">
	 * <li>"wrap": Wraps the displacement value to the other side of the source image.
	 * This is the default value.</li> 
	 * <li>"clamp": Clamps the displacement value to the edge of the source image.</li>
	 * <li>"ignore": If the displacement value is out of range, ignores the displacement
	 * and uses the source pixel.</li> 
	 * <li>"color": If the displacement value is outside the image, substitutes a pixel value composed of the
	 * alpha and color properties of the filter.</li>
	 * </ul>
	 */
	public var MODE:String;
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a DisplacementMapConf object.
	 * 
	 * @param componentX	Describes which color channel to use in the map image to displace the x result. Possible values are the following: 1 (red), 2 (green), 4 (blue), 8 (alpha).
	 * @param componentY	Describes which color channel to use in the map image to displace the y result. Possible values are the following: 1 (red), 2 (green), 4 (blue), 8 (alpha).
	 * @param mapBitmap	A BitmapData object containing the displacement map data.
	 * @param mapPoint	A flash.geom.Point value that contains the offset of the upper-left corner of the target movie clip from the upper-left corner of the map image.
	 * @param color Specifies the color to use for out-of-bounds displacements. The valid range of displacements is 0.0 to 1.0. Use this parameter if mode is set to "color".
	 * @param alpha Specifies what alpha value to use for out-of-bounds displacements. This is specified as a normalized value from 0.0 to 1.0. For example, .25 sets a transparency value of 25%. The default is 0. Use this parameter if mode is set to "color".
	 * @param mode The mode of the filter. Possible values are the following: 
	 * <ul type="circle">
	 * <li>"wrap": Wraps the displacement value to the other side of the source image. This is the default value.</li> 
	 * <li>"clamp": Clamps the displacement value to the edge of the source image.</li>
	 * <li>"ignore": If the displacement value is out of range, ignores the displacement and uses the source pixel.</li> 
	 * <li>"color": If the displacement value is outside the image, substitutes a pixel value composed of the alpha and color properties of the filter.</li>
	 * </ul>  
	 */
	public function DisplacementMapConf (componentX : Number, componentY : Number, mapBitmap : BitmapData, mapPoint : Point, color : Number, alpha : Number, mode : String) {
		this.COMPONENT_X = componentX;
		this.COMPONENT_Y = componentY;
		this.MAP_BITMAP = mapBitmap;
		this.MAP_POINT = mapPoint;
		this.COLOR = color;
		this.ALPHA = alpha;
		this.MODE = mode;
	}
	
}