/**
* Some old functions for validation, need to be rewrited...
* 
*/


class cocktail.utils.Validation {

	public static function isEmail(e){
		// implementation of the regular expression which defines a correct email adress
		// ^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@([_a-zA-Z0-9-]+\.)+([a-zA-Z][a-zA-Z]+)$
		// written 2001 by ralf bokelberg - actionscript@bokelberg.de

		var k:Number;
		var j:Number;
		var m:Number;
		var foundPoint:Boolean;

		k = j = m = e.length;
		foundPoint = false;

		var checkChars = function(s, i, l) {
			while (i<l && ("_-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789").indexOf(s.charAt(i)) != -1){
				i++;
			}
			return i;
		}

		var checkFirstLevelDomainChars = function(s, i, l) {
			while (i<l && ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").indexOf(s.charAt(i)) != -1) {
				i++;
			}
			return (i == l);
		}

		if ((k=checkChars(e, 0, m)) == 0) return -1;

		j = k;
		while (k<m && e.charAt(k) == ".") {
			k++;
			if ((j=checkChars(e, k, m)) == k) {
				return -2;
			}
			k = j;
		}

		if (e.charAt(k) != "@") return -3;
	
		do {
			k = j+1;
			j = checkChars(e, k, m);

			if (j == k) {
				return -4;
			} else if (j == e.length) {
				j -= k;

				if(foundPoint && j>=2 && checkFirstLevelDomainChars(e, k, m)){
					return 1
				} else {
					return -5
				}
			}

			foundPoint = (e.charAt(j) == ".");
		} while (k<m && foundPoint);

		return -6;
	}

	public static function isCPF(c){
		// written 2006 by henrique matias - work@henriquematias.com
		// dirty code, need rewrite

		var i:Number;
		var lc:Number;
		var len:Number;
	
		var levels:Array;
		
		var sums:Array;
		var difs:Array;
		var digs:Array;

		if( c.length != 11 ) return false;
		if( c.split(c.charAt(0)).length == 12) return false;

		i = 0;
		len = 11;
		for(; i<len; i++){
			if(isNaN(Number(c.charAt(i)))) return false;
		}
	
		levels = new Array;
		sums = new Array;
		difs = new Array;
		digs = new Array;

		levels[0] = [10, 9, 8, 7, 6, 5, 4, 3, 2];
		levels[1] = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2];
	
		lc = 0;
		for(; lc<2; lc++){
			sums[lc] = new Number;
			difs[lc] = new Number;
		
			i = 0;
			len = levels[lc].length;
			for (; i<len; i++) sums[lc] += Number(c.charAt(i)) * levels[lc][i];
		
			difs[lc] = sums[lc] % 11;
			digs[lc] = (difs[lc] < 2) ? (0) : (11 - difs[lc]);
		}

		if( digs[0] == Number(c.charAt(9)) && digs[1] == Number(c.charAt(10)) ){
			return true;
		}else{
			return false;
		}
	}

}