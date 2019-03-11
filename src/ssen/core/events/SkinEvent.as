package ssen.core.events 
{
	import flash.events.Event;
	/**
	 * @author SSen
	 */
	public class SkinEvent extends Event 
	{
		public static const SKINNING : String = "skinning";
		private var _skinFlag : String;

		public function SkinEvent(type : String, skinFlag : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			_skinFlag = skinFlag;
		}
		public function get skinFlag() : String
		{
			return _skinFlag;
		}
		override public function clone() : Event
		{
			return new SkinEvent(type, skinFlag, bubbles, cancelable);
		}
		override public function toString() : String
		{
			return formatToString("SkinEvent", "type", "skinFlag");
		}
	}
}
