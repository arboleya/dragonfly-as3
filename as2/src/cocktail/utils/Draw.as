class cocktail.utils.Draw {
	
	public static function rect (scope:Object, w:Number, h:Number, x:Number, y:Number, rgb:Number, alpha:Number):MovieClip {
		rgb = rgb || 0x000000;
		alpha = alpha == undefined ? 100 : alpha;
		
		var rect:MovieClip;
		var depth:Number;
		
		depth = scope.getNextHighestDepth();
		rect = scope.createEmptyMovieClip(depth + '_mc', scope.getNextHighestDepth());
		
		rect._x = x;
		rect._y = y;
		
		rect.beginFill(rgb, alpha);
		rect.lineTo(w, 0);
		rect.lineTo(w, h);
		rect.lineTo(0, h);
		rect.lineTo(0, 0);
		rect.endFill();
		
		return rect;
	}
}
