//* Dragonfly
import cocktail.utils.Delegate;
import dragonfly.body.Flight;
import dragonfly.body.Larva;
import dragonfly.plugins.efx.TimelineEfx;

//* Vendors
//import com.robertpenner.easing.*;



class EfxTimelineButtons {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	private var Ball1Btn:MovieClip;
	private var Ball2Btn:MovieClip;
	private var Ball3Btn:MovieClip;
	
	private var Timeline1:TimelineEfx;
	private var Timeline2:TimelineEfx;
	private var Timeline3:TimelineEfx;
	
	private var Larva1:Larva;
	private var Larva2:Larva;
	private var Larva3:Larva;
	
	private var flight:Flight;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 */
	public function EfxTimelineButtons() {
		this.Timeline1 = new TimelineEfx( this.Ball1Btn );
		this.Timeline2 = new TimelineEfx( this.Ball2Btn );
		this.Timeline3 = new TimelineEfx( this.Ball3Btn );
		
		this.Larva1 = new Larva( this.Ball1Btn );
		this.Larva2 = new Larva( this.Ball2Btn );
		this.Larva3 = new Larva( this.Ball3Btn );
		
		this.Ball1Btn.onRollOver = Delegate.create( this.button_onRollOver, this, [ this.Ball1Btn ]);
		this.Ball2Btn.onRollOver = Delegate.create( this.button_onRollOver, this, [ this.Ball2Btn ]);
		this.Ball3Btn.onRollOver = Delegate.create( this.button_onRollOver, this, [ this.Ball3Btn ]);
		
		this.Ball1Btn.onRollOut = Delegate.create( this.button_onRollOut, this, [ this.Ball1Btn ]);
		this.Ball2Btn.onRollOut = Delegate.create( this.button_onRollOut, this, [ this.Ball2Btn ]);
		this.Ball3Btn.onRollOut = Delegate.create( this.button_onRollOut, this, [ this.Ball3Btn ]);
		
		this.Ball1Btn.onDragOut = this.Ball1Btn.onRollOut;
		this.Ball2Btn.onDragOut = this.Ball2Btn.onRollOut;
		this.Ball3Btn.onDragOut = this.Ball3Btn.onRollOut;
	}
	
	
	private function button_onRollOver ( callerBtn : MovieClip ) : Void {
		switch ( callerBtn ) {
			case this.Ball1Btn:
				//this.Larva1.frame(null , 20 , 500 , 0 , Linear.easeNone);
				this.Timeline1.play();
			break;
			
			case this.Ball2Btn:
				//this.Larva2.frame(null , 20 , 500 , 0 , Linear.easeNone);
				this.Timeline2.play();
			break;
			
			case this.Ball3Btn:
				//this.Larva3.frame(null , 20 , 500 , 0 , Linear.easeNone);
				this.Timeline3.play();
			break;
		}
	}
	
	private function button_onRollOut ( callerBtn : MovieClip ) : Void {
		switch ( callerBtn ) {
			case this.Ball1Btn:
				//this.Larva1.frame(null , 1 , 500 , 0 , Linear.easeNone);
				this.Timeline1.playBackwards();
			break;
			
			case this.Ball2Btn:
				//this.Larva2.frame(null , 1 , 500 , 0 , Linear.easeNone);
				this.Timeline2.playBackwards();
			break;
			
			case this.Ball3Btn:
				//this.Larva3.frame(null, 1, 500, 0, Linear.easeNone);
				this.Timeline3.playBackwards();
			break;
		}
	}
}