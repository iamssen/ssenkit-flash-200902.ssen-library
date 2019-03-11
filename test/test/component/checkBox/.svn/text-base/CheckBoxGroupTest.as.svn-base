package test.component.checkBox 
{
	import flash.geom.Point;	
	
	import ssen.component.checkBox.CheckBoxGroup;	
	import ssen.core.display.SSenSprite;
	import ssen.data.events.SelectGroupEvent;
	import ssen.data.selectGroup.SelectGroup;
	import ssen.data.selectGroup.SelectType;	
	/**
	 * @author SSen
	 */
	public class CheckBoxGroupTest extends SSenSprite 
	{
		private var _model : SelectGroup;
		private var _group : CheckBoxGroup;

		public function CheckBoxGroupTest()
		{
			_model = new SelectGroup(null, SelectType.SINGLE_SELECT);
			_model.addItem("label item3 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "page");
			_model.addItem("label item2", "page");
			_model.addItem("label item1", "folder");
			_model.addItem("label item4", "folder");
			_model.addItem("label item5", "page");
			_model.addItem("label item6", "page");
			_model.addItem("label item7", "folder");
			_model.addItem("label item8", "folder");
			_model.addItem("label item9", "page");
			_model.addItem("label item10", "page");
			_model.addItem("label item11", "folder");
			_model.addItem("label item12", "folder");
			
			_model.addEventListener(SelectGroupEvent.ADD_ITEM, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.DELETE_ITEM, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.DESELECT_ALL, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.DESELECT_ITEM, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.SELECT_ALL, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.SELECT_ITEM, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.SORT_ITEMS, selectGroupEventHandle);
			
			_group = new CheckBoxGroup(400, 5, 5, _model);
			_group.position = new Point(10, 10);
			
			addChildren(_group);
		}
		private function selectGroupEventHandle(event : SelectGroupEvent) : void
		{
			trace(event);
		}
	}
}
