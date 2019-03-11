package test.component.sliders 
{
	import ssen.component.scroll.DirectionMode;
	import ssen.component.sliders.SliderBase;
	import ssen.core.display.DisplayObjectEx;
	import ssen.core.display.SkinMode;
	import ssen.core.display.SkinSprite;
	
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.utils.Dictionary;	
	/**
	 * @author SSen
	 */
	public class TestSlider extends SliderBase 
	{
		public function TestSlider(width : int)
		{
			var thumbBox1 : Shape = DisplayObjectEx.createColorShapeBox(0xC6D6FD);
			var thumbBox2 : Shape = DisplayObjectEx.createColorShapeBox(0x7A95DF);
			var thumbBox3 : Shape = DisplayObjectEx.createColorShapeBox(0x52549A);
			var thumbBox4 : Shape = DisplayObjectEx.createColorShapeBox(0xaaaaaa);
			var thumbDic : Dictionary = new Dictionary();
			thumbDic[SkinMode.DEFAULT] = thumbBox1;
			thumbDic[SkinMode.OVER] = thumbBox2;
			thumbDic[SkinMode.ACTION] = thumbBox3;
			thumbDic[SkinMode.DISABLE] = thumbBox4;
			var thumb : SkinSprite = new SkinSprite(thumbDic);
			
			var trackBox1 : Shape = DisplayObjectEx.createColorShapeBox(0xeeeeee);
			var trackBox2 : Shape = DisplayObjectEx.createColorShapeBox(0xaaaaaa);
			var trackBox3 : Shape = DisplayObjectEx.createColorShapeBox(0x000000);
			var trackDic : Dictionary = new Dictionary();
			trackDic[SkinMode.DEFAULT] = trackBox1;
			trackDic[SkinMode.ACTION] = trackBox2;
			trackDic[SkinMode.DISABLE] = trackBox3;
			var track : SkinSprite = new SkinSprite(trackDic);
			
			var segmentBitmap : BitmapData = new BitmapData(2, 4, false, 0xaaaaaa);
			var segments : Vector.<int> = new Vector.<int>();
			segments.push(100, 400, 600, 900);
			
			addChildren(track, thumb);
			
			track.width = width;
			track.height = 5;
			thumb.width = 5;
			thumb.height = 10;
			
			setting(track, thumb, DirectionMode.HORIZONTAL, 0, 1000, 500, -1, -1, segments, segmentBitmap, 6, true);
		}
	}
}
