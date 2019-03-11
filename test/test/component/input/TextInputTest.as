package test.component.input 
{
	import ssen.core.display.SSenSprite;
	import ssen.core.display.SkinMode;
	import ssen.core.text.InputTextField;
	import ssen.core.text.TextStyle;
	
	import flash.events.TextEvent;
	import flash.geom.Point;
	import flash.utils.Dictionary;		
	/**
	 * @author SSen
	 */
	public class TextInputTest extends SSenSprite 
	{
		public function TextInputTest()
		{
			var txt : InputTextField = new InputTextField(new TextStyle(), getFontColors(0));
			txt.position = new Point(10, 10);
			txt.value = "가나다";
			txt.border = true;
			txt.width = 200;
			txt.autoSizeHeight();
			txt.addEventListener(TextEvent.TEXT_INPUT, textInput);
			addChildren(txt);
		}
		private function textInput(event : TextEvent) : void
		{
			trace(event.text, event.target["text"]);
		}
		private function getFontColors(type : int) : Dictionary
		{
			var fontColors : Dictionary = new Dictionary(true);
			switch (type) {
				default : 
					fontColors[SkinMode.DEFAULT] = 0xcccccc;
					fontColors[SkinMode.OVER] = 0x77A51B;
					fontColors[SkinMode.ACTION] = 0x225AD9;
					fontColors[SkinMode.HIGHLIGHT] = 0x000000;
					fontColors[SkinMode.DISABLE] = 0xeeeeee;
					break;
			}
			return fontColors;
		}
	}
}
