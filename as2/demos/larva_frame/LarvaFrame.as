//* Dragonfly
import cocktail.utils.Delegate;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.FrameFlightEvent;
import dragonfly.plugins.larvas.FrameLarva;

//* Vendors
import com.robertpenner.easing.*;



class LarvaFrame {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	private var AnimeMc:MovieClip;
	private var RectBtn:MovieClip;
	
	private var larva:FrameLarva;
	private var flight:Flight;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 */
	public function LarvaFrame() {
		this.larva = new FrameLarva( this.AnimeMc );
		this.RectBtn.onRelease = Delegate.create ( this.rect_onRelease, this );
	}
	
	
	
	
	
	/** [TRIGGERS] ********************************************************************
	***********************************************************************************/ 
	
	/**
	 * rect trigger : onRelease
	 */
	private function rect_onRelease () : Void {
		this.AnimeMc.gotoAndStop(1);
		var flight : Flight = this.larva.frame( null, this.AnimeMc._totalframes, 5000, 1000, Bounce.easeInOut );
		flight.addUpdateListener( this.flight_onUpdate, this );
	}
	
	function flight_onUpdate ( evt : FrameFlightEvent ) : Void {
		trace ( evt.FRAME );
	}
}