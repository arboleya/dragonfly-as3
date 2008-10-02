//* Dragonfly
import cocktail.utils.Debugger;
import dragonfly.body.Flight;
import dragonfly.body.events.FlightEvent;

import dragonfly.plugins.larvas.FiltersLarva;
import dragonfly.plugins.larvas.lib.filters.values.*;
import dragonfly.plugins.larvas.lib.filters.confs.*;

//* Cocktail
import cocktail.utils.Delegate;

//* Vendors: RobertPenner
import com.robertpenner.easing.*;

// Vendors: Flash
import flash.display.BitmapData;
import flash.geom.Point;



class LarvaFilters {
	
	/** [VARS]  **********************************************************************
	**********************************************************************************/
	
	// elements & Larva
	private var Star:MovieClip;
	private var StarLarva:FiltersLarva;
	
	// accessories
	private var McDisplacementMap:MovieClip;
	private var BmpDisplacement:BitmapData;
	
	// buttons
	private var BtnGlow:MovieClip;
	private var BtnBlur:MovieClip;
	private var BtnBevel:MovieClip;
	private var BtnGradientGlow:MovieClip;
	private var BtnGradientBevel:MovieClip;
	private var BtnDropShadow:MovieClip;
	private var BtnDisplacementMap:MovieClip;
	private var BtnConvolution:MovieClip;
	private var BtnColorMatrix:MovieClip;
	private var BtnReset:MovieClip;
	
	// benchmark
	private var startTime:Number;
	private var endTime:Number;
	
	
	
	
	/** [CONSTRUCTOR]  ***************************************************************
	**********************************************************************************/
	
	/**
	 * Constructor
	 */
	public function LarvaFilters() {
		// larva
		this.StarLarva = new FiltersLarva(this.Star);
		
		// triggers
		this.BtnGlow.onRelease = Delegate.create(this.glow_onRelease, this);
		this.BtnBlur.onRelease = Delegate.create(this.blur_onRelease, this);
		this.BtnBevel.onRelease = Delegate.create(this.bevel_onRelease, this);
		this.BtnGradientGlow.onRelease = Delegate.create(this.gradientglow_onRelease, this);
		this.BtnGradientBevel.onRelease = Delegate.create(this.gradientbevel_onRelease, this);
		this.BtnDropShadow.onRelease = Delegate.create(this.dropshadow_onRelease, this);
		this.BtnDisplacementMap.onRelease = Delegate.create(this.displacementMap_onRelease, this);
		this.BtnConvolution.onRelease = Delegate.create(this.convolution_onRelease, this);
		this.BtnColorMatrix.onRelease = Delegate.create(this.colormatrix_onRelease, this);
		
		this.BtnReset.onRelease = Delegate.create(this.reset_onRelease, this);
		
		// accessories
		this.BmpDisplacement = new BitmapData(this.McDisplacementMap._width, this.McDisplacementMap._height);
		this.BmpDisplacement.draw(this.McDisplacementMap);
		this.McDisplacementMap._visible = false;
		
		//this.BtnGlow.onRelease();
		//this.BtnBlur.onRelease();
		//this.BtnBevel.onRelease();
		//this.BtnGradientGlow.onRelease();
		//this.BtnGradientBevel.onRelease();
		//this.BtnDropShadow.onRelease();
		//this.BtnDisplacementMap.onRelease();
		//this.BtnConvolution.onRelease();
		//this.BtnColorMatrix.onRelease();
		
		// test
		//var fl:Flight = this.StarLarva.color(0x000000, 0xFFFFFF, 400, 0, Linear.easeNone);
		//fl.addUpdateListener( this.traceEv, this));
		//
		//var ny:Nymph = new Nymph([0x000000, 0xFFFFFF], [0xFFFFFF, 0x000000], 400, 0, Linear.easeNone, null, 30, false, true);
		//ny.addUpdateListener( this.traceEv, this));
	}
	
	
	
	//public function traceEv ( event : FlightEvent ):Void {
		//if (!_global.inc) {
			//_global.inc = 0;
		//}
		//
		//trace( "[ "+ _global.inc++ +" ]: "+ Nymph._hex2rgb(Number ([].concat(e.data).shift())).join(".") );
	//}
	
	
	
	
	
	
	
	
	/** [TRIGGERS]  ******************************************************************
	**********************************************************************************/
	
	private function listenFlight ( flight : Flight, name : String ) : Void {
		flight.addStartListener( Delegate.create( this.flight_onStart, this), null, name );
		flight.addUpdateListener( Delegate.create( this.flight_onUpdate, this), null, name );
		flight.addCompleteListener( Delegate.create( this.flight_onComplete, this ), null, name );
	}
	
	private function flight_onStart ( event : FlightEvent ):Void {
		this.startTime = getTimer();
		Debugger.trace( event.flightObj, "START" );
	}
	
	private function flight_onUpdate ( event : FlightEvent ):Void {
		Debugger.trace( event.flightObj, "UPDATE" );
	}
	
	private function flight_onComplete ( event : FlightEvent ):Void {
		this.endTime = getTimer();
		Debugger.trace( event.flightObj, "COMPLETE in "+ ( this.endTime - this.startTime ) +" ms" );
	}
	
	
	
	
	
	/** [TRIGGERS]  ******************************************************************
	**********************************************************************************/
	
	/**
	 * reset all filters
	 */
	private function reset_onRelease():Void {
		this.StarLarva.reset();
	}
	
	/**
	 * blur trigger
	 */
	private function blur_onRelease ():Void {
		var blurConf:BlurConf;
		
		blurConf = new BlurConf(3);
		blurConf.start = new BlurValues;
		blurConf.end = new BlurValues(6, 6);
		
		this.listenFlight( this.StarLarva.blur(blurConf, 1000, 0, Expo.easeOut ), "blur" );
	}
	
	/**
	 * glow trigger
	 */
	private function glow_onRelease ():Void {
		var glowConf:GlowConf;
		var flight:Flight;
		
		glowConf = new GlowConf(false, false, 3);
		glowConf.start = new GlowValues(0xFFFFFF, 0, 0, 0, 0);
		glowConf.end = new GlowValues(0x00CC99, .5, 15, 15, 5);
		
		this.listenFlight( this.StarLarva.glow(glowConf, 1000, 0, Expo.easeOut ), "glow" );
	}
	
	/**
	 * blur trigger
	 */
	private function bevel_onRelease ():Void {
		var bevelConf:BevelConf;
		var flight:Flight;
		
		// bevel
		bevelConf = new BevelConf("full", false, 3);
		bevelConf.start = new BevelValues(0, 45, 0xFFFFFF, 0, 0x000000, 0, 0, 0, 0);
		bevelConf.end = new BevelValues(8, 90, 0xFFFFFF, 1, 0x000000, 1, 10, 10, 1);
		
		this.listenFlight( this.StarLarva.bevel(bevelConf, 1000, 0, Expo.easeOut ), "bevel" );
	}
	
	/**
	 * gradientglow trigger
	 * 
	 */
	private function gradientglow_onRelease ():Void {
		var gglowConf:GradientConf;
		var flight:Flight;
		
		// bevel
		gglowConf = new GradientConf([0xFFFFFF, 0xFF0000, 0xFFFF00, 0x00CC00], [0, 1, 1, 0.3], [0, 63, 126, 255], "multiply", false, 3);
		gglowConf.start = new GradientValues(0, 0, 0, 0, 1);
		gglowConf.end = new GradientValues(5, 360, 10, 10, 2);
		
		this.listenFlight( this.StarLarva.gradientGlow(gglowConf, 1000, 0, Expo.easeOut ), "gradientGlow" );
	}
	
	/**
	 * gradientbevel trigger
	 */
	private function gradientbevel_onRelease ():Void {
		var gbevelConf:GradientConf;
		var flight:Flight;
		
		// bevel
		gbevelConf = new GradientConf([0xFFFFFF, 0xCCCCCC, 0x000000], [1, 0, 1], [0, 128, 255], "outer", false, 3);
		gbevelConf.start = new GradientValues(0, 0, 0, 0, 0);
		gbevelConf.end = new GradientValues(15, 360, 10, 10, 2);
		
		this.listenFlight( this.StarLarva.gradientBevel(gbevelConf, 1000, 0, Expo.easeOut ), "gradientBevel" );
	}
	
	/**
	 * dropshadow trigger
	 */
	private function dropshadow_onRelease ():Void {
		var dropshadowConf:DropShadowConf;
		var flight:Flight;
		
		// bevel
		dropshadowConf = new DropShadowConf(false, false, false, 3);
		dropshadowConf.start = new DropShadowValues(0, 90, 0x000033, .8, 0, 0, 1);
		dropshadowConf.end = new DropShadowValues(15, 180, 0x000033, 1, 10, 10, 1);
		
		this.listenFlight( this.StarLarva.dropShadow(dropshadowConf, 1000, 0, Expo.easeInOut ), "dropshadow" );
	}
	
	/**
	 * displacement trigger
	 */
	private function displacementMap_onRelease ():Void {
		var displacementConf:DisplacementMapConf;
		var flight:Flight;
		var bmpData:BitmapData;
		
		displacementConf = new DisplacementMapConf(1, 2, this.BmpDisplacement, new Point(0, 0), 0x000000, 1, "ignore");
		displacementConf.start = new DisplacementMapValues(0, 0);
		displacementConf.end = new DisplacementMapValues(20, 20);
		
		this.listenFlight( this.StarLarva.displacementMap(displacementConf, 1000, 0, Elastic.easeInOut ), "displacementMap" );
	}
	
	/**
	 * convolution trigger
	 */
	private function convolution_onRelease ():Void {
		var convolutionConf:ConvolutionConf;
		var flight:Flight;
		
		convolutionConf = new ConvolutionConf(true, true, 3, 3, null, null);
		convolutionConf.start = new ConvolutionValues([0, 0, 0, 0, 1, 0, 0, 0, 0], 1, 0);
		convolutionConf.end = new ConvolutionValues([-4, -2, 0, -2, 1, 2, 0, 2, 4], 1, 0);
		
		this.listenFlight( this.StarLarva.convolution(convolutionConf, 1000, 0, Expo.easeOut ), "convolution" );
	}
	
	/**
	 * colormatrix trigger
	 */
	private function colormatrix_onRelease ():Void {
		var flight:Flight;
		var start:Array;
		var end:Array;
		
		// default matrix (no change will happen)
		start = null;
		
		// Tritanopia sample matrix (Tritanopia is an exceedingly rare color vision disturbance in which there are only two cone pigments present and a total absence of blue retinal receptors.)
		// checkout other color samples @ http://www.colorjack.com/labs/colormatrix/
		end = [0.95, 0.05, 0, 0, 0, 0, 0.433, 0.567, 0, 0, 0, 0.475, 0.525, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1];
		
		this.listenFlight( this.StarLarva.colorMatrix(start, end, 1000, 0, Expo.easeOut ), "colormatrix" );
	}
}