/**
* ...
* @author Vincent Maraschin [mail@vince.as]
*/

import cocktail.utils.Delegate;
import com.robertpenner.easing.Cubic;
import dragonfly.plugins.larvas.FiltersLarva;
import dragonfly.plugins.larvas.MovieClipLarva;



class ColorBlindness {
	
	private var blindness_matrix:Array;
	private var texts:Array;
	
	private var larva:FiltersLarva;
	private var ptLarva:MovieClipLarva;
	private var pic:MovieClip;
	private var pt:MovieClip;
	private var info_txt:TextField;
	
	public function ColorBlindness() {
		
		//Dragonfly.disable();
		
		this.blindness_matrix = [];
		
		// Thanks to COLORJACK [http://colorjack.blogspot.com/]
		
		this.blindness_matrix.push([1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]); // Normal
		this.blindness_matrix.push([0.567, 0.433, 0, 0, 0, 0.558, 0.442, 0, 0, 0, 0, 0.242, 0.758, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]); // Protanopia
		this.blindness_matrix.push([0.817, 0.183, 0, 0, 0, 0.333, 0.667, 0, 0, 0, 0, 0.125, 0.875, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]); // Protanomaly
		this.blindness_matrix.push([0.625, 0.375, 0, 0, 0, 0.7, 0.3, 0, 0, 0, 0, 0.3, 0.7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]); // Deuteranopia
		this.blindness_matrix.push([0.8, 0.2, 0, 0, 0, 0.258, 0.742, 0, 0, 0, 0, 0.142, 0.858, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]); // Deuteranomaly
		this.blindness_matrix.push([0.95, 0.05, 0, 0, 0, 0, 0.433, 0.567, 0, 0, 0, 0.475, 0.525, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]); // Tritanopia
		this.blindness_matrix.push([0.967, 0.033, 0, 0, 0, 0, 0.733, 0.267, 0, 0, 0, 0.183, 0.817, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]); // Tritanomaly
		this.blindness_matrix.push([0.299, 0.587, 0.114, 0, 0, 0.299, 0.587, 0.114, 0, 0, 0.299, 0.587, 0.114, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]); // Achromatopsia
		this.blindness_matrix.push([0.618, 0.320, 0.062, 0, 0, 0.163, 0.775, 0.062, 0, 0, 0.163, 0.320, 0.516, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]); // Achromatomaly
		
		this.texts = [];
		
		// Thanks to WIKIPEDIA [http://en.wikipedia.org/wiki/Color_blindness]
		
		this.texts.push("");
		this.texts.push("Protanopia\r(1% of males): reds are greatly reduced");
		this.texts.push("Protanomaly\r(1% of males, 0.01% of females): reds appear weak");
		this.texts.push("Deuteranopia\r(1% of males): greens are greatly reduced");
		this.texts.push("Deuteranomaly\r(most common - 6% of males, 0.4% of females): greens appear weak");
		this.texts.push("Tritanopia\r(less than 1% of males and females): blues are greatly reduced");
		this.texts.push("Tritanomaly\r(equally rare for males and females): blues appear weak");
		this.texts.push("Achromatopsia\rStrictly defined as the inability to see color.");
		this.texts.push("Achromatomaly\rAll colors appear weak");
		
		this.info_txt.text = "";
		
		this.init();
	}
	
	private function init():Void {
		var i:Number;
		var hit:Button;
		
		this.ptLarva = new MovieClipLarva(this.pt);
		this.larva = new FiltersLarva(this.pic);
		
		for (i = 0; i < this.blindness_matrix.length; i++) {
			hit = this["hit_" + i];
			hit.onRelease = Delegate.create(this.go, this, [i, hit]);
		}
	}
	
	private function go(index:Number, bt:Button):Void {
		var end:Array;
		var y:Number;
		var color:Number;
		
		end = this.blindness_matrix[index];
		y = bt._y + 10;
		
		this.larva.colorMatrix(null, end, 5000, 0, Cubic.easeOut);
		this.ptLarva.y(null, y, 5000, 0, Cubic.easeOut);
		this.info_txt.text = this.texts[index];
	}
	
}