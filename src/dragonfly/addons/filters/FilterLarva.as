package dragonfly.addons.filters 
{
	import dragonfly.addons.filters.lib.BaseFilterLarva;
	import dragonfly.addons.filters.lib.BevelLarva;
	import dragonfly.addons.filters.lib.BlurLarva;
	import dragonfly.addons.filters.lib.ConvolutionLarva;
	import dragonfly.addons.filters.lib.DisplacementMapLarva;
	import dragonfly.addons.filters.lib.DropShadowLarva;
	import dragonfly.addons.filters.lib.GlowLarva;
	import dragonfly.addons.filters.lib.GradientLarva;
	import dragonfly.core.Larva;

	import flash.display.DisplayObject;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class FilterLarva extends Larva 
	{
		/* ----- FILTERS INSTANCES ------------------------------------------ */
		private var _bevel : BevelLarva;
		private var _blur : BlurLarva;
		private var _convolution : ConvolutionLarva;
		private var _displacement_map : DisplacementMapLarva;
		private var _dropshadow : DropShadowLarva;
		private var _glow : GlowLarva;
		private var _gradient : GradientLarva;
		
		private var _sub_larvas : Array;
		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function FilterLarva(
			target : *,
			use_frames : Boolean = false,
			fps : Number = undefined
		)
		{
			super( target, use_frames, fps );
			
			var larva : BaseFilterLarva; 
			
			_sub_larvas = [
				_bevel = BevelLarva( _plug_larva( BevelLarva ) ),
				_blur = BlurLarva( _plug_larva( BlurLarva ) ),
				_convolution = ConvolutionLarva( _plug_larva( ConvolutionLarva ) ),
				_displacement_map = DisplacementMapLarva( _plug_larva( DisplacementMapLarva ) ),
				_dropshadow = DropShadowLarva( _plug_larva( DropShadowLarva ) ),
				_glow = GlowLarva( _plug_larva( GlowLarva ) ),
				_gradient = GradientLarva( _plug_larva( GradientLarva ) )
			];
			
			for each( larva in _sub_larvas )
				larva.parent = this;
		}

		public function refresh() : void
		{
			var filters : Array;
			var larva : BaseFilterLarva;
			var target : DisplayObject;
			
			filters = [];
			for each( larva in _sub_larvas )
			{
				trace( larva, larva.initialized );
				 if( larva.initialized )
					filters.push( larva[ "filter" ] );
			}
			
			for each( target in targets )
				target.filters = filters;
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

		public function get gradient() : GradientLarva
		{
			return _gradient;
		}
	}
}