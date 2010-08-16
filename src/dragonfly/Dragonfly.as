/* -----------------------------------------------------------------------------Dragonfly - ActionScript Animation Suite. Copyright (C) 2010 Codeine.--------------------------------------------------------------------------------   This library is free software; you can redistribute it and/or modifyit under the terms of the GNU Lesser General Public License as publishedby the Free Software Foundation; either version 2.1 of the License, or(at your option) any later version.		This library is distributed in the hope that it will be useful, butWITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITYor FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General PublicLicense for more details.You should have received a copy of the GNU Lesser General Public Licensealong with this library; if not, write to the Free Software Foundation,Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA===================Codeinehttp://codeine.itcontact@codeine.it===================----------------------------------------------------------------------------- */package dragonfly  {
	import dragonfly.core.health.Vitamin;	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Dragonfly 
	{		/* ----- VARIABLES -------------------------------------------------- */		/** 		 * Specify whether dragonfly will use cached or not, if boost=0 no cache		 * is used, otherwise boost > 0, it means the number of cached steps to		 * use in all tweens.		 */
		private static var _boost : Number = 0;
		/**		 * Specify whether dragonfly is enable or not. When disable, all start,		 * progress and complete events fires as usual, but without tween. 		 */		private static var _enabled : Boolean = true;		/**		 * Specify whether dragonfly should force time-perfect execution for		 * tween, enforcing that the end of the tween matches its duration		 * as more precise as possible.		 */		private static var _time_perfect : Boolean = true;		/* ----- INITIALIZING ----------------------------------------------- */				/**
		 * Dragonfly is a static class and should'n be instantiated!
		 */
		public function Dragonfly()
		{			var msg : String;			msg = "Dragonfly is a static class and should not be instantiated.";
			throw new Error( msg );
		}
		/* ----- GETTERS / SETTERS ------------------------------------------ */				/* ENABLE / DISABLE */				/**		 * Check if the Dragonfly engine is ON or OFF.
		 * @return	<code>true</code> if engine is active, <code>false</code>
		 * otherwise. When it's disabled, all start, progress and complete		 * events fires as usual, but without tween. It's pretty usefull for		 * debugging purposes, whe the motion is ok and you just want to debug		 * the rest.		 */
		public static function get enabled() : Boolean 
		{
			return _enabled;
		}
		/**		 * Enables the Dragonfly engine (transition mode ON).
		 */
		public static function enable() : void 
		{
			_enabled = true;
		}
		/**		 * Disables the Dragonfly engine (transition mode OFF).
		 */
		public static function disable() : void 
		{
			_enabled = false;
		}
		/* BOOST */				/**		 * Boost the Dragonfly by using cached equations and quantization		 * instead of computing the equation every tween interaction.		 * @param value	Number of steps to cache / use, keep in mind that the		 * number of steps should be something around your tween avarage		 * duration divided by something about 50ms.		 * 		 * By default, it disables the Dragonfly.time_perfect feature for better 		 * results.		 */		public static function set boost( value : int ) : void 		{
			if( ( _boost = value ) )				Vitamin.load( value );						_time_perfect = ( _boost == 0 );		}
		public static function get boost() : int
		{
			return _boost;
		}		/* TIMING */				/**		 * Enables / disables the Dragonfly time-perfect execution. It enforces		 * that the end of the tween matches its duration  as more precise		 * as possible.		 */		public static function set time_perfect( value : Boolean ) : void
		{
			_time_perfect = value;
		}		public static function get time_perfect() : Boolean
		{
			return _time_perfect;		}	}
}