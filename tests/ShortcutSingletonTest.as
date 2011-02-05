package  
{
	import dragonfly.shortcut.dragon;

	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	
	
	/**
	 * @author nybras | me@nybras.com
	 */
	public class ShortcutSingletonTest extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _rect1 : Sprite;
		private var _rect2 : Sprite;
		private var _rect3 : Sprite;
		
		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function ShortcutSingletonTest()
		{
			stage.addEventListener( KeyboardEvent.KEY_DOWN, _mount_unmount );
			
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
		}

		private function _mount_unmount( event : KeyboardEvent ) : void
		{
			switch( event.keyCode )
			{
				case Keyboard.RIGHT: _right(); break;
				case Keyboard.LEFT: _left(); break;
			}
		}

		private function _left() : void
		{
			dragon( _rect1 ).basic
				.x( 0 ).fly( .25, 0 );
				
			dragon( _rect2 ).basic
				.x( 0 ).fly( .25, 0 );
				
			dragon( _rect3 ).basic
				.x( 0 ).fly( .25, 0 );
		}

		private function _right() : void
		{
			dragon( _rect1 ).basic
				.x( 350 ).fly( .25, 0 );
				
			dragon( _rect2 ).basic
				.x( 350 ).fly( .25, 0 );
				
			dragon( _rect3 ).basic
				.x( 350 ).fly( .25, 0 );
		}
	}
}