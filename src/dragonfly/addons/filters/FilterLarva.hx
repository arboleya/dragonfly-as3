package dragonfly.addons.filters;

import dragonfly.addons.filters.lib.BaseFilterLarva;
import dragonfly.addons.filters.lib.BevelLarva;
import dragonfly.addons.filters.lib.BlurLarva;
import dragonfly.addons.filters.lib.ConvolutionLarva;
import dragonfly.addons.filters.lib.DisplacementMapLarva;
import dragonfly.addons.filters.lib.DropShadowLarva;
import dragonfly.addons.filters.lib.GlowLarva;
import dragonfly.addons.filters.lib.GradientBevelLarva;
import dragonfly.addons.filters.lib.GradientGlowLarva;
import dragonfly.core.Larva;

import flash.display.DisplayObject;

/**
 * @author nybras | nybras@codeine.it
 */
class FilterLarva extends Larva
{
	/* ----- FILTERS INSTANCES ------------------------------------------ */
	private var _bevel : BevelLarva;

	private var _blur : BlurLarva;

	private var _convolution : ConvolutionLarva;

	private var _displacement_map : DisplacementMapLarva;

	private var _dropshadow : DropShadowLarva;

	private var _glow : GlowLarva;

	private var _gradient_bevel : GradientBevelLarva;

	private var _gradient_glow : GradientGlowLarva;

	private var _sub_larvas : Array<Dynamic>;

	/* ----- INITIALIZING ----------------------------------------------- */
	public function new( target : Dynamic )
	{
		super( target );
		
		var larva : BaseFilterLarva; 
		
		_sub_larvas = [ _bevel = cast( _plug_larva( BevelLarva ), BevelLarva) ];
		
		for( larva in _sub_larvas )
			larva.parent = this;
	}

	public function refresh() : Void
	{
		var filters : Array<Dynamic>;
		var larva : BaseFilterLarva;
		
		filters = [];
		for( larva in _sub_larvas )
		{
			if( larva.initialized )
				filters.push( larva.filter );
		}
		
		cast(target,DisplayObject).filters = filters;
	}

	public var bevel( _get_bevel, never ) : BevelLarva;
	private function _get_bevel() : BevelLarva
	{
		return _bevel;
	}

	public var blur( _get_blur, never ) : BlurLarva;
	private function _get_blur() : BlurLarva
	{
		return _blur;
	}

	public var convolution( _get_convolution, never ) : ConvolutionLarva;
	private function _get_convolution() : ConvolutionLarva
	{
		return _convolution;
	}

	public var displacement_map( _get_displacement_map, never ) : DisplacementMapLarva;
	private function _get_displacement_map() : DisplacementMapLarva
	{
		return _displacement_map;
	}

	public var dropshadow( _get_dropshadow, never ) : DropShadowLarva;
	private function _get_dropshadow() : DropShadowLarva
	{
		return _dropshadow;
	}

	public var glow( _get_glow, never ) : GlowLarva;
	private function _get_glow() : GlowLarva
	{
		return _glow;
	}

	public var gradient_glow( _get_gradient_glow, never ) : GradientGlowLarva;
	private function _get_gradient_glow() : GradientGlowLarva
	{
		return _gradient_glow;
	}

	public var gradient_bevel( _get_gradient_bevel, never ) : GradientBevelLarva;
	private function _get_gradient_bevel() : GradientBevelLarva
	{
		return _gradient_bevel;
	}
}