package dragonfly.core.gunz 
{
	import cocktail.core.gunz.Bullet;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class NymphBullet extends Bullet 
	{
		public var target : *;
		public var prop : *;
		public var value : *;
		public var is_multiple : Boolean;

		
		
		public function NymphBullet(
			target : *,
			prop : String, 
			value : * = undefined
		)
		{
			super( );
			this.target = target;
			this.prop = prop;
			this.value = value;
			is_multiple = ( value is Array && ( value as Array ).length );
		}
	}
}
