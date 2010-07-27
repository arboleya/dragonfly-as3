package  
{
	import cocktail.core.gunz.Bullet;

	import dragonfly.addons.basic.BasicLarva;

	import com.robertpenner.easing.Expo;

	import flash.display.Sprite;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class DragonAS3 extends Sprite 
	{
		private var _rect : Sprite;

		private var _motion : BasicLarva;

		
		
		public function DragonAS3()
		{
			_rect = new Sprite( );
			_rect.graphics.beginFill( 0xFF0000, 1 );
			_rect.graphics.drawRect( 0, 0, 100, 100 );
			
			addChild( _rect );
			
			_motion = new BasicLarva( _rect );
			_motion
				.x( 200 )
				.y( 200 )
				.alpha( 1 )
				.fly( 1, 0, Expo.easeOut )
					.add( _complete, _progress, _start );
		}

		private function _complete( bullet : Bullet ) : void 
		{
			trace( "complete", bullet );
		}

		private function _progress( bullet : Bullet ) : void 
		{
			trace( "progress", bullet );
		}

		private function _start( bullet : Bullet ) : void 
		{
			trace( "start", bullet );
		}
	}
}