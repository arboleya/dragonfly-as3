package  
{
	import dragonfly.addons.basic.BasicLarva;

	import com.robertpenner.easing.Cubic;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.getTimer;

	/**
	 * @author nybras | me@nybras.com
	 */
	public class Timing extends Sprite 
	{
		private var _timer : int;

		public function Timing()
		{
//			Dragonfly.boost = 30;
			_dragonfly( );
		}
		
		private function _dragonfly() : void 
		{
			var s : MovieClip;
			var tmp : BasicLarva;
			
			s = new MovieClip( );
			s.graphics.beginFill( Math.random( ) * 0xFFFFFF );
			s.graphics.drawRect( 0, 0, 50, 50 );
			addChild( s );
			
			trace( "---\nSTART: " + 0 );
			tmp = new BasicLarva( s );
			_timer = getTimer( );
			tmp.x( 500 ).fly( .5, 0, Cubic.easeIn ).on_complete( _out_dragon, [tmp] );
		}

		private function _in_dragon( larva : BasicLarva ) : void 
		{
			trace( "---\nIN: " + ( getTimer( ) - _timer ) );
			larva.x( 500 ).fly( .5, 0, Cubic.easeIn ).on_complete( _out_dragon, [ larva ] );
			_timer = getTimer( );
		}

		private function _out_dragon( larva : BasicLarva ) : void 
		{
			trace( "OUT: " + ( getTimer( ) - _timer ) );
			_timer = getTimer( );
			larva.x( 0 ).fly( .5, 0, Cubic.easeIn ).on_complete( _in_dragon, [larva] );
		}
	}
}