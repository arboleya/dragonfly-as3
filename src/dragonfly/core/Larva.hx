package dragonfly.core ;

import flash.utils.TypedDictionary;

class Larva
{
	/* ----- VARIABLES -------------------------------------------------- */
	/**
	 * TODO: write docs
	 */
	public var initialized : Bool;

	/**
	 * TODO: write docs
	 */
	private var _target : Dynamic;

	/**
	 * TODO: write docs
	 */
	private var _laid : Hash<Dynamic>;

	/**
	 * TODO: write docs
	 */
	private var _larvas : TypedDictionary<Larva,Larva>;

	/**
	 * TODO: write docs
	 */
	private var _eggs : TypedDictionary<Egg,Egg>;

	/* ----- INITIALIZING ----------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	public function new( target : Dynamic )
	{
		_target = target;
		_larvas = new TypedDictionary( );
		_eggs = new TypedDictionary( );
		_laid = new Hash( );
	}

	/* ----- GETTERS ---------------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	public var eggs( _get_eggs, never) : TypedDictionary<Egg,Egg>; 
	private function _get_eggs() : TypedDictionary<Egg,Egg>
	{
		return _eggs;
	}

	/**
	 * TODO: write docs
	 */
	public var target( _get_target, never) : Dynamic; 
	private function _get_target() : Dynamic 
	{
		return _target;
	}

	/**
	 * TODO: write docs
	 */
	public var larvas( _get_larvas, never ) : TypedDictionary<Larva,Larva>; 
	private function _get_larvas() : TypedDictionary<Larva,Larva>
	{
		return _larvas;
	} 

	/**
	 * Gets the thotal time left to larva has until get stopped.
	 * @return The total left time larva has until get stopped.
	 */
	/*
	public var time_left( _get_time_left, never ) : Float; 
	private function _get_time_left() : Float 
	{
		var time_left : Float;
		var egg : Egg;
		
		time_left = 0;
		for each( egg in _eggs )
			time_left = Math.max( egg.time_left, time_left );
		
		return time_left;
	}
	*/
	
	/* ----- CONTROLS --------------------------------------------------- */
	
	/**
	 * TODO: write docs
	 */
	public function hold() : Void 
	{
		var egg : Egg;
		for( egg in _eggs )
			egg.hold( );
	}

	/**
	 * TODO: write docs
	 */
	public function unhold() : Void 
	{
		var egg : Egg;
		for( egg in _eggs )
			egg.unhold( );
	}

	/* ----- GC --------------------------------------------------------- */
	/**
	 * TODO: write docs
	 */
	public function destroy() : Void 
	{
		 var egg : Egg;
		for( egg in _eggs )
			egg.destroy( );
		
		initialized = false;
		_target = null;
		_laid = null;
		_larvas = null;
	}

	/**
	 * Returns the larva's activity status.
	 * @return <code>true</code> it the larva is active (tweening something)
	 * or <code>false</false> otherwise.
	 */
	public var active(_get_active,never) : Float; 
	private function _get_active() : Float 
	{
		var active_eggs : Float;
		var larva : Larva;
		var egg : Egg;
		
		active_eggs = 0;
		
		for( larva in _larvas )
			active_eggs += larva.active;
		
		for( egg in _eggs )
			if( egg.active )
				active_eggs++;
		
		return active_eggs;
	}

	/* ----- LAYING EGGS and MAKING THEM TO FLY ------------------------- */
	
	/**
	 * TODO: write docs
	 */
	private function _lay(
		klass : Dynamic,
		prop : String,
		end : Dynamic,
		start : Dynamic = null,
		type : String = null
	) : Void
	{
		var laid : Dynamic;
		var key : String;
		var index : Int;
		
		key = cast klass;
		
		if( _laid == null )
			_laid = new Hash( );
		
		if( ! _laid.exists( key ) )
		{
			_laid.set( key, {
				klass:klass,
				props: [],
				types: [],
				starts: [],
				ends: [],
				indexes: new Hash()
			});
		}
		
		laid = _laid.get( key );
		
		if( Reflect.hasField( laid.indexes, prop ) )
			index = laid.indexes.prop;
		else
			index = laid.props.length;
		
		laid.props[ index ] = prop;
		laid.types[ index ] = ( type == null ? Nymph.NUMERIC : type );
		laid.starts[ index ] = start;
		laid.ends[ index ] = end;
		laid.indexes.set( prop, index );
	}

	/**
	 * TODO: write docs
	 */
	public function fly(
		duration : Float,
		delay : Float = null,
		equation : Dynamic = null,
		equation_args : Dynamic = null,
		flight : Flight = null
	) : Flight
	{
		var egg : Egg;
		var egg : Dynamic;
		var larva : Larva;
		var item : Dynamic;
		
		flight = ( flight == null ? new Flight( ) : flight );
		
		for( larva in _larvas )
			larva.fly( duration, delay, equation, equation_args, flight );
		
		for( item in _laid )
		{
			egg = Type.createInstance( item.klass, [] );
			egg.config(
				this,
				item.props,
				item.types,
				item.ends,
				item.starts,
				item.indexes
			).init( );
			
			_eggs.set( egg, egg );
			
			egg._shoke( duration, delay, equation, equation_args );
			flight._add_egg( egg );
		}
		
		_laid = null;
		return flight;
	}

	/* ----- KILL IDENTICAL EGGS PREVIOUSLY LAID ------------------------ */
	
	/**
	 * TODO: write docs
	 */
	public function kill_flying_properties(
		caller : Egg,
		props : Array<String>
	) : Void
	{
		var egg : Egg;
		for( egg in _eggs )
			if( Type.typeof( egg ) == Type.typeof( caller ) )
				if( egg != caller && egg.active )
					egg.remove_properties( props );
	}

	/* ----- PLUG and UNPLUG of SUB-LARVAS ------------------------------ */
	
	/**
	 * TODO: write docs
	 */
	private function _plug_larva( larva_class : Dynamic ) : Larva 
	{
		var larva : Larva;
		
		larva = Type.createInstance( larva_class , [ target ] );
		_larvas.set( larva, larva );
		
		return larva; 
	}

	/**
	 * TODO: write docs
	 */
	private function _unplug_larva( larva : Larva ) : Void 
	{
		_larvas.delete( larva);
	}
}