//* Dragonfly
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.MovieClipLarva;
import dragonfly.plugins.larvas.events.MovieClipFlightEvent;

//* Cocktail
import cocktail.utils.Delegate;

//* Vendors
import com.robertpenner.easing.*;



class SingleTween {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	// movieclips
	private var RectMc : MovieClip;
	private var X50Btn : MovieClip;
	private var X100Btn : MovieClip;
	private var X150Btn : MovieClip;
	private var X200Btn : MovieClip;
	
	// larvas
	private var larva : MovieClipLarva;
	
	// benchmark purposes
	private var startTime : Number;
	private var endTime : Number;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 */
	function SingleTween () {
		this.larva = new MovieClipLarva( this.RectMc );
		
		this.X50Btn.onRelease = Delegate.create ( this.btn_onRelease, this, 50);
		this.X100Btn.onRelease = Delegate.create ( this.btn_onRelease, this, 100);
		this.X150Btn.onRelease = Delegate.create ( this.btn_onRelease, this, 150);
		this.X200Btn.onRelease = Delegate.create ( this.btn_onRelease, this, 200);
	}
	
	
	
	
	
	/** [TRIGGERS] ********************************************************************
	***********************************************************************************/ 
	
	/**
	 * 
	 * @param	x	Final x to animation
	 */
	private function btn_onRelease ( x : Number ) : Void {
		var flight : Flight;
		
		flight = this.larva.x( null, x, 500, 0, Expo.easeOut );
		
		flight.addStartListener ( this.flight_onStart, this, x );
		flight.addUpdateListener ( this.flight_onUpdate, this, x );
		flight.addCompleteListener ( this.flight_onComplete, this, x );
	}
	
	
	
	
	
	/** [LISTENERS] *******************************************************************
	***********************************************************************************/ 
	
	// mount flight listeners
	private function flight_onStart ( event : MovieClipFlightEvent ):Void {
		this.startTime = getTimer();
		trace( "\rSTART ================================== " );
		trace ( "x = " + event.X );
	}
	
	private function flight_onUpdate ( event : MovieClipFlightEvent ):Void {
		trace( "\rUPDATE ================================= " );
		trace ( "x = " + event.X );
	}
	
	private function flight_onComplete ( event : MovieClipFlightEvent ):Void {
		this.endTime = getTimer();
		trace( "\rCOMPLETE =============================== " );
		trace ( "x = " + event.X );
		trace ( "\r\r ----------> ( duration: "+ ( this.endTime - this.startTime ) +" )" );
	}
}
