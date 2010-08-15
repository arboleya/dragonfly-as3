package dragonfly.addons.interfaces 
{
	/**
	 * @author nybras | nybras@codeine.it
	 */
	public interface IEgg 
	{
		function init() : void;
		function render( prop : String, value : * ) : void;
	}
}