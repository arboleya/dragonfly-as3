import cocktail.lib.data.ds.LinkedList;

class cocktail.utils.LinkedListHelper {

	public static function catchSequencialMovieClips (scope:MovieClip, prefix:String, sufix:String, from:Number, to:Number) : LinkedList {
		var list:LinkedList;
		var mc:MovieClip;
		
		sufix = sufix || '';
		prefix = prefix || '';
		from = from || 0;
		
		list = new LinkedList();
		
		for(; 
			((mc = scope[prefix + from + sufix]) != undefined && to == undefined) ||
			(to != undefined && from <= to);
			from++
		) {
			list.append(mc);
		}
		
		return list;
	}
}