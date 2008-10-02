
import cocktail.utils.Delegate;
import dragonfly.body.Flight;

import com.robertpenner.easing.*;

import dragonfly.plugins.larvas.ColorLarva;
import dragonfly.plugins.larvas.events.ColorFlightEvent;



class LarvaColor {
	
	private var BallMc : MovieClip;
	
	private var TransformBtn : MovieClip;
	private var BlueBtn : MovieClip;
	private var PinkBtn : MovieClip;
	private var LemonBtn : MovieClip;
	
	private var HexaTxt : TextField;
	
	private var larva : ColorLarva;
	private var flight : Flight;
	
	
	
	public function LarvaColor() {
		this.larva = new ColorLarva ( this.BallMc );
		this.TransformBtn.onRelease = Delegate.create( this.TransformBtn_onRelease, this );
		this.BlueBtn.onRelease = Delegate.create( this.setColor, this, "0x0000FF" );
		this.PinkBtn.onRelease = Delegate.create( this.setColor, this, "0xCC0099" );
		this.LemonBtn.onRelease = Delegate.create( this.setColor, this, "0x99FF33"  );
	}
	
	private function setColor ( color : String ) : Void {
		this.HexaTxt.text = color;
		this.TransformBtn_onRelease();
	}
	
	
	private function TransformBtn_onRelease () : Void {
		this.flight = this.larva.hex(null, parseInt( HexaTxt.text ), 1500, 0, Bounce.easeOut);
		this.flight.addStartListener( start, this );
		this.flight.addUpdateListener( update, this );
		this.flight.addCompleteListener( complete, this );
	}
	
	public function start ( event : ColorFlightEvent ) : Void {
		trace ( "RGB: "+ [ event.RGB.r, event.RGB.g, event.RGB.b ] );
	}
	
	public function update ( event : ColorFlightEvent ) {
		trace ( "RGB: "+ [ event.RGB.r, event.RGB.g, event.RGB.b ] );
	}
	
	public function complete ( event : ColorFlightEvent ) {
		trace ( "RGB: "+ [ event.RGB.r, event.RGB.g, event.RGB.b ] );
	}
	
}