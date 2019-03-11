package ssen.data.selectGroup 
{
	import ssen.core.array.Values;
	import ssen.core.display.SSenSprite;
	import ssen.core.events.ValueEvent;
	import ssen.core.utils.FormatToString;
	import ssen.data.IDataModel;
	import ssen.data.selectGroup.ISelectItem;	
	/**
	 * 셀렉트 아이템
	 * @author SSen
	 */
	public class SelectItem extends SSenSprite implements ISelectItem
	{
		private var _id : int;
		private var _labelText : String;
		private var _thumbnail : String;
		private var _selected : Boolean;
		private var _group : ISelectGroup;
		private var _values : Values;

		public function SelectItem(id : int, labelText : String, thumbnail : String, selected : Boolean = false, values : Values = null)
		{
			this.id = id;
			this.labelText = labelText;
			this.thumbnail = thumbnail;
			this.selected = selected;
			this.values = values;
		}
		/* *********************************************************************
		 * implement ISelectItemModel
		 ********************************************************************* */
		public function get id() : int
		{
			return _id;
		}
		public function set id(id : int) : void
		{
			_id = id;
			dispatchEvent(new ValueEvent(ValueEvent.VALUE_CHANGED, "id", _id));
		}
		public function get labelText() : String
		{
			return _labelText;
		}
		public function set labelText(text : String) : void
		{
			_labelText = text;
			dispatchEvent(new ValueEvent(ValueEvent.VALUE_CHANGED, "labelText", _labelText));
		}
		public function get thumbnail() : String
		{
			return _thumbnail;
		}
		public function set thumbnail(name : String) : void
		{
			_thumbnail = name;
			dispatchEvent(new ValueEvent(ValueEvent.VALUE_CHANGED, "thumbnail", _thumbnail));
		}
		public function get selected() : Boolean
		{
			return _selected;
		}
		public function set selected(selected : Boolean) : void
		{
			if (_selected != selected) {
				_selected = selected;
				dispatchEvent(new ValueEvent(ValueEvent.VALUE_CHANGED, "selected", _selected));
			}
		}
		public function get values() : Values
		{
			return _values;
		}
		public function set values(values : Values) : void
		{
			_values = values;
		}
		public function get group() : ISelectGroup
		{
			return _group;
		}
		public function set group(group : ISelectGroup) : void
		{
			_group = group;
			dispatchEvent(new ValueEvent(ValueEvent.VALUE_CHANGED, "parentGroup", _group));
		}
		public function get valueXML() : XML
		{
			var item : XML = <item />;
			item["@labelText"] = labelText;
			item["@thumbnail"] = thumbnail;
			item["@selected"] = selected;
			
			if (values != null) {
				item.appendChild(values.getXML());
			}
			
			return item;
		}
		public function resourceKill() : void
		{
			_group = null;
			_values = null;
		}
		public function clone() : IDataModel
		{
			return new SelectItem(id, labelText, thumbnail, selected, values);
		}
		override public function toString() : String
		{
			return FormatToString.toString(this, "id", "labelText", "thumbnail", "selected");
		}
	}
}
