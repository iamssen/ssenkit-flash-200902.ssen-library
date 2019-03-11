package test.component.list 
{
	import ssen.component.list.AbstList;
	import ssen.core.display.SSenSprite;
	import ssen.core.display.SkinMode;
	import ssen.core.display.ThumbnailStore;
	import ssen.core.geom.Padding;
	import ssen.core.text.TextStyle;
	import ssen.data.events.SelectGroupEvent;
	import ssen.data.selectGroup.ISelectItem;
	import ssen.data.selectGroup.SelectGroup;
	import ssen.data.selectGroup.SelectType;
	import ssen.debug.TestButtonGroup;
	import ssen.flour.list.FlourLabelList;
	
	import thumbnails.folder_open;
	import thumbnails.page;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;		
	/**
	 * @author SSen
	 */
	public class ListTest2 extends SSenSprite 
	{
		private var _model : SelectGroup;
		private var _list : AbstList;
		private var _selectAllFlag : Boolean = true;
		private var _model2 : SelectGroup;

		public function ListTest2()
		{
			var thumbs : ThumbnailStore = new ThumbnailStore();
			thumbs.addThumbnail("page", new page(0, 0));
			thumbs.addThumbnail("folder", new folder_open(0, 0));
			
			_model = new SelectGroup(null, SelectType.SINGLE_SELECT);
			_model.addItem("label item3", "page");
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
			
			_model2 = new SelectGroup(null, SelectType.SINGLE_SELECT);
			_model2.addItem("label item3", "page");
			_model2.addItem("label item2", "page");
			_model2.addItem("label item1", "folder");
			_model2.addItem("label item4", "folder");
			_model2.addItem("label item5", "page");
			_model2.addItem("label item6", "page");
			_model2.addItem("label item7", "folder");
			_model2.addItem("label item8", "folder");
			_model2.addItem("label item9", "page");
			_model2.addItem("label item10", "page");
			_model2.addItem("label item11", "folder");
			_model2.addItem("label item12", "folder");
			
			_model.addEventListener(SelectGroupEvent.ADD_ITEM, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.DELETE_ITEM, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.DESELECT_ALL, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.DESELECT_ITEM, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.SELECT_ALL, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.SELECT_ITEM, selectGroupEventHandle);
			_model.addEventListener(SelectGroupEvent.SORT_ITEMS, selectGroupEventHandle);
			_model2.addEventListener(SelectGroupEvent.ADD_ITEM, selectGroupEventHandle);
			_model2.addEventListener(SelectGroupEvent.DELETE_ITEM, selectGroupEventHandle);
			_model2.addEventListener(SelectGroupEvent.DESELECT_ALL, selectGroupEventHandle);
			_model2.addEventListener(SelectGroupEvent.DESELECT_ITEM, selectGroupEventHandle);
			_model2.addEventListener(SelectGroupEvent.SELECT_ALL, selectGroupEventHandle);
			_model2.addEventListener(SelectGroupEvent.SELECT_ITEM, selectGroupEventHandle);
			_model2.addEventListener(SelectGroupEvent.SORT_ITEMS, selectGroupEventHandle);
			
			var fontColors : Vector.<Dictionary> = new Vector.<Dictionary>();
			fontColors.push(getFontColors(0), getFontColors(1));
			var bgColors : Vector.<Dictionary> = new Vector.<Dictionary>();
			bgColors.push(getBG(0), getBG(1));
			//var textStyle : TextStyle = new TextStyle();
			//textStyle.align = TextFormatAlign.RIGHT;
			//var padding : Padding = new Padding(1, 1, 1, 1);
			
			_list = new FlourLabelList(120, 250, 24);
			_list.position = new Point(10, 10);
			
			var test : TestButtonGroup = new TestButtonGroup("get value xml", getValueXML, "add item", addItem, "remove item", removeItem);
			test.addTest("selectAllToggle", selectAllToggle, "select 2", select2, "deselect 3", deselect3);
			test.addTest("selectTypeToggle", selectTypeToggle, "getLength", getLength);
			test.addTest("search 'text'", searchText, "find labelText and foo", findLabelTextAndFoo);
			test.addTest("sort items by value", sortItemsByValue, "sort items by labelText", sortItemsByLabelText);
			test.addTest("selected items thumbnail folder", selectedItemsThumbnailFolder, "selected items", selectedItems);
			// 이 아래부터는 list 전용
			test.addTest("goto selectedY", gotoSelectedY, "set model", setModel, "enable toggle", enableToggle);
			test.addTest("model change", modelChange);
			test.width = 300;
			test.position = _list.nextPosition(20);
			
			addChildren(_list, test);
		}
		private function modelChange() : void
		{
			_list.data = (_list.data == _model) ? _model2 : _model;
		}
		private function enableToggle() : void
		{
			_list.enabled = (_list.enabled) ? false : true;
		}
		private function setModel() : void
		{
			_list.data = _model;
		}
		private function selectedItems() : void
		{
			trace(_model.selectedItems);
		}
		private function selectGroupEventHandle(event : SelectGroupEvent) : void
		{
			trace(event);
			if (event.type == SelectGroupEvent.SELECT_ITEM) {
				_list.moveToSelectedY();
			}
		}
		private function gotoSelectedY() : void
		{
			_list.moveToSelectedY();
		}
		private function selectedItemsThumbnailFolder() : void
		{
			for each(var item:ISelectItem in _model.selectedItems) {
				item.thumbnail = "folder";
			}
		}
		private function sortItemsByLabelText() : void
		{
			_model.sortByLabelText(true);
		}
		private function sortItemsByValue() : void
		{
			_model.sortByValuesProperty("labelText", false);
		}
		private function searchText() : void
		{
			trace(_model.searchLabelText("item"));
		}
		private function findLabelTextAndFoo() : void
		{
			trace(_model.hasValuesProperty("labelText").length, " ||| ", _model.hasValuesProperty("foo").length);
		}
		private function getLength() : void
		{
			trace(_model.length);
		}
		private function selectTypeToggle() : void
		{
			var or : String = _model.selectType;
			_model.selectType = (_model.selectType == SelectType.SINGLE_SELECT) ? SelectType.MULTI_SELECT : SelectType.SINGLE_SELECT;
			trace(or, "==>", _model.selectType);
		}
		private function select2() : void
		{
			_model.selectItemAt(2);
		}
		private function deselect3() : void
		{
			_model.deselectItemAt(3);
		}
		private function selectAllToggle() : void
		{
			if (_selectAllFlag) {
				_model.selectItemAll();
				_selectAllFlag = false;
			} else {
				_model.deselectItemAll();
				_selectAllFlag = true;
			}
		}
		private function removeItem() : void
		{
			_model.deleteItemAt(1);
		}
		private function addItem() : void
		{
			_model.addItem("new item", "page");
		}
		private function getValueXML() : void
		{
			trace(_list.data.valueXML);
		}
		private function getFontColors(type : int) : Dictionary
		{
			var fontColors : Dictionary = new Dictionary(true);
			switch (type) {
				case 1: 
					fontColors[SkinMode.DEFAULT] = 0x666666;
					fontColors[SkinMode.SELECTED] = 0x555555;
					fontColors[SkinMode.OVER] = 0x444444;
					fontColors[SkinMode.ACTION] = 0x222222;
					fontColors[SkinMode.DISABLE] = 0xaaaaaa;
					break;
				default : 
					fontColors[SkinMode.DEFAULT] = 0x666666;
					fontColors[SkinMode.SELECTED] = 0x555555;
					fontColors[SkinMode.OVER] = 0x444444;
					fontColors[SkinMode.ACTION] = 0x222222;
					fontColors[SkinMode.DISABLE] = 0xaaaaaa;
					break;
			}
			return fontColors;
		}
		private function getBG(type : int) : Dictionary
		{
			var colors : Dictionary = new Dictionary(true);
			switch(type) {
				case 1:
					colors[SkinMode.DEFAULT] = 0xeeeeee;
					colors[SkinMode.SELECTED] = 0x000000;
					colors[SkinMode.OVER] = 0xaaaaaa;
					colors[SkinMode.ACTION] = 0x999999;
					colors[SkinMode.DISABLE] = 0xeeeeee;
					break;
				default :
					colors[SkinMode.DEFAULT] = 0xffffff;
					colors[SkinMode.SELECTED] = 0x000000;
					colors[SkinMode.OVER] = 0xaaaaaa;
					colors[SkinMode.ACTION] = 0x999999;
					colors[SkinMode.DISABLE] = 0xffffff;
					break;
			}
			return colors;
		}
	}
}
