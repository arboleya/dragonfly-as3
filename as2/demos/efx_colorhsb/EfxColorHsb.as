/**
* ...
* @author Vincent Maraschin [mail@vince.as]
*/



import cocktail.utils.Delegate;
import cocktail.utils.Slider;
import com.robertpenner.easing.Elastic;
import dragonfly.body.events.FlightEvent;
import dragonfly.plugins.efx.ColorHsbEfx;
import dragonfly.plugins.efx.lib.colorhsb.ColorHsbValues;



class EfxColorHsb {
	
	private var pic:MovieClip;
	private var efx:ColorHsbEfx;
	
	// hue slider
	private var hueSlider:Slider;
	private var hueDrag:MovieClip;
	private var hueBar:MovieClip;
	private var hueTxt:TextField;
	private var hue:Number;
	
	// saturation slider
	private var satSlider:Slider;
	private var satDrag:MovieClip;
	private var satBar:MovieClip;
	private var satTxt:TextField;
	private var sat:Number;
	
	// contrast slider
	private var conSlider:Slider;
	private var conDrag:MovieClip;
	private var conBar:MovieClip;
	private var conTxt:TextField;
	private var con:Number;
	
	// brightness slider
	private var briSlider:Slider;
	private var briDrag:MovieClip;
	private var briBar:MovieClip;
	private var briTxt:TextField;
	private var bri:Number;
	
	private var go:MovieClip;
	
	
	
	public function EfxColorHsb() {
		this.efx = new ColorHsbEfx(this.pic);
		this.efx.addEventListener( FlightEvent.START, function() { trace (" START! "); } );
		this.efx.addEventListener( FlightEvent.COMPLETE, function() { trace (" COMPLETE! "); } );
		
		this.hueSlider = new Slider(this.hueBar, this.hueDrag, false);
		this.hueSlider.onUpdate = Delegate.create(this.updateHue, this);
		this.hueSlider.setPosition(0.5);
		
		this.satSlider = new Slider(this.satBar, this.satDrag, false);
		this.satSlider.onUpdate = Delegate.create(this.updateSat, this);
		this.satSlider.setPosition(0.1);
		
		this.conSlider = new Slider(this.conBar, this.conDrag, false);
		this.conSlider.onUpdate = Delegate.create(this.updateCon, this);
		this.conSlider.setPosition(0.2855);
		
		this.briSlider = new Slider(this.briBar, this.briDrag, false);
		this.briSlider.onUpdate = Delegate.create(this.updateBri, this);
		this.briSlider.setPosition(0.5);
		
		this.go.onRelease = Delegate.create(this.animate, this);
	}
	
	private function updateHue(percent:Number):Void {
		this.hue = Math.round( -180 + (percent * 360));
		this.hueTxt.text = String(this.hue);
	}
	
	private function updateSat(percent:Number):Void {
		this.sat = Math.round( -100 + (percent * 1000));
		this.satTxt.text = String(this.sat);
	}
	
	private function updateCon(percent:Number):Void {
		this.con = Math.round( -200 + (percent * 700));
		this.conTxt.text = String(this.con);
	}
	
	private function updateBri(percent:Number):Void {
		this.bri = Math.round( -100 + (percent * 200));
		this.briTxt.text = String(this.bri);
	}
	
	private function animate():Void {
		this.efx.morph(null, new ColorHsbValues( this.hue, this.sat, this.con, this.bri ), 5000, 0, Elastic.easeOut );
	}
}