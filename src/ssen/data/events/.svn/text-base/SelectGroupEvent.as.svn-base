package ssen.data.events 
{
	import ssen.data.selectGroup.ISelectItem;

	import flash.events.Event;	
	/**
	 * @author SSen
	 */
	public class SelectGroupEvent extends Event 
	{
		public static const ADD_ITEM : String = "addItem";
		public static const DELETE_ITEM : String = "deleteItem";
		public static const SELECT_ALL : String = "selectAll";
		public static const DESELECT_ALL : String = "deselectAll";
		public static const SELECT_ITEM : String = "selectItem";
		public static const DESELECT_ITEM : String = "deselectItem";
		public static const SORT_ITEMS : String = "sortItems";
		private var _item : ISelectItem;
		private var _multiSelect : Boolean;

		public function SelectGroupEvent(type : String, item : ISelectItem = null, multiSelect : Boolean = false, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			
			_item = item;
			_multiSelect = multiSelect;
		}
		public function get multiSelect() : Boolean
		{
			return _multiSelect;
		}
		public function get item() : ISelectItem
		{
			return _item;
		}
		override public function clone() : Event
		{
			return new SelectGroupEvent(type, item, multiSelect, bubbles, cancelable);
		}
		override public function toString() : String
		{
			return formatToString("SelectGroupEvent", "type", "multiSelect", "item");
		}
	}
}
