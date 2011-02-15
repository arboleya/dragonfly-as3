package  
{
	import dragonfly.shortcut.dragon;

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;

	
	
	/**
	 * @author nybras | me@nybras.com
	 */
	public class CrazyMonkeyTest extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _rect : Sprite;
		private var _circle : Sprite;
		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function CrazyMonkeyTest()
		{
			_rect = new Sprite( );
			_rect.graphics.beginFill( Math.random( ) * 0xFFFFFF );
			_rect.graphics.drawRect( 0, 0, 50, 50 );
			addChild( _rect );
			
			_circle = new Sprite();
			_circle.graphics.beginFill( 0xFF0000 );
			_circle.graphics.drawCircle( 200, 50, 30);
			_circle.graphics.endFill();
			
			_circle.addEventListener( MouseEvent.ROLL_OVER, _on_over );
			_circle.addEventListener( MouseEvent.ROLL_OUT, _on_out );
			_circle.filters = [ new BlurFilter( 8, 8 ) ];
			addChild( _circle );
		}

		private function _on_over( event : MouseEvent ) : void
		{
			dragon( _rect ).basic
				.xyscale( 1, 1, 2, 2 ).fly( 1.2, 0 );
		}

		private function _on_out( event : MouseEvent ) : void
		{
			dragon( _rect ).basic
				.xyscale( .5, .5 ).fly( 1, 0 );
		}
	}
}