package  
{
	import dragonfly.Dragonfly;
	import dragonfly.addons.filters.FilterLarva;

	import com.robertpenner.easing.Quint;

	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class FilterDemo extends Sprite 
	{
		/* ----- VARIABLES -------------------------------------------------- */
		private var _loader : Loader;
		private var _container : MovieClip;
		private var _filter : FilterLarva;
		private var _bmpdata : BitmapData;

		
		
		/* ----- INITIALIZING ----------------------------------------------- */
		public function FilterDemo()
		{
			Dragonfly.boost = 100;
			
			addChild( _container = new MovieClip( ) );
			
			_loader = new Loader( );
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, _init );
			_loader.load( new URLRequest( "dragonfly.jpg" ) );
			_loader.x = 120;
			_loader.y = 120;
			_loader.scaleX = .6;
			_loader.scaleY = .6;
		}

		private function _init( event : Event ) : void 
		{
			_bmpdata = new BitmapData( _loader.width, _loader.height );
			// _bmpdata.draw( _loader.content );
			// _container.addChild( new Bitmap( _bmpdata, "auto", true ) );
			_container.addChild( _loader );
			
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
					.highlight_color( 0xCCCC00, 0xFFFFFF )
					.highlight_alpha( .5 )
					.shadow_color( 0xFF0000, 0x000000 )
					.shadow_alpha( .3 )
					.blur_xy( 10, 10 )
					.strength( 1 )
					.close
//				.convolution
//					.conf( true, true, 3, 3, undefined, undefined )
//					.matrix( [ -4, -2, 0, -2, 1, 2, 0, 2, 4 ] )
//					.divisor( 1 )
//					.bias( 0 )
//					.close
//				.displacement_map
//					.close
				.dropshadow
					.conf( false, false, false, 3 )
					.distance( 15, 0 )
					.angle( 180, 90 )
					.color( 0xFF0000, 0x000033 )
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
				.fly( 3.5, .5, Quint.easeOut )
				.on_complete( _complete ).on_progress( _progress ).on_start( _start );
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