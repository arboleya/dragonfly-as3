package  
{
	import dragonfly.addons.color.ColorLarva;

	import com.robertpenner.easing.Elastic;

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.getTimer;

	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Colors extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _container : MovieClip;
		private var _start_timer : Number;



		/* ----- INITIALIZING ----------------------------------------------- */
		public function Colors()
		{
			var color : ColorLarva;
			
//			Dragonfly.boost = 100;
			
			addChild( _container = new MovieClip( ) );
			_container.graphics.beginFill( 0x000000, 1 );
			_container.graphics.drawRect( 0, 0, 150, 150 );
			_container.x = 200;
			_container.y = 100;
			
			_start_timer = getTimer();
			
			color = new ColorLarva( _container );
			color
				.hex( 0xCC00FF, 0x000000 )
				.fly( 5, 0, Elastic.easeOut )
				.complete( _complete ).progress( _progress ).start( _start );
		}



		/* ----- LISTENERS -------------------------------------------------- */
		private function _complete() : void 
		{
			trace( "complete! @ "+ ( getTimer() - _start_timer ) );
		}

		private function _progress() : void 
		{
			trace( "progress!");
		}

		private function _start() : void 
		{
			_start_timer = getTimer();
			trace( "start!");
		}
	}
}