package ssen.core.display 
{
	import ssen.core.display.SSenSprite;
	import ssen.core.text.FontRender;
	import ssen.core.text.ITextObject;
	import ssen.core.text.SSenTextField;

	import flash.text.AntiAliasType;
	import flash.text.TextField;		
	/**
	 * @author SSen
	 */
	public class AbstTextSprite extends SSenSprite implements ITextObject
	{
		protected var _textObject : TextField;
		private var _width : Number;
		private var _height : Number;

		/* *********************************************************************
		 * public interface
		 ********************************************************************* */
		public function setTextObject(textObject : TextField) : void
		{
			_textObject = textObject;
		}
		public override function get width() : Number
		{
			return _width;
		}
		public override function set width(value : Number) : void
		{
			_width = width;
			align();
		}
		public override function get height() : Number
		{
			return _height;
		}
		public override function set height(value : Number) : void
		{
			_height = height;
			align();
		}
		protected function align() : void
		{
			throw new Error("Abstract function");
		}
		/* *********************************************************************
		 * implement ITextObject
		 ********************************************************************* */
		public function appendText(newText : String) : void
		{
			_textObject.appendText(newText);
		}
		public function replaceText(beginIndex : int, endIndex : int, newText : String) : void
		{
			_textObject.replaceText(beginIndex, endIndex, newText);
		}
		public function setFontRenderingStyle(embedFonts : Boolean = false, sharpness : Number = 0, thickness : Number = 0) : void
		{
			if (embedFonts) {
				_textObject.antiAliasType = AntiAliasType.ADVANCED;
			}
			_textObject.embedFonts = embedFonts;
			_textObject.sharpness = sharpness;
			_textObject.thickness = thickness;
		}
		public function setFontRender(fontRender : FontRender = null) : void
		{
			if (_textObject is SSenTextField) {
				SSenTextField(_textObject).setFontRender(fontRender);
			} else {
				trace("SSEN// font render 기능은 SSenTextField 에서만 제공됩니다.");
			}
		}
		public function get length() : int
		{
			return _textObject.length;
		}
		public function get text() : String
		{
			return _textObject.text;
		}
		public function set text(value : String) : void
		{
			_textObject.text = value;
		}
	}
}
