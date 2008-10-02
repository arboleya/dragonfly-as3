class cocktail.lib.status.NetStreamStatus {
	
	/**
	* NetStream.Buffer.Empty | Data is not being received quickly enough to fill the buffer. Data flow will be interrupted until the buffer refills, at which time a NetStream.Buffer.Full message will be sent and the stream will begin playing again.
	* @return	NetStream.Buffer.Empty
	*/
	public static function get BUFFER_EMPTY ():String {
		return 'NetStream.Buffer.Empty';
	}
	
	/**
	* NetStream.Buffer.Full | The buffer is full and the stream will begin playing.
	* @return	NetStream.Buffer.Full
	*/
	public static function get BUFFER_FULL ():String {
		return 'NetStream.Buffer.Full';
	}
	
	/**
	* NetStream.Buffer.Flush | Data has finished streaming, and the remaining buffer will be emptied.
	* @return	NetStream.Buffer.Flush
	*/
	public static function get BUFFER_FLUSH ():String {
		return 'NetStream.Buffer.Flush';
	}
	
	/**
	* NetStream.Play.Start | Playback has started.
	* @return	NetStream.Play.Start
	*/
	public static function get PLAY_START ():String {
		return 'NetStream.Play.Start';
	}
	
	/**
	* NetStream.Play.Stop | Playback has stopped.
	* @return	NetStream.Play.Stop
	*/
	public static function get PLAY_STOP ():String {
		return 'NetStream.Play.Stop';
	}
	
	/**
	* NetStream.Play.StreamNotFound | The FLV passed to the play() method can't be found.
	* @return	NetStream.Play.StreamNotFound
	*/
	public static function get PLAY_NOT_FOUND ():String {
		return 'NetStream.Play.StreamNotFound';
	}
	
	/**
	* NetStream.Seek.InvalidTime | For video downloaded with progressive download, the user has tried to seek or play past the end of the video data that has downloaded thus far, or past the end of the video once the entire file has downloaded. The Error.message.details property contains a time code that indicates the last valid position to which the user can seek. See Error.message property.
	* @return	NetStream.Seek.InvalidTime
	*/
	public static function get SEEK_INVALID_TIME ():String {
		return 'NetStream.Seek.InvalidTime';
	}
	
	/**
	* NetStream.Seek.Notify | The seek operation is complete.
	* @return	NetStream.Seek.Notify
	*/
	public static function get SEEK_NOTIFY ():String {
		return 'NetStream.Seek.Notify';
	}
	
}