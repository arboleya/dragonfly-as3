package dragonfly.core;

import dragonfly.core.Larva;

/**
 * @author nybras | nybras@codeine.it
 */
class Egg
{
	/* ----- VARIABLES -------------------------------------------------- */
	private var _active : Bool;

	public var larva : Larva;

	private var __prop_target : Dynamic;

	private var _indexes : Hash<Dynamic>;

	private var _types : Array<String>;

	public var _props : Array<String>;

	private var _starts : Array<Dynamic>;

	public var _ends : Array<Dynamic>;

	private var _nymph : Nymph;

	public var flight : Flight;

	/* ----- CALLBACKS -------------------------------------------------- */
	public var on_start : Dynamic;

	public var on_progress : Dynamic;

	public var on_complete : Dynamic;

	/* ----- INITIALIZING ----------------------------------------------- */
	public function new ()
	{
	}
	
	
	public function config(
		larva : Larva,
		props : Array<String>,
		types : Array<String>,
		ends : Array<Dynamic>,
		starts : Array<Dynamic>,
		indexes : Dynamic
	) : Egg
	{
		_nymph = new Nymph( );
		this.larva = larva;
		_props = props;
		_types = types;
		_ends = ends;
		_starts = starts;
		_indexes = indexes;
		return this;
	}

	dynamic function init() : Void
	{
		trace( "You need to override this method in subclass!" );
	}

	public function _shoke(
		duration : Float,
		delay : Float,
		equation : Dynamic,
		equation_args : Dynamic
	) : Egg
	{
		_nymph.on_start = _nymph_start;
		_nymph.on_progress = _nymph_progress;
		_nymph.on_complete = _nymph_complete;
		_nymph.config(
			this,
			__prop_target,
			_props, _types,
			_starts,
			_ends,
			duration,
			delay,
			equation,
			equation_args
		);
		return this;
	}
	
	
	private function _propagate( method_name : String, ?params : Array<Dynamic> ) : Void
	{
		var method : Dynamic;
		
		if( Reflect.hasField( this, method_name ) )
		{
			//if( params == null )
				//params = [];
			
			method = Reflect.field( this, method_name );
			Reflect.callMethod( this, method, params );
		}
	}
	
	private function _nymph_start() : Void 
	{
		var i : Int;
		var method : Dynamic;
		
		larva.kill_flying_properties( this, _props );
		
		for( i in 0..._ends.length )
			if( Math.isNaN( _starts[ i ] ) )
				_starts[ i ] = get_start_value( _props[ i ] );
		
		_active = true;
		larva.initialized = true;
		
		_propagate( "before_render" );
		on_start( );
	}

	private function _nymph_progress( prop : String, value : Dynamic ) : Void 
	{
		_propagate( "render", [ prop, value ] );
		on_progress();
	}

	private function _nymph_complete() : Void 
	{
		var method : Dynamic;
		
		_active = false;
		
		_propagate( "after_render" );
		on_complete( );
	}

	public function hold() : Egg 
	{
		_nymph.hold( );
		return this;
	}

	public function unhold() : Egg 
	{
		_nymph.unhold( );
		return this;
	}

	public function destroy() : Void 
	{
		_nymph.destroy( );
		_active = false;
		larva = null;
		__prop_target = null;
		_types = null;
		_props = null;
		_starts = null;
		_ends = null;
		_nymph = null;
		flight = null;
		on_start = null;
		on_progress = null;
		on_complete = null;
	}

	public function remove_properties( props : Array<String> ) : Void
	{
		var index : Int;
		var prop : String;
		
		for( prop in props )
		{
			index = _indexes.get( prop );
			
			_indexes.set( prop, null );
			Reflect.deleteField( _indexes, prop );
			
			_props.splice( index, 1 );
			_types.splice( index, 1 );
			_ends.splice( index, 1 );
			_starts.splice( index, 1 );
		}
	}

	//public var time_left(get_time_left,never) : Float; 
	//public function get_time_left() : Float 
	//{
	//	return _nymph.time_left;
	//}
	
	public var active(_get_active,never) : Bool; 
	private function _get_active() : Bool 
	{
		return _active;
	}

	dynamic function get_start_value( prop : String ) : Dynamic
	{
		return Reflect.field( larva.target, prop );
	}

	private var _prop_target(_get_prop_target,_set_prop_target) : Dynamic;
	private function _get_prop_target() : Dynamic
	{
		return __prop_target;
	}
	private function _set_prop_target( value : Dynamic ) : Void
	{
		__prop_target = value;
	}
}