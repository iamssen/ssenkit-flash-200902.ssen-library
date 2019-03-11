package ssen.core.text 
{
	import ssen.core.events.SkinEvent;	
	import ssen.core.display.ISkinObject;
	import ssen.core.display.SkinMode;
	import ssen.core.number.NumberEx;
	import ssen.core.text.RestrictGroup;
	import ssen.core.text.SSenTextField;
	import ssen.core.text.StringEx;
	import ssen.core.text.TextStyle;

	import flash.events.FocusEvent;
	import flash.text.TextFieldType;
	import flash.utils.Dictionary;	
	/**
	 * @author SSen
	 */
	public class InputTextField extends SSenTextField implements ISkinObject
	{
		private var _fontColors : Dictionary;
		private var _textStyle : TextStyle;
		private var _inputType : String;
		private var _frontMark : String;
		private var _backMark : String;
		private var _skinMode : String;
		private var _value : Object;
		private var _enabled : Boolean;
		private var _type : String;
		private var _highlight : Boolean;

		public function InputTextField(textStyle : TextStyle, fontColors : Dictionary, inputType : String = "all", frontMark : String = "", backMark : String = "")
		{
			_value = "";
			_fontColors = fontColors;
			_frontMark = frontMark;
			_backMark = backMark;
			_enabled = true;
			alwaysShowSelection = true;
			type = TextFieldType.INPUT;
			
			this.textStyle = textStyle;
			this.inputType = inputType;
			
			eventOn();
		}
		private function eventOn() : void
		{
			addEventListener(FocusEvent.FOCUS_IN, focusIn, false, 0, true);
			addEventListener(FocusEvent.FOCUS_OUT, focusOut, false, 0, true);
		}
		private function eventOff() : void
		{
			removeEventListener(FocusEvent.FOCUS_IN, focusIn);
			removeEventListener(FocusEvent.FOCUS_OUT, focusOut);
		}
		private function focusOut(event : FocusEvent) : void
		{
			_value = (_inputType == InputType.NUMBER) ? StringEx.removeBlank(text) : text;
			setText();
			skinning(SkinMode.DEFAULT);
		}
		private function focusIn(event : FocusEvent) : void
		{
			text = String(_value);
			skinning(SkinMode.ACTION);
		}
		/* *********************************************************************
		 * api
		 ********************************************************************* */
		public function get fontColors() : Dictionary
		{
			return _fontColors;
		}
		public function set fontColors(fontColors : Dictionary) : void
		{
			_fontColors = fontColors;
			skinning(_skinMode);
		}
		public function get textStyle() : TextStyle
		{
			return _textStyle;
		}
		public function set textStyle(textStyle : TextStyle) : void
		{
			_textStyle = textStyle;
			setTextFormat(textStyle);
			defaultTextFormat = textStyle;
		}
		public function get inputType() : String
		{
			return _inputType;
		}
		public function set inputType(inputType : String) : void
		{
			_inputType = inputType;
			_value = null;
			setText();
			switch (_inputType) {
				case InputType.NUMBER :
					restrict = RestrictGroup.NUMBER;
					displayAsPassword = false;
					break;
				case InputType.ENGLISH :
				case InputType.DOMAIN :
				case InputType.EMAIL :
					restrict = RestrictGroup.ENGLISH;
					displayAsPassword = false;
					break;
				case InputType.PASSWORD :
					restrict = RestrictGroup.NULL;
					displayAsPassword = true;
				default :
					restrict = RestrictGroup.NULL;
					break;
			}
		}
		private function setText() : void
		{
			if (_value == null) _value = "";
			var value : String = (isNaN(Number(_value)) || _inputType != InputType.NUMBER) ? String(_value) : NumberEx.comma(_value, null, "-");
			text = _frontMark + value + _backMark;
		}
		public function get frontMark() : String
		{
			return _frontMark;
		}
		public function set frontMark(frontMark : String) : void
		{
			_frontMark = frontMark;
			setText();
		}
		public function get backMark() : String
		{
			return _backMark;
		}
		public function set backMark(backMark : String) : void
		{
			_backMark = backMark;
			setText();
		}
		public function get value() : Object
		{
			return _value;
		}
		public function set value(value : Object) : void
		{
			_value = value;
			setText();
		}
		public function get enabled() : Boolean
		{
			return _enabled;
		}
		public function set enabled(enabled : Boolean) : void
		{
			if (enabled != _enabled) {
				if (enabled) {
					super.type = _type;
					if (stage.focus == this) {
						skinning(SkinMode.ACTION);
					} else {
						skinning(SkinMode.DEFAULT);
					}
				} else {
					super.type = TextFieldType.DYNAMIC;
					skinning(SkinMode.DISABLE);
				}
				mouseEnabled = enabled;
				tabEnabled = enabled;
				_enabled = enabled;
			}
		}
		override public function get type() : String
		{
			return _type;
		}
		override public function set type(type : String) : void
		{
			if (_type != type) {
				super.type = type;
				_type = type;
				if (type == TextFieldType.INPUT) {
					eventOn();
				} else {
					eventOff();
				}
				if (_enabled) {
					skinning(SkinMode.DEFAULT);
				} else {
					skinning(SkinMode.DISABLE);
				}
			}
		}
		/* *********************************************************************
		 * implement ISkinObject
		 ********************************************************************* */
		public function skinning(modeName : String = "default") : void
		{
			if (_highlight && modeName == SkinMode.DEFAULT) modeName = SkinMode.HIGHLIGHT;
			if (_skinMode != modeName) {
				_skinMode = modeName;
				textColor = _fontColors[modeName];
				dispatchEvent(new SkinEvent(SkinEvent.SKINNING, modeName));
			}
		}
		public function get flag() : String
		{
			return _skinMode;
		}
		public function get skinList() : Array
		{
			return [SkinMode.DEFAULT, SkinMode.OVER, SkinMode.ACTION, SkinMode.HIGHLIGHT, SkinMode.DISABLE];
		}
		public function get highlight() : Boolean
		{
			return _highlight;
		}
		public function set highlight(highlight : Boolean) : void
		{
			_highlight = highlight;
			skinning(SkinMode.DEFAULT);
		}
	}
}
