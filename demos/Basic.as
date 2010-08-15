package  
{
	import dragonfly.addons.basic.BasicLarva;

	import com.robertpenner.easing.Expo;

	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.getTimer;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Basic extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _loader : Loader;
		private var _basic : BasicLarva;
		private var _container : MovieClip;
		private var _start_timer : Number;
		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function Basic()
		{
//			Dragonfly.boost = 100;
			
			addChild( _container = new MovieClip( ) );
			
			_loader = new Loader( );
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, _init );
			_loader.load( new URLRequest( "dragonfly.jpg" ) );
			_loader.scaleX = .5;
			_loader.scaleY = .5;
		}


		/* ----- INITIALIZING ----------------------------------------------- */
		private function _init( event : Event ) : void 
		{
			_container.addChild( _loader );
			
			_start_timer = getTimer();
			
			_basic = new BasicLarva( _container );
			_basic
				.x( 500 )
				.y( 100 )
				.alpha( 1, 0 )
				.rotation( 90 )
				.fly( 1, 0, Expo.easeOut )
				.start( _start ).progress( _progress ).complete( _complete  );
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
			trace( "start!");
		}
	}
}