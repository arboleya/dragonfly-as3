package dragonfly.addons.filters 
{
	import dragonfly.addons.filters.lib.BaseFilterLarva;
	import dragonfly.addons.filters.lib.BevelLarva;
	import dragonfly.addons.filters.lib.BlurLarva;
	import dragonfly.addons.filters.lib.ConvolutionLarva;
	import dragonfly.addons.filters.lib.DisplacementMapLarva;
	import dragonfly.addons.filters.lib.DropShadowLarva;
	import dragonfly.addons.filters.lib.GlowLarva;
	import dragonfly.addons.filters.lib.GradientBevelLarva;
	import dragonfly.addons.filters.lib.GradientGlowLarva;
	import dragonfly.addons.interfaces.ILarva;
	import dragonfly.core.Larva;

	import flash.display.DisplayObject;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class FilterLarva extends Larva implements ILarva
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
		private var _sub_larvas : Array;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function FilterLarva( target : * )
		{
			super( target );
			
			var larva : BaseFilterLarva; 
			
			_sub_larvas = [
				_bevel = BevelLarva( _plug_larva( BevelLarva ) ),
				_blur = BlurLarva( _plug_larva( BlurLarva ) ),
				_convolution = ConvolutionLarva( _plug_larva( ConvolutionLarva ) ),
				_displacement_map = DisplacementMapLarva( _plug_larva( DisplacementMapLarva ) ),
				_dropshadow = DropShadowLarva( _plug_larva( DropShadowLarva ) ),
				_glow = GlowLarva( _plug_larva( GlowLarva ) ),
				_gradient_bevel = GradientBevelLarva( _plug_larva( GradientBevelLarva ) ),
				_gradient_glow = GradientGlowLarva( _plug_larva( GradientGlowLarva ) )
			];
			
			for each( larva in _sub_larvas )
				larva.parent = this;
		}

		public function refresh() : void
		{
			var filters : Array;
			var larva : BaseFilterLarva;
			
			filters = [];
			for each( larva in _sub_larvas )
			{
				if( larva.initialized )
					filters.push( larva[ "filter" ] );
			}
			
			( target as DisplayObject ).filters = filters;
		}

		public function get bevel() : BevelLarva
		{
			return _bevel;
		}

		public function get blur() : BlurLarva
		{
			return _blur;
		}

		public function get convolution() : ConvolutionLarva
		{
			return _convolution;
		}

		public function get displacement_map() : DisplacementMapLarva
		{
			return _displacement_map;
		}

		public function get dropshadow() : DropShadowLarva
		{
			return _dropshadow;
		}

		public function get glow() : GlowLarva
		{
			return _glow;
		}

		public function get gradient_glow() : GradientGlowLarva
		{
			return _gradient_glow;
		}

		public function get gradient_bevel() : GradientBevelLarva
		{
			return _gradient_bevel;
		}
	}
}