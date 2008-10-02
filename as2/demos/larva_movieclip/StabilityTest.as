//* Dragonfly;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.MovieClipLarva;
import dragonfly.plugins.larvas.events.MovieClipFlightEvent;

//* Vendors
import com.robertpenner.easing.*;
import cocktail.utils.Delegate;



class StabilityTest {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	// movieclips
	private var BallMc:MovieClip;
	private var Mount:MovieClip;
	private var Unmount:MovieClip;
	
	// larvas
	private var BallMc_Larva : MovieClipLarva;
	
	// benchmark purposes
	private var startTime:Number;
	private var endTime:Number;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 */
	function StabilityTest () {
		this.BallMc_Larva = new MovieClipLarva (this.BallMc);
		Mouse.addListener( {
			onMouseDown:Delegate.create(this.mount, this),
			onMouseUp:Delegate.create(this.unmount, this)
		});
	}
	
	
	
	
	
	/** [MOUNT / UNMOUNT] *************************************************************
	***********************************************************************************/ 
	
	/**
	 * Mount the movieclip
	 */
	private function mount ():Void {
		var flight:Flight;
		
		this.BallMc_Larva.alpha(null, 100, 100, 0, Expo.easeOut);
		
		flight = this.BallMc_Larva.y(null, 0, 1000, 0, Expo.easeOut);
		
		flight.addStartListener(this.mount_onStart, this);
		flight.addUpdateListener(this.mount_onUpdate, this);
		flight.addCompleteListener(this.mount_onComplete, this);
	}
	
	/**
	 * Unmount the movieclip
	 */
	private function unmount ():Void {
		var flight:Flight = new Flight();
		
		this.BallMc_Larva.alpha(null, 0, 1000, 0, Expo.easeOut);
		
		flight = this.BallMc_Larva.y(null, 438, 1000, 0, Expo.easeOut);
		
		flight.addStartListener(this.unmount_onStart, this);
		flight.addUpdateListener(this.unmount_onUpdate, this);
		flight.addCompleteListener(this.unmount_onComplete, this);
		
		/* debug purposes
			flight.addStartListener(this.unmount_onStart, this);
			flight.addUpdateListener(this.unmount_onUpdate, this);
			flight.addCompleteListener(this.unmount_onComplete, this);
			
			this.BallMc_Larva.setDefaultFlight(flight);
			
			this.BallMc_Larva.alpha(null, 0, 700, 0, Linear.easeOut);
			this.BallMc_Larva.y(null, 483, 700, 0, Linear.easeOut);
		*/
	}
	
	
	
	
	
	/** [LISTENERS] *******************************************************************
	***********************************************************************************/ 
	
	// mount flight listeners
	private function mount_onStart ( event : MovieClipFlightEvent) : Void {
		this.startTime = getTimer();
		trace( "\rMOUNT-START ( y = " + event.Y +" )" );
	}
	
	private function mount_onUpdate ( event : MovieClipFlightEvent ):Void {
		trace( "MOUNT-UPDATE ( y = ( " + event.Y +" )" );
	}
	
	private function mount_onComplete ( event : MovieClipFlightEvent ):Void {
		this.endTime = getTimer();
		trace( "MOUNT-COMPLETE ( y = ( " + event.Y +" )" );
		trace ( "----------> ( duration: "+ ( this.endTime - this.startTime ) +" )" );
	}
	
	
	
	// unmount event listeners
	private function unmount_onStart ( event : MovieClipFlightEvent ):Void {
		this.startTime = getTimer();
		trace( "\rUNMOUNT-START ( y = " + event.Y +" )" );
	}
	private function unmount_onUpdate ( event : MovieClipFlightEvent ):Void {
		trace( "UNMOUNT-UPDATE ( y = ( " + event.Y +" )" );
	}
	private function unmount_onComplete ( event : MovieClipFlightEvent ):Void {
		this.endTime = getTimer();
		trace( "UNMOUNT-COMPLETE ( y = " + event.Y +" )" );
		trace ( "----------> ( duration: "+ ( this.endTime - this.startTime ) +" )" );
	}
}
