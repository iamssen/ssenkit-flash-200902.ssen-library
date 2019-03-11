package test.component.checkBox 
{
	import ssen.component.checkBox.CheckBoxItem;
	import ssen.core.display.ISkinObject;
	import ssen.core.display.SSenSprite;
	import ssen.core.display.SkinMode;
	import ssen.core.display.SkinSolidColorSprite;
	import ssen.core.geom.VerticalAlign;
	import ssen.core.text.TextStyle;
	import ssen.data.selectGroup.SelectItem;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;	
	/**
	 * @author SSen
	 */
	public class CheckBoxItemTest extends SSenSprite 
	{
		private var _model : SelectItem;
		private var _item : CheckBoxItem;

		public function CheckBoxItemTest()
		{
			var checkBox : ISkinObject = new SkinSolidColorSprite(getBG(1), 10, 10);
			_model = new SelectItem(0, "check box item", "item1", false, null);
			_item = new CheckBoxItem(checkBox, 100, true, getFontColors(0), new TextStyle(), false, VerticalAlign.MIDDLE, null, _model);
			_item.position = new Point(10, 10);
			
			addChildren(_item);
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
