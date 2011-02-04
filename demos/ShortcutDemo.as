package  
{
	import flash.filters.BlurFilter;
	import dragonfly.shortcut.dragon;

	import com.robertpenner.easing.Cubic;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	
	
	/**
	 * @author nybras | me@nybras.com
	 */
	public class ShortcutDemo extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _rect1 : Sprite;
		private var _rect2 : Sprite;
		private var _rect3 : Sprite;
		
		private var _crystal : Sprite;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function ShortcutDemo()
		{
			
			_crystal = new Sprite();
			_crystal.graphics.beginFill( 0xFF0000 );
			_crystal.graphics.drawCircle( 200, 200, 30);
			_crystal.graphics.endFill();
			
			_crystal.addEventListener( MouseEvent.ROLL_OVER, _on_over );
			_crystal.addEventListener( MouseEvent.ROLL_OUT, _on_ut );
			
			_crystal.filters = [ new BlurFilter( 8, 8 ) ];
			addChild( _crystal );
			
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

		private function _on_ut( event : MouseEvent ) : void
		{
			dragon( _rect1 ).basic
				.x( 0 ).fly( .5, 0 );
				
			dragon( _rect2 ).basic
				.x( 0 ).fly( .25, 0 );
				
			dragon( _rect3 ).basic
				.x( 0 ).fly( .25, 0 );
		}

		private function _on_over( event : MouseEvent ) : void
		{
			dragon( _rect1 ).basic
				.x( 350 ).fly( .25, 0 );
				
			dragon( _rect2 ).basic
				.x( 350 ).fly( .25, 0 );
				
			dragon( _rect3 ).basic
				.x( 350 ).fly( .25, 0 );
		}

		/* ----- LISTENERS -------------------------------------------------- */
		private function _complete() : void 
		{
			//trace( "complete!" );
		}

		private function _progress() : void 
		{
			//trace( "progress!" );
		}

		private function _start() : void 
		{
			//trace( "start!" );
		}
	}
}