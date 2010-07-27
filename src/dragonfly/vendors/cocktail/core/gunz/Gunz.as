package cocktail.core.gunz 
{

	
	
	/**
	 * <p>The Gunz class is a list of Gun's. Here you can remove all Gun 
	 * listeners with <code>rm_all</code> and make recursive 
	 * destruction of everything with <code>destroy</code>.</p>
	 * 
	 * <p>The way to add a Gun to this list is by passing this Gunz reference to 
	 * the Gun constructor.</p>
	 * 
	 * @see Gun
	 * @see Gunz#destroy()
	 * @see Gunz#rm_all()
	 * 
	 * @author nybras | me@nybras.com
	 * 
	 * @includeExample GunzExample.as
	 * 
	 */
	public class Gunz
	{
		/* VARS */
		
		/** Keeps the owner. */
		private var _owner : *;
		/** Keeps the guns list. */
		private var _gunz : Array;

		
		
		/* INITIALIZING */
		
		/**
		 * Creates a new Gunz instance.
		 * 
		 * @param owner A reference to the class that will listen the Gun shots. 
		 * Usually it is the class that created this Gunz instance.
		 */
		public function Gunz( owner : * )
		{
			_owner = owner;
			_gunz = [];
		}

		/* KEEPING, REMOVING AND DESTROYING GUNS */
		
		/**
		 * Adds a Gun to this store, this method is called from the 
		 * Gun's contructor.
		 * 
		 * @param gun The Gun calling this method.
		 * 
		 * @private
		 */
		internal function keep( gun : Gun ) : void
		{
			_gunz.push( gun );
		}

		/**
		 * Removes all listeners from all Gun's.
		 * @param type	If informed, removes all listeners of the given Gun
		 * type. If <code>null</code>, removes all listeners of all Gun types.
		 */
		public final function rm_all( type : String = null ) : void
		{
			var i : int;
			var gun : Gun;
			
			if( _gunz.length ) do
			{
				gun = _gunz[ i ];
				
				if( type == null || type == gun.type )
					gun.rm_all( );
			} while( ++i < _gunz.length );
		}

		/**
		 * Destroys the Gunz and all Gun in the list, unlistens everything.
		 */
		public final function destroy() : void
		{
			var i : int;
			
			if( _gunz.length ) do
			{
				Gun( _gunz[ i ] ).destroy( );
			} while( ++i < _gunz.length );
			
			_owner = null;
			_gunz = null;
		}
	}
}