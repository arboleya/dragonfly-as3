package ;

import dragonfly.core.Nymph;
import dragonfly.core.Egg;

import com.robertpenner.easing.Back;

class Test
{
	public static function main()
	{
		new Test();
	}
	
	function new ()
	{
		_test_nymph();
		//_test_egg();
		//_test_larva();
		//_test_flight();
	}
	
	
	
	/* NYMPH */
	
	function _test_nymph() : Void
	{
		var n : Nymph = new Nymph();
		n.on_start = _start;
		n.on_progress = _progress;
		n.on_complete = _complete;
	 	n.config( new Egg(), null, [ "x" ], [ "numeric" ], [ 0 ], [ 50 ], .5, 0, Back, Back.easeIn, [] );
	}
	
	function _start() : Void
	{
		trace( "START! "+ this );	
	}
	function _progress( p : String, v : Dynamic ) : Void
	{
		trace( "PROGRESS: "+ p +" , "+ v + " - "+ this );	
	}
	function _complete() : Void
	{
		trace( "COMPLETE! "+ this );	
	}
	
	
	/* EGG */
	
	function _test_egg() : Void
	{
	}
	
	
	
	/* LARVA*/
	
	function _test_larva() : Void
	{
	}
	
	
	
	/* FLIGHT*/
	
	function _test_flight() : Void
	{
	}
}