package  
{
	import dragonfly.shortcut.dragon;

	import com.robertpenner.easing.Cubic;

	import flash.display.Sprite;

	
	
	/**
	 * @author nybras | me@nybras.com
	 */
	public class Shortcut extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _rect : Sprite;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function Shortcut()
		{
			_rect = new Sprite( );
			_rect.graphics.beginFill( Math.random( ) * 0xFFFFFF );
			_rect.graphics.drawRect( 0, 0, 50, 50 );
			addChild( _rect );
			
			dragon( _rect ).basic
				.x( 350 ).fly( .5, 0, Cubic.easeIn )
				.on_start( _start )
				.on_progress( _progress )
				.on_complete( _complete );
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