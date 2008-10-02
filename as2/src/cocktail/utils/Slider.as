import cocktail.utils.Delegate;

class cocktail.utils.Slider {
	
	private var track:MovieClip;
	private var slider:MovieClip;
	private var vertical:Boolean;
	private var negativeMargin:Number;
	private var positiveMargin:Number;
	
	private var left:Number;
	private var top:Number;
	private var right:Number;
	private var bottom:Number;
	private var isMoving:Boolean;
	
	public var onUpdate:Function;
	public var onStartMove:Function;
	public var onStopMove:Function;
	
	public function Slider (track:MovieClip, slider:MovieClip, vertical:Boolean, negativeMargin:Number, positiveMargin:Number) {
		this.track = track;
		this.slider = slider;
		this.vertical = (vertical == undefined ? true : vertical);
		this.negativeMargin = (negativeMargin == undefined ? 0 : negativeMargin);
		this.positiveMargin = (positiveMargin == undefined ? 0 : positiveMargin);
		
		this.left = this.slider._x;
		this.top = this.slider._y;
		this.right = this.left + (this.vertical ? 0 : (this.track._width-this.slider._width));
		this.bottom = this.top + (this.vertical ? (this.track._height-this.slider._height) : 0);
		
		if (this.vertical) {
			this.top += this.negativeMargin;
			this.bottom -= this.positiveMargin;
			this.slider._y = this.track._y + this.negativeMargin;
		} else {
			this.left += this.negativeMargin;
			this.right -= this.positiveMargin;
			this.slider._x = this.track._x + this.negativeMargin;
		}
		
		this.isMoving = false;
		
		this.initialize();
	}
	
	private function initialize() {
		this.slider.onPress = Delegate.create(this.onPress, this);
		this.slider.onRelease = Delegate.create(this.onRelease, this);
		this.slider.onReleaseOutside = this.slider.onRelease;
		this.slider.onMouseMove = Delegate.create(this.onMove, this);
	}
	
	private function onPress () {
		this.slider.startDrag(false, this.left, this.top, this.right, this.bottom);
		this.isMoving = true;
		this.onStartMove();
	}
	
	private function onRelease () {
		this.slider.stopDrag();
		this.isMoving = false;
		this.onStopMove();
	}
	
	private function onMove () {
		if (this.isMoving) {
			this.onUpdate(this.getPosition());
		}
	}
	
	public function getPosition() {
		var a, b, prop, margin;
		
		margin = (this.positiveMargin+this.negativeMargin);
		prop = (this.vertical ? "_height" : "_width");
		
		a = (this.vertical ? (this.slider._y-this.top) : (this.slider._x-this.left));
		b = (this.track[prop]-(this.slider[prop]+margin));
		
		return (a/b);
	}
	
	public function setPosition(percent:Number) {
		var total, position;
		
		percent = (percent < 0 ? 0 : percent > 1 ? 1 : percent);
		total = (this.vertical ? (this.bottom-this.top) : (this.right-this.left));
		position = (percent*total);
		
		if (this.vertical) {
			this.slider._y = (this.top + position);
		} else {
			this.slider._x = (this.left + position);
		}
		
		this.onUpdate(percent);
	}
}



/*
	
	@ ARGUMENTS ++++++++++++++++++++++++++++++++++++++++++++++++++++++
		- TRACK:
			Instance of the track (MOVIECLIP or BUTTON)
		- SLIDER:
			Instance of the slider (MOVIECLIP or BUTTON)
		- VERTICAL:
			Boolean value indicating the slider direction:
				* vertical = TRUE
				* horizontal = FALSE (optional, it's false by default)
		- NEGATIVE_MARGIM:
				Number value indicating the TOP|LEFT-margin for the slider
				in comparison to the the track
		- POSITIVE_MARGIM:
				Number value indicating the BOTTOM|RIGHT-margin for the slider
				in comparison to the the track
			
	@ USAGE ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	import com.nybras.components.Slider;
	
	var mySlider = new Slider(track_mc, slider_mc);
	mySlider.onUpdate = function(percent) {
		trace("update: "+ percent);
	};
	mySlider.setPosition(50);
	trace("position: "+ mySlider.getPosition());
	
*/