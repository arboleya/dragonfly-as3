/* -----------------------------------------------------------------------------Dragonfly - ActionScript Animation Suite. Copyright (C) 2010 Codeine.--------------------------------------------------------------------------------   This library is free software; you can redistribute it and/or modifyit under the terms of the GNU Lesser General Public License as publishedby the Free Software Foundation; either version 2.1 of the License, or(at your option) any later version.		This library is distributed in the hope that it will be useful, butWITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITYor FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General PublicLicense for more details.You should have received a copy of the GNU Lesser General Public Licensealong with this library; if not, write to the Free Software Foundation,Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA===================Codeinehttp://codeine.itcontact@codeine.it===================----------------------------------------------------------------------------- */package dragonfly  {
	import dragonfly.core.health.Vitamin;	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Dragonfly 
	{
		private static var _boost : Number = 0;
		private static var _enabled : Boolean = true;		private static var _time_perfect : Boolean = true;
		/**
		 * Constructor
		 */
		public function Dragonfly()
		{
			throw new Error( "Dragonfly is a static class and should not be instantiated." );
		}
		/**
		 * Check if the Dragonfly engine is ON or OFF
		 * 
		 * @return	TRUE if engine is active, FALSE otherwise
		 */
		public static function get enabled() : Boolean 
		{
			return _enabled;
		}
		/**
		 * Enable the Dragonfly engine ( transition mode ON )
		 */
		public static function enable() : void 
		{
			_enabled = true;
		}
		/**
		 * Disable the Dragonfly engine ( transition mode OFF )
		 */
		public static function disable() : void 
		{
			_enabled = false;
		}		public static function set boost( value : int ) : void 
		{			if( ( _boost = value ) )				Vitamin.load( value );						_time_perfect = ( _boost == 0 );
		}		public static function get boost() : int
		{
			return _boost;
		}		public static function get time_perfect() : Boolean
		{
			return _time_perfect;
		}	}
}