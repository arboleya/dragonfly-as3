//* Cocktail
import cocktail.lib.events.EventDispatcher;
import cocktail.lib.events.PlaybackEvent;
import cocktail.lib.status.NetStreamStatus;
import cocktail.lib.status.Status;
import cocktail.utils.SetTimeout;
import cocktail.utils.Delegate;



class cocktail.utils.Playback extends EventDispatcher {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/ 
	
	// constructor params
	private var hasAudio:Boolean;
	private var hasVideo:Boolean;
	private var videoContainer:Video;
	private var audioContainer:MovieClip;
	private var soundContainer:Sound;
	private var bufferTime:Number;
	private var autoPlay:Boolean;
	private var stopOnThumb:Boolean;
	private var repeat:Boolean;
	
	// load method's params
	private var appPath:String;
	private var flvPath:String;
	private var streamName:String;
	
	// general vars
	private var isStream:Boolean;
	private var hasInfo:Boolean;
	
	private var duration:Number;
	
	private var nc:NetConnection;
	private var ns:NetStream;
	private var status:String;
	
	private var loadInterval:Number;
	private var playbackInterval:Number;
	private var timeout:SetTimeout;
	
	public var metadata:Object;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/ 
	
	/**
	 * Constructor
	 * 
	 * @param	hasAudio	TRUE if you want to use sound
	 * @param	hasVideo	TRUE it the you want to use video
	 * @param	videoContainer	Video Object where the FLV will be loaded
	 * @param	bufferTime	Buffer time you need when loading
	 * @param	autoPlay	If TRUE, video start loading after 
	 * @param	repeat	If TRUE, video will be played in repeat mode
	 * @param	stopOnThumb	If TRUE, only the first frame of the FLV will be loaded
	 */
	public function Playback (hasAudio:Boolean, hasVideo:Boolean, videoContainer:Video, bufferTime:Number, autoPlay:Boolean, repeat:Boolean, stopOnThumb:Boolean) {
		var name:String;
		var depth:Number;
		
		this.hasAudio = hasAudio;
		this.hasVideo = hasVideo;
		
		this.autoPlay = autoPlay;
		this.bufferTime = bufferTime;
		this.repeat = (repeat === true);
		this.stopOnThumb = (stopOnThumb === true);
		
		if (this.hasVideo) {
			this.videoContainer = videoContainer;
		}
		
		if (this.hasAudio) {
			depth = _root.getNextHighestDepth();
			name = ("__Playback__"+ depth + getTimer());
			this.audioContainer = _root.createEmptyMovieClip(name, depth);
			this.soundContainer = new Sound(this.audioContainer);
		}
	}
	
	
	
	
	
	/** [EVENT generation] ***********************************************************
	**********************************************************************************/ 
	
	/**
	 * Creates a event of the given type and populat it
	 * 
	 * @param	type	Type of event
	 * @param	info	Info - individual for each type
	 * @param	time	the current play timne ( workaround for seek method execution delay )
	 * 
	 * @return	A new and populated PlaybackEvent
	 */
	public function getNewEv ( type : String, info : Object, time : Number ):PlaybackEvent {
		var ev:PlaybackEvent;
		var i:String;
		
		ev = new PlaybackEvent(type);
		
		for (i in info) {
			ev["info_" + i] = info[i];
		}
		
		ev.info = info;
		ev.buffer_length = this.getBufferLength();
		
		ev.play_duration = this.getPlayDuration();
		ev.play_time = (time == undefined ? this.getPlayTime() : time);
		
		ev.play_percent = Math.round(ev.play_time / ev.play_duration * 100);
		
		ev.load_bytes_total = this.getBytesTotal();
		ev.load_bytes_loaded = this.getBytesLoaded();
		ev.load_percent = Math.round(ev.load_bytes_loaded / ev.load_bytes_total * 100);
		
		return ev;
	}
	
	
	
	
	
	/** [LOAD/UNLOAD PROCCESS] ********************************************************
	**********************************************************************************/ 
	
	/**
	 * Load the flv ( FILE and/or STREAM )
	 */
	private function load ():Void {
		this.hasInfo = false;
		
		this.nc = new NetConnection;
		
		if (this.isStream) {
			this.nc.connect(this.appPath);
		} else {
			this.nc.connect(null);
		}
		
		this.ns = new NetStream(this.nc);
		this.ns.onCuePoint = Delegate.create(this.onNsCuePoint, this);
		this.ns.onMetaData = Delegate.create(this.onNsMetaData, this);
		this.ns.onStatus = Delegate.create(this.onNsStatus, this);
		
		if (this.bufferTime !== undefined) {
			this.ns.setBufferTime(this.bufferTime);
		}
		
		if (this.hasVideo) {
			this.videoContainer.attachVideo(this.ns);
		}
		if (this.hasAudio) {
			this.audioContainer.attachAudio(this.ns);
		}
		
		if (this.isStream) {
			this.ns.play(this.streamName);
		} else {
			this.ns.play(this.flvPath);
		}
	}
	
	/**
	 * Unloads the previous flv ( FILE )
	 */
	public function unload ():Void {
		// this.ns.play("inexistent.flv");
		this.ns.close();
		this.videoContainer.clear();
		this.stopUpdate(true);
	}
	
	/**
	 * Loads a flv STREAM
	 * 
	 * @param	appPath	Path to the FMS application
	 * @param	streamName	Stream name to be played
	 */
	public function loadStream (appPath:String, streamName:String):Void {
		this.isStream = true;
		this.appPath = appPath;
		this.streamName = streamName;
		this.load ();
	}
	
	/**
	 * Loads a flv FILE
	 * 
	 * @param	flvPath	Path to the FLV file
	 */
	public function loadFlv (flvPath:String):Void {
		this.isStream = false;
		this.flvPath = flvPath;
		this.load ();
		this.startPreloader();
	}
	
	
	
	
	
	/** [PRELOADING proccess] ********************************************************
	**********************************************************************************/ 
	
	/**
	 * Start the preloading proccess execution
	 */
	private function startPreloader ():Void {
		this.dispatchEvent(this.getNewEv(PlaybackEvent.LOAD_START));
		this.stopPreloader();
		this.loadInterval = setInterval(Delegate.create(this.onPreloadUpdate, this), 30);
	}
	
	/**
	 * Stops the preloading proccess execution
	 */
	private function stopPreloader ():Void {
		clearInterval(this.loadInterval);
	}
	
	/**
	 * Executes one step of the preloading proccess
	 */
	private function onPreloadUpdate ():Void {
		this.dispatchEvent(this.getNewEv(PlaybackEvent.LOAD_PROGRESS));
		if (this.getBytesTotal() == this.getBytesLoaded() && this.getBytesTotal() > 8) {
			this.stopPreloader();
			this.dispatchEvent(this.getNewEv(PlaybackEvent.LOAD_COMPLETE));
		}
	}
	
	
	
	
	
	/** [PLAYING proccess] ***********************************************************
	**********************************************************************************/ 
	
	/**
	 * Starts the playing watcher interval
	 */
	private function startUpdate ():Void {
		this.stopUpdate(true);
		this.playbackInterval = setInterval(Delegate.create(this.update, this), 30);
	}
	
	/**
	 * If the netStream is fully loaded, stops the update interval.
	 * @param	force_clear	If true force the interval to be cleared even if the netStream wasnt fully loaded.
	 */
	private function stopUpdate (force_clear : Boolean):Void {
		force_clear = force_clear === true;
		
		if(this.ns.bytesLoaded >= this.ns.bytesTotal || force_clear) {
			clearInterval(this.playbackInterval);
		}
	}
	
	/**
	 * Watch the playing proccess
	 */
	private function update ():Void {
		var time:Number;
		var duration:Number;
		var lastTimeStamp:Number;
		
		this.dispatchEvent(this.getNewEv(PlaybackEvent.PLAY_PROGRESS, status));
		
		time = this.getPlayTime();
		duration = this.getPlayDuration();
		lastTimeStamp = (this.metadata.lastkeyframetimestamp || duration);
		
		if (time >= duration || time >= lastTimeStamp) {
			
			this.stopUpdate(true);
			this.ns.pause(true);
			this.status = Status.STOPPED;
			this.dispatchEvent(this.getNewEv(PlaybackEvent.PLAY_COMPLETE));
			
			if (this.repeat) {
				this.play();
			}
		}
	}
	
	
	
	
	
	/** [CONTROLS - basic] ***********************************************************
	**********************************************************************************/ 
	
	/**
	 * Start playing
	 */
	public function play ( seekTo:Number, isPercentage:Boolean ):Void {
		if (!isNaN(seekTo)) {
			if (!isPercentage) {
				this.seekToTime(seekTo);
			} else {
				this.seekToPercent(seekTo); 
			}
		}
		
		if (this.status == Status.STOPPED || this.status == Status.PAUSED) {
			this.ns.pause(false);
		}
		
		this.status = Status.PLAYING;
		this.startUpdate();
		this.dispatchEvent(this.getNewEv(PlaybackEvent.PLAY_START));
	}
	
	/**
	 * Pause the playing proccess
	 */
	public function pause ():Void {
		if (this.status == Status.PLAYING) {
			
			this.status = Status.PAUSED;
			this.ns.pause(true);
			this.stopUpdate();
			this.dispatchEvent(this.getNewEv(PlaybackEvent.PLAY_PAUSE));
			
		} else if (this.status == Status.PAUSED) {
			
			this.play();
		}
	}
	
	/**
	 * Stops the playing proccess
	 */
	public function stop ():Void {
		if (this.status == Status.STOPPED) {
			return;
		}
		
		this.status = Status.STOPPED;
		this.ns.seek(0);
		this.ns.pause(true);
		
		this.stopUpdate();
		this.dispatchEvent(this.getNewEv(PlaybackEvent.PLAY_PAUSE));
		
	}
	
	public function kill () {
		this.stop();
		this.stopUpdate(true);
		
		this.ns.onCuePoint = undefined;
		this.ns.onMetaData = undefined;
		this.ns.onStatus = undefined;
		
		this.ns.close();
		
		this.removeAllEventListeners();
	}
	
	
	
	
	/** [CONTROLS - audio] ***********************************************************
	**********************************************************************************/ 
	
	/**
	 * Sets the volume
	 * 
	 * @param	volume	Volume value (from 0 to 100)
	 */
	public function setVolume (volume:Number):Void {
		this.soundContainer.setVolume(volume);
	}
	
	/**
	 * Gets the current volume
	 * 
	 * @return	Current volume
	 */
	public function getVolume ():Number {
		return this.soundContainer.getVolume();
	}
	
	
	
	
	
	/** [CONTROLS - execution] *******************************************************
	**********************************************************************************/ 
	
	/**
	 * Sends the execution to the given time
	 * 
	 * @param	time	Time you wannna seek to
	 */
	public function seekToTime (time:Number):Void {
		this.ns.seek(time);
		this.dispatchEvent(this.getNewEv(PlaybackEvent.PLAY_PROGRESS, null, time));
	}
	
	/**
	 * Seeks the video to the ratio's proportional time
	 * 
	 * @param	percent	Percent (time ratio in percentage) you wannna seek to
	 */
	public function seekToPercent (percent:Number):Void {
		var time:Number;
		
		this.ns.seek( ( time = ( this.duration*percent/100 ) ) );
		this.dispatchEvent(this.getNewEv(PlaybackEvent.PLAY_PROGRESS, null, time));
	}
	
	
	
	
	
	/** [GETTERS] ********************************************************************
	**********************************************************************************/ 
	
	/**
	 * Gets the flv duration
	 * 
	 * @return	The FLV duration
	 */
	public function getPlayDuration ():Number {
		return this.duration;
	}
	
	/**
	 * Gets the FLV current playing time
	 * 
	 * @return	The FLV current playing time
	 */
	public function getPlayTime ():Number {
		return Math.min(this.ns.time, this.duration);
	}
	
	/**
	 * Gets the FLV current playing percentage ( time ratio in percentage)
	 * 
	 * @return The FLV played percentage ( time ratio in percentage)
	 */
	public function getPlayPercent ():Number {
		return Math.round(this.getPlayTime() / this.getPlayDuration() * 100);
	}
	
	/**
	 * Gets the FLV bytes total
	 * 
	 * @return	The FLV bytes total
	 */
	public function getBytesTotal ():Number {
		return this.ns.bytesTotal;
	}
	
	/**
	 * Gets the FLV bytes loaded
	 * 
	 * @return	The FLV bytes loaded
	 */
	public function getBytesLoaded ():Number {
		return this.ns.bytesLoaded;
	}
	
	/**
	 * Gets the FLV loaded percentage
	 * 
	 * @return	The FLV loaded percentage
	 */
	public function getBytesPercent ():Number {
		return Math.round(this.getBytesLoaded() / this.getBytesTotal() * 100);
	}
	
	/**
	 * Gets the FLV buffer length
	 *  
	 * @return	The FLV buffer length
	 */
	public function getBufferLength ():Number {
		return this.ns.bufferLength;
	}
	
	public function getStatus () : String {
		return this.status;
	}
	
	
	
	/** [NETSTREAM - events] *********************************************************
	**********************************************************************************/ 
	
	/**
	 * When netstream status is received
	 * 
	 * @param	info	Metadata info
	 */
	private function onNsStatus (info:Object):Void {
		if (this.stopOnThumb) {
			if(info.code == NetStreamStatus.BUFFER_FULL) {
				this.ns.pause(true);
				this.ns.close();
			}
		}
		
		this.dispatchEvent(this.getNewEv(PlaybackEvent.NS_STATUS, info));
		
		if (info.level == "error") {
			this.dispatchEvent(this.getNewEv(PlaybackEvent.LOAD_ERROR, info));
		}
	}
	
	/**
	 * When netstream metadata is received
	 * 
	 * @param	info	Status info
	 */
	private function onNsMetaData (info:Object):Void {
		if (this.hasInfo) {
			return;
		}
		
		this.duration = info.duration;
		this.hasInfo = true;
		
		//this seek(0) was introducing a mini-loop to the beginning of the movie, causing audio problems if the video begins with audio.
		//didnt erase the line cause i dont know if it was really used.
		//this.ns.seek(0);
		
		this.metadata = info;
		
		this.dispatchEvent(this.getNewEv(PlaybackEvent.NS_METADATA, info));
		
		if (this.autoPlay) {
			this.play();
		} else {
			this.status = Status.STOPPED;
			this.ns.pause(true);
		}
	}
	
	/**
	 * When netstream metadata is received
	 * 
	 * @param	info	Metadata info
	 */
	private function onNsCuePoint (info:Object):Void {
		this.dispatchEvent(this.getNewEv(PlaybackEvent.NS_CUE_POINT, info));
	}
	
}