package cocktail.core.gunz 
{
	import flash.events.Event;
	import flash.utils.describeType;

	
	
	/**
	 * Stores all necessary and maybe useful info.
	 * 
	 * @author nybras | me@nybras.com
	 */
	public class Bullet 
	{
		/* VARS */
		
		/** 
		 * Bullet type. 
		 * @private
		 */
		internal var _type : String;
		/** 
		 * Bullet params. 
		 * @private
		 */
		internal var _params : *;
		/** 
		 * Bullet owner. 
		 * @private
		 */
		internal var _owner : *;
		/** 
		 * NOW() time stamp of the fire momment. 
		 * @private 
		 */
		internal var _now : Date;
		/** 
		 * Current execution time.
		 * @private
		 */
		internal var _time : int;
		/** 
		 * Execution times limit. 
		 * @private
		 */
		internal var _times : int;
		/** 
		 * Bullet proxied event (if captured from Adobe AS3 Events). 
		 * @private
		 */
		protected var _event : Event;

		
		
		/* INITIALIZING */
		
		/**
		 * Creates a new bulet.
		 */
		public function Bullet() : void
		{
			_times = -1;
		}

		/* INJECTING ADOBE CS3 EVENTS */
		
		/**
		 * Injects the given Event into the bullet.
		 * @param ev	Adobe AS3 Event instance.
		 */
		public function inject( ev : Event ) : Bullet 
		{
			_event = ev;
			return this;
		}

		/* PUBLIC GETTERS */
		
		/**
		 * Returns the bullet type.
		 */
		public function get type() : String
		{
			return _type;	
		}

		/**
		 * Returns the NOW() timestamp of the fire momment.
		 */
		public function get now() : Date 
		{
			return _now;
		}

		/**
		 * Returns the bullet executions times limit.
		 */
		public function get times() : int 
		{
			return _times;
		}

		/**
		 * Returns the bullet current execution fire.
		 */
		public function get time() : int 
		{
			return _time;
		}

		/**
		 * Returns the bullet params.
		 */
		public function get params() : *
		{
			return _params;
		}

		/*
		 * Sets the bullet params.
		 */
		public function set params( params : * ) : void
		{
			_params = params;
		}

		/**
		 * Returns the bullet owner.
		 */
		public function get owner() : *
		{
			return _owner;
		}

		/**
		 * Returns the bullet original event (if captured from Adobe AS3 Events).
		 */
		public function get event() : Event
		{
			return _event;
		}

		/**
		 * Specifies the bullet original event (captured from Adobe AS3 Events).
		 * @param event	Original Adobe AS3 Event.
		 */
		public function set event( event : Event ) : void
		{
			_event = event;
		}

		/* TO STRING CONVERSION */
		
		/**
		 * Format all public properties to String.
		 * @param	The bullet into String format.
		 */
		public function toString() : String
		{
			var obj_type : String;
			var output : String;
			var described : XML;
			var props : XMLList;
			var prop : XML;
			var i : int;
			
			described = describeType( this );
			obj_type = String( described.@name ).split( "::" ).pop( );
			
			output = "[object " + obj_type + "]\n{\n";
			props = described[ "variable" ]; 
			
			output += "\ttype : String = " + type + ";\n";
			output += "\ttimes : Number = " + times + ";\n";
			output += "\ttime : Number = " + time + ";\n";
			output += "\tnow : Number = " + now + ";\n";
			output += "\towner : * = " + owner + ";\n";
			output += "\tparams : * = " + params + ";\n";
			output += "\n\t>>>>> VARIABLES:\n\t-----\n";
			
			for each( prop in props )
			do
			{
				prop = props[ i ];
				
				if( !prop ) continue;
				
				output += "\t" + prop.@name + " : ";
				output += String( prop.@type ).split( "::" ).pop( ) + " = ";
				output += this[ prop.@name ] + ";\n";
			} while( ++i < props.length( ) );
			
			return output + "}";
		}
	}
}