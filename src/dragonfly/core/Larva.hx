package dragonfly.core;

import dragonfly.core.Egg;

import flash.utils.TypedDictionary;

class Larva {
	
	public var _initialized : Bool;
	public var target : Dynamic;
	public var eggs : TypedDictionary<Egg,Float>;
	
	public function new()
	{
		eggs = new TypedDictionary();
	}
	
	public function kill_flying_properties( egg : Egg, props : Array<String> ) : Void
	{
		
	}
}