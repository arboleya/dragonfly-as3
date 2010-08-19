package dragonfly.core;

import dragonfly.core.Flight;

class Egg
{
	public var flight : Flight;
	
	public function new()
	{
		trace( "Egg!" );
		flight = new Flight();
	}
}