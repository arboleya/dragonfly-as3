package ; 

import dragonfly.addons.basic.BasicLarva;

import com.robertpenner.easing.Expo;

import flash.display.Sprite;
import flash.events.Event;


/**
 * @author nybras | nybras@codeine.it
 */
class BasicDemo 
{
	/* ----- MAIN -------------------------------------------------- */
	
	static function main()
	{
		new BasicDemo();
	}
	
	
	/* ----- VARIABLES -------------------------------------------------- */
	private var _basic : BasicLarva;
	private var _rect : Sprite;

	
	
	/* ----- INITIALIZING ----------------------------------------------- */
	public function new()
	{
		flash.Lib.current.addChild( _rect = new Sprite( ) );
		
		_rect.graphics.beginFill( cast Math.random( ) * 0xFFFFFF );
		_rect.graphics.drawRect( 0, 0, 50, 50 );
		
		_basic = new BasicLarva( _rect );
		_basic
			.x( 500 )
			.y( 100 )
			.xyscale( 1.5, 1.5 )
			.rotation( 90 )
			.fly( .3, 1, Expo.easeOut )
			.on_start( _start ).on_progress( _progress ).on_complete( _complete );
	}

	/* ----- LISTENERS -------------------------------------------------- */
	private function _complete() : Void 
	{
		trace( "complete!" );
	}

	private function _progress() : Void 
	{
		trace( "progress!" );
	}

	private function _start() : Void 
	{
		trace( "start!" );
	}
}