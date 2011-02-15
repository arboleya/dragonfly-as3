package  
{
	import dragonfly.shortcut.dragon;

	import com.robertpenner.easing.Expo;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	
	
	/**
	 * @author nybras | me@nybras.com
	 */
	public class ShortcutSingletonTest extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _rect1 : Sprite;
		private var _rect2 : Sprite;
		private var _rect3 : Sprite;
		private var _circle : Sprite;
		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function ShortcutSingletonTest()
		{
			_rect1 = new Sprite( );
			_rect1.graphics.beginFill( Math.random( ) * 0xFFFFFF );
			_rect1.graphics.drawRect( 0, 0, 50, 50 );
			addChild( _rect1 );
			
			_rect2 = new Sprite( );
			_rect2.graphics.beginFill( Math.random( ) * 0xFFFFFF );
			_rect2.graphics.drawRect( 0, 0, 50, 50 );
			_rect2 .y = 50;
			addChild( _rect2 );
			
			_rect3 = new Sprite( );
			_rect3.graphics.beginFill( Math.random( ) * 0xFFFFFF );
			_rect3.graphics.drawRect( 0, 0, 50, 50 );
			_rect3.y = 100;
			addChild( _rect3 );
			
			
			_circle = new Sprite();
			_circle.graphics.beginFill( 0 );
			_circle.graphics.drawCircle( 200, 200, 30);
			_circle.graphics.endFill();
			addChild( _circle );
			
			_circle.addEventListener( MouseEvent.ROLL_OVER, _over );
			_circle.addEventListener( MouseEvent.ROLL_OUT, _out );
		}

		private function _out( event : MouseEvent ) : void
		{
			dragon( _rect1 ).basic
				.x( 0 ).fly( .5, 0, Expo.easeOut );
			
			dragon( _rect2 ).basic
				.x( 0 ).fly( .5, 0, Expo.easeOut );
			
			dragon( _rect3 ).basic
				.x( 0 ).fly( .5, 0, Expo.easeOut );
		}

		private function _over( event : MouseEvent ) : void
		{
			dragon( _rect1 ).basic
				.x( 350 ).fly( .5, 0, Expo.easeOut );
			
			dragon( _rect2 ).basic
				.x( 350 ).fly( .5, 0, Expo.easeOut );
			
			dragon( _rect3 ).basic
				.x( 350 ).fly( .5, 0, Expo.easeOut );
		}
	}
}