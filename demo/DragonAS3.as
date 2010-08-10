package  
{
	import dragonfly.addons.basic.BasicLarva;
	import dragonfly.addons.filters.FilterLarva;

	import com.robertpenner.easing.Expo;
	import com.robertpenner.easing.Quint;

	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.getTimer;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class DragonAS3 extends Sprite 
	{
		private var _container : MovieClip;

		private var _basic : BasicLarva;

		private var _filter : FilterLarva;

		private var _loader : Loader;

		private var _bmpdata : BitmapData;
		private var _start_timer : int;

		
		
		public function DragonAS3()
		{
			addChild( _container = new MovieClip( ) );
			
			_loader = new Loader( );
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, _init );
			_loader.load( new URLRequest( "dragonfly.jpg" ) );
			_loader.scaleX = .5;
			_loader.scaleY = .5;
		}

		private function _init( event : Event ) : void 
		{
			_bmpdata = new BitmapData( _loader.width, _loader.height );
			// _bmpdata.draw( _loader.content );
			// _container.addChild( new Bitmap( _bmpdata, "auto", true ) );
			_container.addChild( _loader );
			
			basic_example( );
//			filter_example( );
		}

		private function basic_example() : void 
		{
			_basic = new BasicLarva( _container );
			_basic
				.x( 200 )
//				.y( 200 )
//				.z( -1 )
//				.alpha( 1, 0 )
				.fly( .5, 0, Expo.easeOut )
				.start( _start ).progress( _progress ).complete( _complete  );
		}

		private function filter_example() : void 
		{
			_filter = new FilterLarva( _container );
			_filter
				.blur
					.conf( 4 )
					.xy( 4, 4 )
					.close
				.bevel
					.conf( "full", false, 3 )
					.distance( 8 )
					.angle( 145, 0 )
					.highlight_color( 0xFFFFFF, 0xFFFFFF )
					.highlight_alpha( 1 )
					.shadow_color( 0x000000 )
					.shadow_alpha( 1 )
					.blur_xy( 10, 10 )
					.strength( 1 )
					.close
				.convolution
					.conf( true, true, 3, 3, undefined, undefined )
					.matrix( [ -4, -2, 0, -2, 1, 2, 0, 2, 4 ] )
					.divisor( 1 )
					.bias( 0 )
					.close
				.displacement_map
					.close
				.dropshadow
					.conf( false, false, false, 3 )
					.distance( 15, 0 )
					.angle( 180, 90 )
					.color( 0x000033, 0x000033 )
					.alpha( 1, .8 )
					.blur_x( 10, 0 )
					.blur_y( 10, 0 )
					.strength( 1, 1 )
					.close
				.glow
					.conf( false, false, 3 )
					.color( 0x00CC99, 0xFFFFFF )
					.alpha( .5, 0 )
					.blur_x( 15, 0 )
					.blur_y( 15, 0 )
					.strength( 5, 5 )
					.close
				.gradient_bevel
					.conf( [ 0xFFFFFF, 0xCCCCCC, 0x000000 ], [ 1, 0, 1 ], [ 0, 128, 255 ], "outer", false, 3 )
					.distance( 15, 0 )
					.angle( 360, 0 )
					.blur_xy( 10, 10, 0, 0 )
					.strength( 2, 0 )
					.close
				.gradient_glow
					.conf( [ 0xFFFFFF, 0xFF0000, 0xFFFF00, 0x00CC00 ], [ 0, 1, 1, 0.3 ], [ 0, 63, 126, 255 ], "multiply", false, 3 )
					.distance( 5, 0 )
					.angle( 360, 0 )
					.blur_xy( 10, 10, 0, 0 )
					.strength( 2, 1 )
					.close
				.fly( 2, 0, Quint.easeOut );
//				.add( _complete, _progress, _start );
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