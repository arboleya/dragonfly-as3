package  
{
	import dragonfly.addons.color.ColorLarva;

	import com.robertpenner.easing.Elastic;

	import flash.display.MovieClip;
	import flash.display.Sprite;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class ColorDemo extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _rect : MovieClip;
		private var _color : ColorLarva;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function ColorDemo()
		{
			addChild( _rect = new MovieClip( ) );
			_rect.graphics.beginFill( 0 );
			_rect.graphics.drawRect( 0, 0, 150, 150 );
			_rect.x = 200;
			_rect.y = 100;
			
			_color = new ColorLarva( _rect );
			_color
				.hex( Math.random( ) * 0xFFFFFF )
				.fly( 3.5, 1, Elastic.easeOut )
				.on_complete( _complete )
				.on_progress( _progress )
				.on_start( _start );
		}

		/* ----- LISTENERS -------------------------------------------------- */
		private function _complete() : void 
		{
			trace( "complete!" );
		}

		private function _progress() : void 
		{
			trace( "progress!" );
		}

		private function _start() : void 
		{
			trace( "start!" );
		}
	}
}