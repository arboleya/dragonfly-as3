//* Dragonfly
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.MovieClipFlightEvent;
import dragonfly.plugins.larvas.MovieClipLarva;

//* Vendors
import com.robertpenner.easing.*;



class MultipleTweens {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/
	
	// movieclips
	private var RectMc : MovieClip;
	
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
	function MultipleTweens () {
		var flight : Flight;
		
		this.larva = new MovieClipLarva( this.RectMc );
		
		flight = this.larva.xy(0, 0, 200, 200, 1200, 1000, Elastic.easeOut, null, true );
		
		flight.addStartListener( this.flight_onStart, this );
		flight.addUpdateListener( this.flight_onUpdate, this );
		flight.addCompleteListener( this.flight_onComplete, this );
	}
	
	
	
	
	
	/** [LISTENERS] *******************************************************************
	***********************************************************************************/ 
	
	private function flight_onStart ( event : MovieClipFlightEvent ):Void {
		this.startTime = getTimer();
		trace( "\rSTART ================================== " );
		trace ( "x,y = " + [ event.X, event.Y ] );
	}
	
	private function flight_onUpdate ( event : MovieClipFlightEvent ):Void {
		trace( "\rUPDATE ================================= " );
		trace ( "x,y = "+ [ event.X, event.Y ] );
	}
	
	private function flight_onComplete ( event : MovieClipFlightEvent ):Void {
		this.endTime = getTimer();
		trace( "\rCOMPLETE =============================== " );
		trace ( "x,y = "+ [ event.X, event.Y ] );
		trace ( "\r\r ----------> ( duration: "+ ( this.endTime - this.startTime ) +" )" );
	}
}
