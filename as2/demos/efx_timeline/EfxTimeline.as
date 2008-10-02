//* Dragonfly
import cocktail.utils.Delegate;
import dragonfly.body.Flight;
import dragonfly.plugins.efx.TimelineEfx;

//* Vendors
import com.robertpenner.easing.*;



class EfxTimeline {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	private var AnimeMc:MovieClip;
	private var RectBtn:MovieClip;
	
	private var timeline:TimelineEfx;
	private var flight:Flight;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 */
	public function EfxTimeline() {
		this.timeline = new TimelineEfx( this.AnimeMc );
		this.timeline.addFrameFunction( 35 , function () { trace ("FRAME FUNCTION 35 @ frame {"+ this.AnimeMc._currentframe +"}"); }, this );
		this.timeline.addFrameFunction( 27 , function () { trace ("FRAME FUNCTION 27 @ frame {"+ this.AnimeMc._currentframe +"}"); }, this );
		this.timeline.addFrameFunction( 28 , function () { trace ("FRAME FUNCTION 28 @ frame {"+ this.AnimeMc._currentframe +"}"); }, this );
		this.timeline.addFrameFunction( 15 , function () { trace ("FRAME FUNCTION 15 @ frame {"+ this.AnimeMc._currentframe +"}"); }, this );
		this.timeline.addFrameFunction( 40 , function () { trace ("FRAME FUNCTION 40 @ frame {"+ this.AnimeMc._currentframe +"}"); }, this );
		this.RectBtn.onRelease = Delegate.create ( this.rectOnRelease, this );
	}
	
	private function rectOnRelease () : Void {
		this.AnimeMc.gotoAndStop(1);
		this.timeline.play();
	}
	
	
	
	
	
	/** [PRIVATE - listeners] *********************************************************
	***********************************************************************************/ 
	
	/**
	 * Plays timeline forwards
	 */
	private function play ():Void {
		this.flight = this.timeline.play();
		this.flight.addCompleteListener( this.playBackwards, this );
	}
	
	/**
	 * Plays timeline backwards
	 */
	private function playBackwards ():Void {
		this.flight = this.timeline.playBackwards( Bounce.easeOut );
		this.flight.addCompleteListener(this.play, this);
	}
	
}