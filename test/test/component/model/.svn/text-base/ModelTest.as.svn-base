package test.component.model 
{
	import ssen.core.display.SSenSprite;
	import ssen.core.events.ValueEvent;
	import ssen.data.events.SelectGroupEvent;
	import ssen.data.selectGroup.ISelectItem;
	import ssen.data.selectGroup.SelectGroup;
	import ssen.data.selectGroup.SelectItem;
	
	import flash.utils.getQualifiedClassName;	
	/**
	 * @author SSen
	 */
	public class ModelTest extends SSenSprite 
	{
		public function ModelTest()
		{
			var xml : XML = <group type="single">
								<item id="0" labelText="select item model" selected="false" property1="property1 value" property2="property2 value" />
								<label id="1" labelText="select item label model" />
								<group>
									<item id="0" labelText="select item model sub0" selected="false" />
									<item id="1" labelText="select item model sub1" selected="false" />
									<item id="2" labelText="select item model sub2" selected="false" />
								</group>
							</group>;
			var list : Vector.<ISelectItemModel> = new Vector.<ISelectItemModel>(3, true);
			list[0] = new SelectItem(0, "select item model", "thumb 1");
			
			var item : ISelectItem;
			for (var f : int = 0;f < list.length;f++) {
				item = list[f];
				item.addEventListener(ValueEvent.VALUE_ADDED, valueChange);
				item.addEventListener(ValueEvent.VALUE_CHANGED, valueChange);
				item.addEventListener(ValueEvent.VALUE_DELETED, valueChange);
				trace("=============", getQualifiedClassName(item), "test start ===============");
				// id test
				trace(item, item.id);
				item.id += 1;
				trace(item, item.id);
				// selected test
				trace(item, item.selected);
				item.selected = true;
				trace(item, item.selected);
				// labelText test
				trace(item, item.labelText);
				item.labelText = getQualifiedClassName(item) + ".labelText";
				trace(item, item.labelText);
				// values
				trace(item, item.values);
				if (item.values != null) item.values["testValue"] = 345;
				trace(item, item.values);
			}
			
			trace("==========================================================================");
			trace("==========================================================================");
			trace("==========================================================================");
			
			var group : SelectGroup = new SelectGroup();
			group.addEventListener(SelectGroupEvent.ADD_ITEM, groupEvent);
			group.addEventListener(SelectGroupEvent.DELETE_ITEM, groupEvent);
			group.addEventListener(SelectGroupEvent.DESELECT_ALL, groupEvent);
			group.addEventListener(SelectGroupEvent.DESELECT_ITEM, groupEvent);
			group.addEventListener(SelectGroupEvent.SELECT_ALL, groupEvent);
			group.addEventListener(SelectGroupEvent.SELECT_ITEM, groupEvent);
			group.addItem("item 1", "thumb 1");
			group.addItem("item 2", "thumb 1");
			group.deleteItemAt(1);
			group.selectItemAll();
			group.deselectItemAll();
			group.selectItemAt(0);
			
			trace(group.selectedItems.length);
			trace(group.valueXML);
		}
		private function groupEvent(event : SelectGroupEvent) : void
		{
			trace(event);
		}
		private function valueChange(event : ValueEvent) : void
		{
			trace(event);
		}
	}
}
