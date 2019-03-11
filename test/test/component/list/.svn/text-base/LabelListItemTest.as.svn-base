package test.component.list 
{
	import ssen.component.list.LabelListItem;
	import ssen.core.display.DisplayObjectEx;
	import ssen.core.display.SSenSprite;
	import ssen.core.display.SkinMode;
	import ssen.core.display.SkinSolidColorShape;
	import ssen.core.display.ThumbnailStore;
	import ssen.core.geom.Padding;
	import ssen.core.text.TextStyle;
	import ssen.data.selectGroup.ISelectItem;
	import ssen.data.selectGroup.SelectItem;
	
	import thumbnails.folder_open;
	import thumbnails.page;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;	
	/**
	 * @author SSen
	 */
	public class LabelListItemTest extends SSenSprite 
	{
		private var i : ISelectItem;
		private var item : LabelListItem;

		public function LabelListItemTest()
		{
			var thumbs : ThumbnailStore = new ThumbnailStore();
			thumbs.addThumbnail("page", new page(0, 0));
			thumbs.addThumbnail("folder", new folder_open(0, 0));
			
			i = new SelectItem(0, "item", "page");
			
			var ts : TextStyle = new TextStyle();
			var pd : Padding = new Padding(1, 1, 1, 1);
			
			item = new LabelListItem(new SkinSolidColorShape(getBG(0), 100, 100), 120, 24, pd, getFontColors(0), ts, true, thumbs, null, i);
			item.position = new Point(10, 10);
			
			addChildren(DisplayObjectEx.createColorShapeBox(0xE8F2FE, 550, 400), item);
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
