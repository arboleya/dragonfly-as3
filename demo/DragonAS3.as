package  
{
	import dragonfly.addons.basic.BasicLarva;
	import dragonfly.addons.filters.FilterLarva;
	import dragonfly.core.gunz.FlightBullet;

	import com.robertpenner.easing.Expo;
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
	public class DragonAS3 extends Sprite 
	{
		private var _container : MovieClip;
		private var _basic : BasicLarva;
		private var _filter : FilterLarva;
		private var _loader : Loader;
		private var _bmpdata : BitmapData;

		
		
		public function DragonAS3()
		{
			addChild( _container = new MovieClip( ) );
			
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, _init );
			_loader.load( new URLRequest( "dragonfly.jpg" ) );
			_loader.scaleX = .5;
			_loader.scaleY = .5;
		}

		private function _init( event : Event ) : void 
		{
			_bmpdata = new BitmapData( _loader.width, _loader.height );
//			_bmpdata.draw( _loader.content );
//			_container.addChild( new Bitmap( _bmpdata, "auto", true ) );
			_container.addChild( _loader );
			
			basic_example();
			filter_example();
		}
		
		private function basic_example() : void 
		{
			_basic = new BasicLarva( _container );
			_basic
				.x( 200 )
				.y( 200 )
				.z( -1 )
				.alpha( 1, 0 )
				.fly( .5, 0, Expo.easeOut )
				.add( _complete, _progress, _start );
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
					.matrix( [-4, -2, 0, -2, 1, 2, 0, 2, 4] )
					.divisor( 1 )
					.bias( 0 )
					.close
				.displacement_map
					.close
				.dropshadow
					.conf( false, false, false, 3 )
					.distance( 15, 0)
					.angle( 180, 90 )
					.color( 0x000033, 0x000033 )
					.alpha( 1, .8 )
					.blur_x( 10, 0 )
					.blur_y( 10, 0 )
					.strength( 1 ,1 )
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
					// code example here
					.close
				.gradient_glow
					// code example here
					.close
				.fly( 2, 0, Quint.easeOut )
				.add( _complete, _progress, _start );
		}
		
		/* ----- LISTENERS -------------------------------------------------- */
		private function _complete( bullet : FlightBullet ) : void 
		{
//			trace( "complete "+ bullet );
			trace( "complete "+ bullet.target, bullet.prop, bullet.value );
		}

		private function _progress( bullet : FlightBullet ) : void 
		{
//			trace( "progress "+ bullet );
			trace( "progress "+ bullet.target, bullet.prop, bullet.value );
		}

		private function _start( bullet : FlightBullet ) : void 
		{
//			trace( "start "+ bullet );
			trace( "start "+ bullet.target, bullet.prop, bullet.value );
		}
	}
}