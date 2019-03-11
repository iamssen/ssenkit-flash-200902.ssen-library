package ssen.core.display 
{
	import ssen.core.display.SSenSprite;

	import flash.display.Graphics;
	import flash.utils.Dictionary;	
	/**
	 * @author SSen
	 */
	public class SkinSolidColorSprite extends SSenSprite implements ISkinObject
	{
		private var _width : Number;
		private var _height : Number;
		private var _colors : Dictionary;
		private var _flag : String;

		public function SkinSolidColorSprite(colors : Dictionary, width : Number, height : Number)
		{
			_width = width;
			_height = height;
			_colors = colors;
			_flag = SkinMode.DEFAULT;
			
			draw();
		}
		private function draw() : void
		{
			var g : Graphics = graphics;
			g.clear();
			g.beginFill(_colors[_flag]);
			g.drawRect(0, 0, _width, _height);
			g.endFill();
		}
		override public function get width() : Number
		{
			return _width;
		}
		override public function set width(value : Number) : void
		{
			_width = value;
			draw();
		}
		override public function get height() : Number
		{
			return _height;
		}
		override public function set height(value : Number) : void
		{
			_height = value;
			draw();
		}
		/* *********************************************************************
		 * implement ISkinObject
		 ********************************************************************* */
		public function skinning(modeName : String = "default") : void
		{
			if (_flag != modeName) {
				_flag = modeName;
				draw();
			}
		}
		public function get flag() : String
		{
			return _flag;
		}
		public function get skinList() : Array
		{
			var arr : Array = new Array();
			var name : String;
			for (name in _colors) {
				arr.push(name);
			}
			return arr;
		}
	}
}
