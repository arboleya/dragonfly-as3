package cocktail.core.gunz 
{

	
	
	/**
	 * Groups multiple Gun's, listens to every single one, and fires the
	 * "complete" Gun (gunz_complete) when all Gun's have shot.
	 * 
	 * @see Gun
	 * 
	 * @includeExample GunzGroup.as
	 * 
	 * TODO: rename this to "ScreamCounter" or something like that. Then we could implement another kind of gunz groups 
	 * @author nybras | me@nybras.com
	 */
	public class GunzGroup 
	{
		/* GUNZ */
		
		/** Gunz list. **/
		public var gunz : Gunz;
		/** Gunz complete event. **/
		public var gunz_complete : Gun;

		
		
		/**
		 * Initializes gunz event system.
		 */
		private function _init_gunz() : void
		{
			gunz = new Gunz( this );
			gunz_complete = new Gun( gunz, this, "complete" );
		}

		
		
		/* VARIABLES */
		
		/** Compute the number of fired guns, in the queue. **/
		private var _fired : int;
		/** Keeps all queued guns. **/
		private var _items : Array;

		
		
		/* INITIALIZING */
		
		/**
		 * Initializes the module.
		 */
		public function GunzGroup()
		{
			_init_gunz( );
			_items = [];
		}

		/* ADDING ITEMS AND LISTENING THEM */

		/**
		 * Adds a new Gun to the queue list and listen to its shots.
		 * @param gun	Gun to be added.
		 * @return	Self reference for reuse.
		 */
		public function add( gun : Gun ) : GunzGroup
		{
			gun.add( _gun_shot );
			_items.push( gun );
			return this;
		}

		/**
		 * Listens to all queued Gun's, checking if all Gun's already finished
		 * or not, and if it's the last, shoots a complete Gun.
		 */
		private function _gun_shot( ...bullet ) : void
		{
			if( ++_fired == _items.length )
				gunz_complete.shoot( );
		}
	}
}