//* Cocktail
import cocktail.lib.events.EventDispatcher;
import cocktail.lib.events.Mp3StreamEvent;
import cocktail.lib.status.Status;
import cocktail.utils.Delegate;
import cocktail.utils.SetTimeout;



class cocktail.utils.Mp3Stream extends EventDispatcher {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	private var audioContainer : MovieClip;
	private var soundContainer : Sound;
	
	private var autoPlay : Boolean;
	private var isStream : Boolean;
	private var repeat : Boolean;
	private var status : String;
	
	private var seekedTime : Number;
	private var loadInterval : Number;
	private var playInterval : Number;
	private var seekTimeout : SetTimeout;
	
	private var file : String;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 * 
	 * @param	autoPlay	If TRUE, video start loading after 
	 */
	public function Mp3Stream (  ) {
		this.audioContainer = _root.createEmptyMovieClip( "__Mp3Stream__", _root.getNextHighestDepth() );
		this.soundContainer = new Sound( this.audioContainer );
		this.seekedTime = 0;
	}
	
	
	
	
	
	/** [EVENT generation] ***********************************************************
	**********************************************************************************/ 
	
	/**
	 * Creates and return a Mp3StreamEvent of the given type
	 * 
	 * @param	type	Type of event
	 * 
	 * @return	A new and populated Mp3StreamEvent
	 */
	public function getNewEv ( type : String ) : Mp3StreamEvent {
		var e : Mp3StreamEvent;
		
		e = new Mp3StreamEvent ( type, this );
		
		e.target = this;
		
		e.play_duration = this.getPlayDuration();
		e.play_time = this.getPlayTime();
		e.play_percent = this.getPlayPercent();
		
		e.load_bytes_total = this.getBytesTotal();
		e.load_bytes_loaded = this.getBytesLoaded();
		e.load_bytes_percent = this.getBytesPercent();
		
		return e;
	}
	
	
	
	
	
	/** [LOAD/UNLOAD PROCCESS] ********************************************************
	**********************************************************************************/ 
	
	 /**
	  * Loads a MP3 file
	  * 
	  * @param	file	Url of the mp3 to load
	  * @param	isStreaming	If TRUE, file is loaded in stream
	  * @param	autoPlay	If TRUE, sounds plays in repeat mode	
	  */
	public function load ( file : String, isStreaming : Boolean, autoPlay : Boolean, repeat : Boolean ) : Void {
		this.status = Status.STOPPED;
		
		this.autoPlay = autoPlay;
		this.repeat = repeat;
		
		this.soundContainer.loadSound( file, isStreaming );
		this.soundContainer.onLoad = Delegate.create ( this.soundContainer_onLoad, this );
		
		this.startPreloader();
		
		this.file = file;
	}
	
	
	public function whatname ( ) : String {
		return this.file;
	}
	
	
	
	/**
	 * Callback Sound.onLoad
	 */
	private function soundContainer_onLoad ( success : Boolean ) : Void {
		if ( !success ) {
			this.getNewEv( Mp3StreamEvent.LOAD_ERROR );
		}
	}
	
	/**
	 * Attaches a mp3 file
	 * 
	 * @param	id	Linkage Identifier of the MP#
	 * @param	autoPlay	If TRUE, sounds starts playing
	 * @param	repeat	If TRUE, sounds plays in repeat mode
	 */
	public function attach ( id : String, autoPlay : Boolean, repeat : Boolean ) : Void {
		this.status = Status.STOPPED;
		
		this.autoPlay = autoPlay;
		this.repeat = repeat;
		
		this.soundContainer.attachSound( id );
		
		if ( this.autoPlay ) {
			this.play();
		}
	}
	
	/**
	 * Unloads the previous MP3 ( FILE )
	 */
	public function unload () : Void {
		this.soundContainer.loadSound( "inexistent.mp3" );
		this.dispatchEvent( this.getNewEv( Mp3StreamEvent.LOAD_ABORT ) );
	}
	
	
	
	
	
	/** [PRELOADING proccess] ********************************************************
	**********************************************************************************/ 
	
	/**
	 * Start the preloading proccess execution
	 */
	private function startPreloader () : Void {
		this.dispatchEvent( this.getNewEv( Mp3StreamEvent.LOAD_START ) );
		this.stopPreloader();
		this.loadInterval = setInterval( Delegate.create( this.preload, this ), 30 );
	}
	
	/**
	 * Stops the preloading proccess execution
	 */
	private function stopPreloader () : Void {
		clearInterval( this.loadInterval );
	}
	
	/**
	 * Executes one step of the preloading proccess
	 */
	private function preload () : Void {
		this.dispatchEvent( this.getNewEv( Mp3StreamEvent.LOAD_PROGRESS ) );
		
		if ( this.getBytesTotal() == this.getBytesLoaded() && this.getBytesTotal() > 8 ) {
			
			this.stopPreloader();
			this.dispatchEvent( this.getNewEv( Mp3StreamEvent.LOAD_COMPLETE ) );
			
			if ( this.autoPlay ) {
				this.play();
			}
		}
	}
	
	
	
	
	
	/** [PLAYING proccess] ***********************************************************
	**********************************************************************************/ 
	
	/**
	 * Starts the playing watcher interval
	 */
	private function startUpdate () : Void {
		this.stopUpdate();
		//this.update();
		this.playInterval = setInterval( Delegate.create( this.update, this ), 30 );
	}
	
	/**
	 * Stops the playing watcher interval
	 */
	private function stopUpdate () : Void {
		clearInterval( this.playInterval );
	}
	
	/**
	 * Watch the playing proccess
	 */
	private function update () : Void {
		var time : Number;
		var duration : Number;
		
		this.dispatchEvent( this.getNewEv( Mp3StreamEvent.PLAY_PROGRESS ) );
		
		if ( this.getPlayTime() >= this.getPlayDuration() ) {
			
			this.stopUpdate();
			this.seekedTime = 0;
			
			this.soundContainer.stop();
			this.status = Status.STOPPED;
			
			this.dispatchEvent( this.getNewEv( Mp3StreamEvent.PLAY_COMPLETE ) );
			
			if ( this.repeat ) {
				this.play();
			}
		}
	}
	
	
	
	
	
	/** [CONTROLS - basic] ***********************************************************
	**********************************************************************************/ 
	
	/**
	 * Start playing
	 */
	public function play ( seekTo : Number, isPercentage : Boolean ) : Void {
		if ( !isNaN( seekTo ) ) {
			if ( !isPercentage ) {
				this.seekToTime( seekTo );
			} else {
				this.seekToPercent( seekTo ); 
			}
			
			return;
		}
		
		if ( this.status == Status.STOPPED ) {
			
			this.status = Status.PLAYING;
			this.soundContainer.start( this.seekedTime, 1 );
			this.seekedTime = 0;
			this.startUpdate();
			
			this.dispatchEvent( this.getNewEv( Mp3StreamEvent.PLAY_START ) );
			
		} else if ( this.status == Status.PAUSED ) {
			
			this.status = Status.PLAYING;
			this.soundContainer.start( this.seekedTime, 1 );
			this.seekedTime = 0;
			this.startUpdate();
			
			this.dispatchEvent( this.getNewEv( Mp3StreamEvent.PLAY_START ) );
		}
	}
	
	/**
	 * Pause the playing proccess
	 */
	public function pause () : Void {
		
		if ( this.status == Status.PLAYING ) {
			
			this.status = Status.PAUSED;
			this.seekedTime = ( this.getPlayTime() / 1000 );
			this.soundContainer.stop();
			
			this.stopUpdate();
			this.dispatchEvent( this.getNewEv( Mp3StreamEvent.PLAY_PAUSE ) );
			
		} else if ( this.status == Status.PAUSED ) {
			this.play( );
		}
	}
	
	/**
	 * Stops the playing proccess
	 */
	public function stop () : Void {
		if ( this.status == Status.STOPPED ) {
			return;
		}
		
		this.seekedTime = 0;
		this.status = Status.STOPPED;
		this.soundContainer.stop();
		
		this.stopUpdate();
		this.dispatchEvent( this.getNewEv( Mp3StreamEvent.PLAY_STOP ) );
		
	}
	
	
	
	
	
	/** [CONTROLS - audio] ***********************************************************
	**********************************************************************************/ 
	
	/**
	 * Sets the volume
	 * 
	 * @param	volume	Volume value ( from 0 to 100 )
	 */
	public function setVolume ( volume : Number ) : Void {
		this.soundContainer.setVolume( volume );
	}
	
	/**
	 * Gets the current volume
	 * 
	 * @return	Current volume
	 */
	public function getVolume () : Number {
		return this.soundContainer.getVolume();
	}
	
	
	
	
	
	/** [CONTROLS - execution] *******************************************************
	**********************************************************************************/ 
	
	/**
	 * Sends the execution to the given time
	 * 
	 * @param	time	Time you wannna seek to ( in miliseconds )
	 * @param	lock	Force sound to be paused while seeking
	 */
	public function seekToTime ( time : Number, lock:Boolean ) : Void {
		
		if ( this.status != Status.PLAYING ) {
			
			this.seekedTime = time;
			this.dispatchEvent( this.getNewEv( Mp3StreamEvent.PLAY_PROGRESS ) );
			
		} else {
			
			this.seekTimeout.abort();
			this.soundContainer.stop();
			this.soundContainer.start( (time/1000), 1 );
			this.startUpdate();
			
			if ( lock ) {
				this.seekTimeout = new SetTimeout( this.soundContainer.stop, 5, this.soundContainer );
				this.stopUpdate();
			}
		}
	}
	
	/**
	 * Seeks the video to the ratio's proportional time
	 * 
	 * @param	percent	Percent ( time ratio in percentage ) you wannna seek to
	 * @param	lock	Force sound to be paused while seeking
	 */
	public function seekToPercent ( percent : Number, lock:Boolean ) : Void {
		var time : Number;
		time = Math.round( this.getPlayDuration() * percent / 100 );
		this.seekToTime( time , lock );
	}
	
	
	
	
	
	/** [GETTERS] ********************************************************************
	**********************************************************************************/ 
	
	/**
	 * Gets the MP3 duration
	 * 
	 * @return	The MP3 duration  ( in miliseconds )
	 */
	public function getPlayDuration () : Number {
		return this.soundContainer.duration;
	}
	
	/**
	 * Gets the MP3 current playing time
	 * 
	 * @return	The MP3 current playing time ( in miliseconds )
	 */
	public function getPlayTime () : Number {
		return ( this.status == Status.STOPPED ? 0 : this.soundContainer.position );
	}
	
	/**
	 * Gets the MP3 current playing percentage ( time ratio in percentage )
	 * 
	 * @return The MP3 played percentage ( time ratio in percentage )
	 */
	public function getPlayPercent () : Number {
		return ( Math.round( this.getPlayTime() / this.getPlayDuration() * 100 ) || 0 );
	}
	
	/**
	 * Gets the MP3 bytes total
	 * 
	 * @return	The MP3 bytes total
	 */
	public function getBytesTotal () : Number {
		return ( this.soundContainer.getBytesTotal() || 0 );
	}
	
	/**
	 * Gets the MP3 bytes loaded
	 * 
	 * @return	The MP3 bytes loaded
	 */
	public function getBytesLoaded () : Number {
		return ( this.soundContainer.getBytesLoaded() || 0 );
	}
	
	/**
	 * Gets the MP3 loaded percentage
	 * 
	 * @return	The MP3 loaded percentage
	 */
	public function getBytesPercent () : Number {
		return ( Math.round( this.getBytesLoaded() / this.getBytesTotal() * 100) || 0 );
	}
	
}