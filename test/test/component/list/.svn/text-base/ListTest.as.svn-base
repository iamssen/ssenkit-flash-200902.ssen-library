package test.component.list 
{
	import ssen.component.list.LabelListItem;
	import ssen.core.display.ISkinObject;
	import ssen.core.display.SSenSprite;
	import ssen.core.display.SkinMode;
	import ssen.core.display.SkinSolidColorShape;
	import ssen.core.events.OnOffEvent;
	import ssen.core.geom.Padding;
	import ssen.core.text.TextStyle;
	import ssen.data.selectGroup.ISelectItem;
	import ssen.data.selectGroup.SelectItem;
	import ssen.debug.TestButtonGroup;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;	
	/**
	 * @author SSen
	 */
	public class ListTest extends SSenSprite 
	{
		private var _item : LabelListItem;
		private var _model : ISelectItem;

		public function ListTest()
		{
			_model = new SelectItem(0, "test item model", "thumb 1");
			var padding : Padding = new Padding(1, 1, 1, 1);
			var textStyle : TextStyle = new TextStyle();
			_item = new LabelListItem(getBG(1), 120, 24, padding, getFontColors(1), textStyle, null, null);
			_item.addEventListener(OnOffEvent.ONOFF, onoff);
			_item.position = new Point(10, 10);
			_item.data = _model;
			
			var test : TestButtonGroup = new TestButtonGroup("labelText Change", labelTextChange);
			test.position = _item.nextPositionBr(20);
			
			var t1 : Number = getTimer();
			
			var f : int;
			var model : SelectItem;
			var item : LabelListItem;
			for (f = 0;f < 1000; f++) {
				model = new SelectItem(f, "test item model", "thumb 1");
				item = new LabelListItem(getBG(1), 120, 25, padding, getFontColors(1), textStyle, true, null, null, model);
			}
			
			var  t2 : Number = getTimer();
			trace(t2 - t1);
			
			addChildren(_item, test);
		}
		private function onoff(event : OnOffEvent) : void
		{
			trace("onoff :", event);
		}
		private function labelTextChange() : void
		{
			_model.labelText = "changed label list item text";
		}
		private function getFontColors(type : int) : Dictionary
		{
			var fontColors : Dictionary = new Dictionary(true);
			switch (type) {
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
		private function getBG(type : int) : ISkinObject
		{
			var colors : Dictionary = new Dictionary(true);
			switch(type) {
				default :
					colors[SkinMode.DEFAULT] = 0xeeeeee;
					colors[SkinMode.SELECTED] = 0x000000;
					colors[SkinMode.OVER] = 0xaaaaaa;
					colors[SkinMode.ACTION] = 0x999999;
					colors[SkinMode.DISABLE] = 0xffffff;
					break;
			}
			return new SkinSolidColorShape(colors, 100, 100);
		}
	}
}
