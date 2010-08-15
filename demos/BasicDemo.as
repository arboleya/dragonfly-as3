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
	public class BasicDemo extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _loader : Loader;
		private var _basic : BasicLarva;
		private var _container : MovieClip;
		private var _start_timer : Number;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function BasicDemo()
		{
			addChild( _container = new MovieClip( ) );
			_container.addChild( _loader = new Loader( ) );
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, _init );
			_loader.load( new URLRequest( "dragonfly.jpg" ) );
			_loader.scaleX = .5;
			_loader.scaleY = .5;
		}

		/* ----- INITIALIZING ----------------------------------------------- */
		private function _init( event : Event ) : void 
		{
			_start_timer = getTimer( );
			_basic = new BasicLarva( _container );
			_basic
				.x( 500 )
				.y( 100 )
				.xyscale( 1.5, 1.5 )
				.rotation( 90 )
				.fly( 1, 1, Expo.easeOut )
				.on_start( _start ).on_progress( _progress ).on_complete( _complete );
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