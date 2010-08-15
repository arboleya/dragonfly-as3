package  
{
	import dragonfly.Dragonfly;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.utils.getTimer;

	
	
	/**
	 * @author nybras | me@nybras.com
	 */	
	public class Performance extends Sprite 
	{
		private var _larvas : Array;
		
		private var _display : TextField;
		
		private var _time : Number;
		private var _fps : Number;

		public function Performance()
		{
			Dragonfly.boost = 40;
			init( 1500 );
		}
		
		public function init ( ammount : int ) : void
		{
			var i : int;
			
			_larvas = [];
			
			i = ammount;
			while( i-- )
				_larvas.push( new Rect( this ) );
			
			_time = getTimer();
			
			addChild( _display = new TextField() );
			addEventListener( Event.ENTER_FRAME, _fps_counter );
		}

		private function _fps_counter(event : Event) : void 
		{
			var diff : Number;
			
			diff = ( getTimer() - _time );
			
			if( diff >= 1000 )
			{
				_display.text = _fps.toString().substr( 0, 4 );
				_time = getTimer();
				_fps = 0;
			}
			
			_fps++;
		}
	}
}

import dragonfly.addons.basic.BasicLarva;

import com.robertpenner.easing.Cubic;

import flash.display.Sprite;



internal class Rect extends Sprite
{
	public var basic : BasicLarva;


	public function Rect( parent : Sprite ) 
	{
		parent.addChild( this );
		
		graphics.beginFill( Math.random() * 0xFFFFFF );
		graphics.drawRect( 0, 0, 5, 5 );
		
		basic = new BasicLarva( this );
		
		_tween();
	}
	
	public function _tween () : void
	{
		var scale:Number;
		var duration : Number;
		var r : Function;
		var angle : Number;
		var delay : Number;
		var radius : Number;
		
		r = Math.random;
		
		x = 250;
		y = 195;
		scaleX = scaleY = .05;
		
		duration = .5;
		scale = r() * 2.5 + 0.5;
		angle = r() * Math.PI * 2;
		delay = r() * duration;
		
		radius = 300 + ( 200 * Math.random()  );
		
		basic
			.xy( x + Math.cos( angle ) * radius, x + Math.sin( angle ) * radius )
			.xyscale( scale, scale )
			.rotation( r() * 360  )
			.fly( .5, delay, Cubic.easeIn, null )
			.complete( _tween );
	}
}