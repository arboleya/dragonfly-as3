package dragonfly.core.gunz 
{
	import cocktail.core.gunz.Bullet;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class NymphBullet extends Bullet 
	{
		public var value : Number;

		
		
		public function NymphBullet( value : Number = undefined )
		{
			super( );
			this.value = value;
		}
	}
}
