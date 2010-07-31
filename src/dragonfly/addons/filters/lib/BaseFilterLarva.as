package dragonfly.addons.filters.lib 
{
	import dragonfly.addons.filters.FilterLarva;
	import dragonfly.core.Larva;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class BaseFilterLarva extends Larva 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		protected var _parent : FilterLarva;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */		
		/**
		 * TODO: write documentation
		 */
		public function BaseFilterLarva(
			target : *,
			use_frames : Boolean,
			fps : Number)
		{
			super( target, use_frames, fps );
		}

		/* ----- CORE ------------------------------------------------------- */
		
		/**
		 * TODO: write documentation
		 */
		public function get close() : FilterLarva
		{
			return _parent;
		}

		/**
		 * TODO: write documentation
		 */
		public function set parent( value : FilterLarva ) : void
		{
			_parent = value;
		}
	}
}