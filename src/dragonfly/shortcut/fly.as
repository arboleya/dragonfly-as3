package dragonfly.shortcut
{
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public function fly(
		target : Object,
		duration : Number,
		delay : Number,
		props : Object
	) : void 
	{
		Flights.larvanize( target, props );
	}
}

import dragonfly.addons.basic.BasicLarva;
import dragonfly.core.Larva;

import flash.utils.Dictionary;



internal class Flights
{
	private static var _flights : Dictionary;
	
	internal static function larvanize( target : *, props : Object  ) : Larva
	{
		var classes : Array;
		classes = evaluate( props );
		
		if( ! _flights.hasOwnProperty( target ) )
			_flights[ target ] = new BasicLarva( target );
		
		return _flights[ target ];
	}
	
	private static function evaluate( props : Object  ) : Array
	{
		 var classes : Array;
		 var prop : String;
		 
		 classes = [];
		 for( prop in props )
		 	null;
		 
		 return classes;
	}
}

internal class Larvas
{
	
}