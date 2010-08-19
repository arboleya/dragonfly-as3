package dragonfly.core;

import dragonfly.core.Egg;
 
/**
 * @author nybras | nybras@codeine.it
 */
class Flight 
{
	/* ----- LOOP ------------------------------------------------------- */
	public var _loop : Bool;

	public var _loop_times : Float;

	/* ----- YOYO ------------------------------------------------------- */
	private var _yoyo : Bool;

	private var _yoyo_back_equation : Dynamic;

	/* ----- VARIABLES -------------------------------------------------- */
	private var _started : Bool;

	private var _eggs : Array<Egg>;

	private var _eggs_completed : Float ;

	/* ----- CALLBACKS -------------------------------------------------- */
	public var _on_start : Dynamic;

	public var _on_progress : Dynamic;

	public var _on_complete : Dynamic;

	public var _on_start_params : Array<Dynamic>;

	public var _on_progress_params : Array<Dynamic>;

	public var _on_complete_params : Array<Dynamic>;

	/* ----- INITIALIZING ----------------------------------------------- */
	public function new()
	{
		_eggs = new Array();
		_eggs_completed = 0;
		_on_start_params = new Array();
		_on_progress_params = new Array();
		_on_complete_params = new Array();
	}
	
	public function _add_egg( egg : Egg ) : Egg
	{
		_eggs.push( egg );
		egg.flight = this;
		egg.on_start = _on_egg_start;
		egg.on_progress = _on_egg_progress;
		egg.on_complete = _on_egg_complete;
		return egg;
	}

	/* ----- HANDLING EGG EVENTS ---------------------------------------- */
	private function _on_egg_start() : Void 
	{
		if( !_started )
		{
			_started = true;
			if( _on_start == null ) return;
			_on_start.apply( _on_start.prototype, _on_start_params );
		}
	}

	private function _on_egg_progress() : Void 
	{
		if( _on_progress == null  ) return;
		_on_progress.apply( _on_progress.prototype, _on_progress_params );
	}

	private function _on_egg_complete() : Void 
	{
		var egg : Egg;
		
		if( ++_eggs_completed < _eggs.length )
			return;
		
		for( egg in _eggs )
		{
			egg.larva.eggs.delete( egg );
			egg.destroy( );
		}
		
		if( _on_complete != null )
			_on_complete.apply( _on_complete.prototype, _on_complete_params );
	}

	/* ----- AVAILABLE EVENT FOR LISTENING ------------------------------ */
	public function on_start(
		method_callback : Dynamic,
		?params : Array<Dynamic>
	) : Flight
	{
		_on_start = method_callback;
		_on_start_params = params;
		return this;
	}

	public function on_progress(
		method_callback : Dynamic,
		?params : Array<Dynamic>
	) : Flight
	{
		_on_progress = method_callback;
		_on_progress_params = params;
		return this;
	}

	public function on_complete(
		method_callback : Dynamic,
		?params : Array<Dynamic>
	) : Flight
	{
		_on_complete = method_callback;
		_on_complete_params = params;
		return this;
	}

	/* ----- LOOPING FEATURE -------------------------------------------- */
	/*
	public function loop( times : Float = 0 ) : Void
	{
		_loop = true;
		_loop_times = times;
	}

	public function is_loop(get_is_loop,never) : Void;
	public function get_is_loop() : Bool
	{
		return _loop;
	}

	public function loop_times(get_loop_times,never) : Float;
	public function get_loop_times() : Float
	{
		return _loop_times;
	}
	*/
	
	/* ----- YOYO FEATURE ----------------------------------------------- */
	/*
	public function yoyo( back_equation : Dynamic ) : Void
	{
		_yoyo = true;
		_yoyo_back_equation = back_equation;
	}

	public function get is_yoyo() : Bool
	{
		return _loop;
	}

	public function get yoyo_back_equation() : Dynamic
	{
		return _yoyo_back_equation;
	}
	*/
}