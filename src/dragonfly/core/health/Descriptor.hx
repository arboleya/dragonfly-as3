package dragonfly.core.health;

import haxe.PosInfos;

class Descriptor {
	public static var last_described : PosInfos;
	
	public static function describe( ?pos : PosInfos ) : PosInfos
	{
		return ( last_described = pos );
	}
}
