import flash.filters.BevelFilter;
import flash.filters.BlurFilter;
import flash.filters.ColorMatrixFilter;
import flash.filters.ConvolutionFilter;
import flash.filters.DisplacementMapFilter;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;
import flash.filters.GradientBevelFilter;
import flash.filters.GradientGlowFilter;

import cocktail.lib.data.ds.LinkedList;



/**
 * Provides general handle for flash filters.
 */
class dragonfly.plugins.larvas.lib.filters.FiltersManager {
	
	// [CONSTANTS - filters types] *******************************************************************/
	
	/**
	 * @return Filter name.
	 */
	public static function get FILTER_BEVEL() : String {
		return "_bevel";
	}
	
	/**
	 * Blur.
	 * @return Filter property.
	 */
	public static function get FILTER_BLUR() : String {
		return "_blur";
	}
	
	/**
	 * ColorMatrix.
	 * @return Filter name.
	 */
	public static function get FILTER_COLOR_MATRIX() : String {
		return "_colorMatrix";
	}
	
	/**
	 * Convolution.
	 * @return Filter name.
	 */
	public static function get FILTER_CONVOLUTION() : String {
		return "_convolution";
	}
	
	/**
	 * DisplacementMap.
	 * @return Filter name.
	 */
	public static function get FILTER_DISPLACEMENT_MAP() : String {
		return "_displacementMap";
	}
	
	/**
	 * DropShadow.
	 * @return Filter name.
	 */
	public static function get FILTER_DROP_SHADOW() : String {
		return "_dropShadow";
	}
	
	/**
	 * Glow.
	 * @return Filter name.
	 */
	public static function get FILTER_GLOW_FILTER() : String {
		return "_glow";
	}
	
	/**
	 * GradientBevel.
	 * @return Filter name.
	 */
	public static function get FILTER_GRADIENT_BEVEL() : String {
		return "_gradientBevel";
	}
	
	/**
	 * GradientGlow.
	 * @return Filter name.
	 */
	public static function get FILTER_GRADIENT_GLOW() : String {
		return "_gradientGlow";
	}
	
	
	
	
	
	// [CONSTANTS - BevelFilter properties] *******************************************************************/
	
	/**
	 * Bevel distance.
	 * @return <code>distance</code> property.
	 */
	public static function get BEVEL_DISTANCE() : String {
		return "distance";
	}
	
	/**
	 * Bevel angle.
	 * @return <code>angle</code> property.
	 */
	public static function get BEVEL_ANGLE() : String {
		return "angle";
	}
	
	/**
	 * Bevel highlightColor.
	 * @return <code>highlightColor</code> property.
	 */
	public static function get BEVEL_HIGHLIGHTCOLOR() : String {
		return "highlightColor";
	}
	
	/**
	 * Bevel highlightAlpha.
	 * @return <code>highlightAlpha</code> property.
	 */
	public static function get BEVEL_HIGHLIGHTALPHA() : String {
		return "highlightAlpha";
	}
	
	/**
	 * Bevel shadowColor.
	 * @return <code>shadowColor</code> property.
	 */
	public static function get BEVEL_SHADOWCOLOR() : String {
		return "shadowColor";
	}
	
	/**
	 * Bevel shadowAlpha.
	 *  @return <code>shadowAlpha</code> property.
	 */
	public static function get BEVEL_SHADOWALPHA() : String {
		return "shadowAlpha";
	}
	
	/**
	 * Bevel blurX.
	 * @return <code>blurX</code> property.
	 */
	public static function get BEVEL_BLURX() : String {
		return "blurX";
	}
	
	/**
	 * Bevel blurY.
	 * @return <code>blurY</code> property.
	 */
	public static function get BEVEL_BLURY() : String {
		return "blurY";
	}
	
	/**
	 * Bevel knockout.
	 * @return <code>knockout</code> property.
	 */
	public static function get BEVEL_KNOCKOUT() : String {
		return "knockout";
	}
	
	/**
	 * Bevel quality.
	 * @return <code>quality</code> property.
	 */
	public static function get BEVEL_QUALITY() : String {
		return "quality";
	}
	
	/**
	 * Bevel strenght.
	 * @return <code>strenght</code> property.
	 */
	public static function get BEVEL_STRENGTH() : String {
		return "strength";
	}
	
	/**
	 * Bevel type.
	 * @return <code>type</code> property.
	 */
	public static function get BEVEL_TYPE() : String {
		return "type";
	}
	
	
	
	
	
	// [CONSTANTS - BlurFilter properties] *******************************************************************/
	
	/**
	 * Blur x.
	 * @return <code>x</code> property.
	 */
	public static function get BLUR_X() : String {
		return "blurX";
	}
	
	/**
	 * Blur y.
	 * @return <code>y</code> property.
	 */
	public static function get BLUR_Y() : String {
		return "blurY";
	}
	
	/**
	 * Blur quality.
	 * @return <code>quality</code> property.
	 */
	public static function get BLUR_QUALITY() : String {
		return "quality";
	}
	
	
	
	
	
	// [CONSTANTS - ColorMatrix properties] *******************************************************************/
	
	/**
	 * ColorMatrix matrix.
	 * @return <code>matrix</code> property.
	 */
	public static function get COLORMATRIX_MATRIX() : String {
		return "matrix";
	}
	
	
	
	
	
	// [CONSTANTS - Convolution properties] *******************************************************************/
	
	/**
	 * Convolution matrix.
	 * @return <code>matrix</code> property.
	 */
	public static function get CONVOLUTION_MATRIX() : String {
		return "matrix";
	}
	
	/**
	 * Convolution matrixX.
	 * @return <code>matrixX</code> property.
	 */
	public static function get CONVOLUTION_MATRIX_X() : String {
		return "matrixX";
	}
	
	/**
	 * Convolution matrixY.
	 * @return <code>matrixY</code> property.
	 */
	public static function get CONVOLUTION_MATRIX_Y() : String {
		return "matrixY";
	}
	
	/**
	 * Convolution divisor.
	 * @return <code>divisor</code> property.
	 */
	public static function get CONVOLUTION_DIVISOR() : String {
		return "divisor";
	}
	
	/**
	 * Convolution bias.
	 * @return <code>bias</code> property.
	 */
	public static function get CONVOLUTION_BIAS() : String {
		return "bias";
	}
	
	/**
	 * Convolution preserveAlpha.
	 * @return <code>preserveAlpha</code> property.
	 */
	public static function get CONVOLUTION_PRESERVA_ALPHA() : String {
		return "preserveAlpha";
	}
	
	/**
	 * Convolution clamp.
	 * @return <code>clamp</code> property.
	 */
	public static function get CONVOLUTION_CLAMP() : String {
		return "clamp";
	}
	
	/**
	 * Convolution color.
	 * @return <code>color</code> property.
	 */
	public static function get CONVOLUTION_COLOR() : String {
		return "color";
	}
	
	/**
	 * Convolution alpha.
	 * @return <code>alpha</code> property.
	 */
	public static function get CONVOLUTION_ALPHA() : String {
		return "alpha";
	}
	
	
	
	
	
	// [CONSTANTS - DisplacementMap properties] *******************************************************************/
	
	/**
	 * DisplacementMap mapBitmap.
	 * @return <code>mapBitmap</code> property.
	 */
	public static function get DISPLACEMENTMAP_MAP_BITMAP() : String {
		return "mapBitmap";
	}
	
	/**
	 * DisplacementMap mapPoint.
	 * @return <code>mapPoint</code> property.
	 */
	public static function get DISPLACEMENTMAP_MAP_POINT() : String {
		return "mapPoint";
	}
	
	/**
	 * DisplacementMap componentX.
	 * @return <code>componentX</code> property.
	 */
	public static function get DISPLACEMENTMAP_COMPONENT_X() : String {
		return "componentX";
	}
	
	/**
	 * DisplacementMap componentY.
	 * @return <code>componentY</code> property.
	 */
	public static function get DISPLACEMENTMAP_COMPONENT_Y() : String {
		return "componentY";
	}
	
	/**
	 * DisplacementMap scaleX.
	 * @return <code>scaleX</code> property.
	 */
	public static function get DISPLACEMENTMAP_SCALE_X() : String {
		return "scaleX";
	}
	
	/**
	 * DisplacementMap scaleY.
	 * @return <code>scaleY</code> property.
	 */
	public static function get DISPLACEMENTMAP_SCALE_Y() : String {
		return "scaleY";
	}
	
	/**
	 * DisplacementMap mode.
	 * @return <code>mode</code> property.
	 */
	public static function get DISPLACEMENTMAP_MODE() : String {
		return "mode";
	}
	
	/**
	 * DisplacementMap color.
	 * @return <code>color</code> property.
	 */
	public static function get DISPLACEMENTMAP_COLOR() : String {
		return "color";
	}
	
	/**
	 * DisplacementMap alpha.
	 * @return <code>alpha</code> property.
	 */
	public static function get DISPLACEMENTMAP_ALPHA() : String {
		return "alpha";
	}
	
	
	
	
	
	// [CONSTANTS - DropShadow properties] *******************************************************************/
	
	/**
	 * DropShadow distance.
	 * @return <code>distance</code> property.
	 */
	public static function get DROPSHADOW_DISTANCE() : String {
		return "distance";
	}
	
	/**
	 * DropShadow angle.
	 * @return <code>angle</code> property.
	 */
	public static function get DROPSHADOW_ANGLE() : String {
		return "angle";
	}
	
	/**
	 * DropShadow color.
	 * @return <code>color</code> property.
	 */
	public static function get DROPSHADOW_COLOR() : String {
		return "color";
	}
	
	/**
	 * DropShadow alpha.
	 * @return <code>alpha</code> property.
	 */
	public static function get DROPSHADOW_ALPHA() : String {
		return "alpha";
	}
	
	/**
	 * DropShadow blurX.
	 * @return <code>blurX</code> property.
	 */
	public static function get DROPSHADOW_BLUR_X() : String {
		return "blurX";
	}
	
	/**
	 * DropShadow blurY.
	 * @return <code>blurY</code> property.
	 */
	public static function get DROPSHADOW_BLUR_Y() : String {
		return "blurY";
	}
	
	/**
	 * DropShadow hideObject.
	 * @return <code>hideObject</code> property.
	 */
	public static function get DROPSHADOW_HIDE_OBJECT() : String {
		return "hideObject";
	}
	
	/**
	 * DropShadow inner.
	 * @return <code>inner</code> property.
	 */
	public static function get DROPSHADOW_INNER() : String {
		return "inner";
	}
	
	/**
	 * DropShadow knockout.
	 * @return <code>knockout</code> property.
	 */
	public static function get DROPSHADOW_KNOCKOUT() : String {
		return "knockout";
	}
	
	/**
	 * DropShadow quality.
	 * @return <code>quality</code> property.
	 */
	public static function get DROPSHADOW_QUALITY() : String {
		return "quality";
	}
	
	/**
	 * DropShadow strength.
	 * @return <code>strength</code> property.
	 */
	public static function get DROPSHADOW_STRENGTH() : String {
		return "strength";
	}
	
	
	
	
	
	// [CONSTANTS - Glow properties] *******************************************************************/
	
	/**
	 * Glow color.
	 * @return <code>color</code> property.
	 */
	public static function get GLOW_COLOR() : String {
		return "color";
	}
	
	/**
	 * Glow alpha.
	 * @return <code>alpha</code> property.
	 */
	public static function get GLOW_ALPHA() : String {
		return "alpha";
	}
	
	/**
	 * Glow blurX.
	 * @return <code>blurX</code> property.
	 */
	public static function get GLOW_BLUR_X() : String {
		return "blurX";
	}
	
	/**
	 * Glow blurY.
	 * @return <code>blurY</code> property.
	 */
	public static function get GLOW_BLUR_Y() : String {
		return "blurY";
	}
	
	/**
	 * Glow strength.
	 * @return <code>strength</code> property.
	 */
	public static function get GLOW_STRENGTH() : String {
		return "strength";
	}
	
	/**
	 * Glow quality.
	 * @return <code>quality</code> property.
	 */
	public static function get GLOW_QUALITY() : String {
		return "quality";
	}
	
	/**
	 * Glow inner.
	 * @return <code>inner</code> property.
	 */
	public static function get GLOW_INNER() : String {
		return "inner";
	}
	
	/**
	 * Glow knockout.
	 * @return <code>knockout</code> property.
	 */
	public static function get GLOW_KNOCKOUT() : String {
		return "knockout";
	}
	
	
	
	
	
	// [CONSTANTS - Gradient properties] *******************************************************************/
	
	/**
	 * Gradient distance.
	 * @return <code>distance</code> property.
	 */
	public static function get GRADIENT_DISTANCE() : String {
		return "distance";
	}
	
	/**
	 * Gradient angle.
	 * @return <code>angle</code> property.
	 */
	public static function get GRADIENT_ANGLE() : String {
		return "angle";
	}
	
	/**
	 * Gradient colors.
	 * @return <code>colors</code> property.
	 */
	public static function get GRADIENT_COLORS() : String {
		return "colors";
	}
	
	/**
	 * Gradient alphas.
	 * @return <code>alphas</code> property.
	 */
	public static function get GRADIENT_ALPHAS() : String {
		return "alphas";
	}
	
	/**
	 * Gradient ratios.
	 * @return <code>ratios</code> property.
	 */
	public static function get GRADIENT_RATIOS() : String {
		return "ratios";
	}
	
	/**
	 * Gradient blurX.
	 * @return <code>blurX</code> property.
	 */
	public static function get GRADIENT_BLUR_X() : String {
		return "blurX";
	}
	
	/**
	 * Gradient blurY.
	 * @return <code>blurY</code> property.
	 */
	public static function get GRADIENT_BLUR_Y() : String {
		return "blurY";
	}
	
	/**
	 * Gradient strength.
	 * @return <code>strength</code> property.
	 */
	public static function get GRADIENT_STRENGTH() : String {
		return "strength";
	}
	
	/**
	 * Gradient quality.
	 * @return <code>quality</code> property.
	 */
	public static function get GRADIENT_QUALITY() : String {
		return "quality";
	}
	
	/**
	 * Gradient type.
	 * @return <code>type</code> property.
	 */
	public static function get GRADIENT_TYPE() : String {
		return "type";
	}
	
	/**
	 * Gradient knockout.
	 * @return <code>knockout</code> property.
	 */
	public static function get GRADIENT_KNOCKOUT() : String {
		return "knockout";
	}
	
	
	
	
	
	// [PRIVATE - properties] *******************************************************************/ 
	
	/**
	 * Targets.
	 */
	private var _targets:LinkedList;
	
	/**
	 * Initialized filters.
	 */
	private var initializedFilters:Object;
	
	/**
	 * Filters.
	 */
	private var filters:Array;
	
	
	
	
	
	// [PRIVATE - filter instances] *******************************************************************/
	
	private var _bevel:BevelFilter;
	private var _blur:BlurFilter;
	private var _colorMatrix:ColorMatrixFilter;
	private var _convolution:ConvolutionFilter;
	private var _displacementMap:DisplacementMapFilter;
	private var _dropShadow:DropShadowFilter;
	private var _glow:GlowFilter;
	private var _gradientBevel:GradientBevelFilter;
	private var _gradientGlow:GradientGlowFilter;
	
	
	
	
	
	// [CONSTRUCTOR] *********************************************************************************/ 
	
	/**
	 * Create a FiltersManager object.
	 * 
	 * @param targets Targets to be managed.
	 */
	function FiltersManager (targets : LinkedList) {
		this._targets = targets;
		this.initializedFilters = new Object;
		this.createFiltersInstances();
	}
	
	
	
	
	
	// [PRIVATE - createInstances / Refresh] **********************************************************/
	
	/**
	 * Create all filters instances.
	 */
	private function createFiltersInstances () : Void {
		this._bevel = new BevelFilter(0, 0, 0, 0, 0, 0, 0, 0, 0);
		this._blur = new BlurFilter(0, 0, 4);
		this._colorMatrix = new ColorMatrixFilter([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0]);
		this._convolution = new ConvolutionFilter(1, 1, [1], 1, 0);
		this._displacementMap = new DisplacementMapFilter;
		this._dropShadow = new DropShadowFilter(0, 0, 0, 0, 0, 0, 0, 0);
		this._glow = new GlowFilter(0, 0, 0, 0, 0, 0, false, false);
		this._gradientBevel = new GradientBevelFilter(0, 0, [0x000000], [0], [], 0, 0, 0, 0);
		this._gradientGlow = new GradientGlowFilter(0, 0, [0x000000], [0], [0], 0, 0, 0, 0);
	}
	
	
	
	
	/**
	 * Refreshes all targets / filters.
	 */
	private function refresh () : Void {
		this._targets.each(this.refreshTarget, this);
	}
	
	/**
	 * Refresh the Target filters.
	 * @param target Target to be refreshed.
	 */
	private function refreshTarget (target : Object) : Void {
		var filters:Array;
		var i:String;
		
		filters = new Array;
		for (i in this.initializedFilters) {
			filters.push(this[i]);
		}
		
		if (filters.length) {
			target['filters'] = filters;
		}
	}
	
	
	
	
	
	// [PRIVATE - setProperty / getProperty] **********************************************************/
	
	/**
	 * Sets the given Filter/Property/Value.
	 * @param filterName Desired filter.
	 * @param property Property to be set.
	 * @param value	Value to the given Property.
	 */
	public function setProperty (filterName : String, property : String, value : Object) : Void {
		this.initializedFilters[filterName] = true;
		this[filterName][property] = value;
		
		this.refresh();
	}
	
	/**
	 * Get the Filter/Property value.
	 * @param filterName Desired filter.
	 * @param property Desired property.
	 * @return The property value.
	 */
	public function getProperty (filterName:String, property:String):Object {
		return this[filterName][property] || 0;
	}
}
