package dragonfly.core 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;
	import cocktail.core.gunz.GunzGroup;

	import dragonfly.core.gunz.FlightBullet;
	import dragonfly.core.gunz.NymphBullet;

	
	
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public class Flight 
	{
		public var gunz : Gunz;
		public var gunz_on_start : Gun;
		public var gunz_on_progress : Gun;
		public var gunz_on_complete : Gun;
		private var _gunz_group_complete : GunzGroup;
		private var _started : Boolean;

		
		
		public function Flight() 
		{
			gunz = new Gunz( this );
			gunz_on_start = new Gun( gunz, this, "start" );
			gunz_on_progress = new Gun( gunz, this, "progress" );
			gunz_on_complete = new Gun( gunz, this, "complete" );
			
			_gunz_group_complete = new GunzGroup( );
			_gunz_group_complete.gunz_complete.add( _shoot, gunz_on_complete );
		}

		private function _shoot( bullet : NymphBullet ) : void
		{
			var flight : FlightBullet;
			var gun : Gun;
			
			flight = new FlightBullet( bullet.target, bullet.prop, bullet.value );
			gun = Gun( bullet.params );
			 
			if( gun.type == "start" )
			{
				if( _started )
					return;
				else
					_started = true;
			}
			
			gun.shoot( flight );
		}

		public function add_egg( egg : Egg ) : Flight
		{
			egg.gunz_on_start.add( _shoot, gunz_on_start );
			egg.gunz_on_progress.add( _shoot, gunz_on_progress );
			_gunz_group_complete.add( egg.gunz_on_complete );
			return this;
		}

		public function add(
			complete : Function,
			progress : Function = null,
			start : Function = null
		) : Flight
		{
			gunz_on_complete.add( complete );
			if( progress != null )
				gunz_on_progress.add( progress );
			if( start != null )
				gunz_on_start.add( start );
			return this;
		}
	}
}