package ssen.core.display 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.TriangleCulling;
	import flash.geom.Point;	
	/**
	 * @author SSen
	 */
	public class DistortShape extends Shape implements ISSenDisplayObject
	{
		private var _vertices : Vector.<Number>;
		private var _indices : Vector.<int>;
		private var _bitmapData : BitmapData;
		private var _uvData : Vector.<Number>;
		private var _controller : SSenDisplayObjectController;

		public function DistortShape(tl : Point, tr : Point, dl : Point, dr : Point, bitmapData : BitmapData)
		{
			_vertices = new Vector.<Number>(8, true);
			_vertices[0] = tl.x;
			_vertices[1] = tl.y;
			_vertices[2] = tr.x;
			_vertices[3] = tr.y;
			_vertices[4] = dl.x;
			_vertices[5] = dl.y;
			_vertices[6] = dr.x;
			_vertices[7] = dr.y;
			
			_indices = new Vector.<int>(6, true);
			_indices[0] = 0;
			_indices[1] = 1;
			_indices[2] = 2;
			_indices[3] = 1;
			_indices[4] = 3;
			_indices[5] = 2;
			
			_uvData = new Vector.<Number>(8, true);
			_uvData[0] = 0;
			_uvData[1] = 0;
			_uvData[2] = 1;
			_uvData[3] = 0;
			_uvData[4] = 0;
			_uvData[5] = 1;
			_uvData[6] = 1;
			_uvData[7] = 1;
			
			_bitmapData = bitmapData;
			draw();
			
			_controller = new SSenDisplayObjectController(this);
		}
		public function topLeft(x : Number, y : Number) : void
		{
			_vertices[0] = x;
			_vertices[1] = y;
			draw();
		}
		public function topRight(x : Number, y : Number) : void
		{
			_vertices[2] = x;
			_vertices[3] = y;
			draw();
		}
		public function downLeft(x : Number, y : Number) : void
		{
			_vertices[4] = x;
			_vertices[5] = y;
			draw();
		}
		public function downRight(x : Number, y : Number) : void
		{
			_vertices[6] = x;
			_vertices[7] = y;
			draw();
		}
		public function get vertices() : Vector.<Number>
		{
			return _vertices;
		}
		public function set vertices(vector : Vector.<Number>) : void
		{
			_vertices = vector;
			draw();
		}
		private function draw() : void
		{
			var g : Graphics = graphics;
			g.clear();
			g.beginBitmapFill(_bitmapData, null, false, true);
			g.drawTriangles(_vertices, _indices, _uvData, TriangleCulling.NONE);
			g.endFill();
		}
		public function get bitmapData() : BitmapData
		{
			return _bitmapData;
		}
		public function set bitmapData(bitmapData : BitmapData) : void
		{
			_bitmapData = bitmapData;
			draw();
		}
		/* *********************************************************************
		 * implement ISSenDisplayObject
		 ********************************************************************* */
		/** @copy ssen.core.display.ISSenSprite#hover */		
		public function get hover() : Boolean
		{
			return _controller.hover;
		}
		public function set hover(hover : Boolean) : void
		{
			_controller.hover = hover;
		}
		/** @copy ssen.core.display.ISSenSprite#canvas */
		public function get canvas() : Sprite
		{
			return _controller.canvas;
		}
		/** @copy ssen.core.display.ISSenSprite#globalPosition */
		public function get globalPosition() : Point
		{
			return _controller.globalPosition;
		}
		public function set globalPosition(point : Point) : void
		{
			_controller.globalPosition = point;
		}
		/** @copy ssen.core.display.ISSenSprite#globalX */
		public function get globalX() : Number
		{
			return _controller.globalX;
		}
		public function set globalX(value : Number) : void
		{
			_controller.globalX = value;
		}
		/** @copy ssen.core.display.ISSenSprite#globalY */
		public function get globalY() : Number
		{
			return _controller.globalY;
		}
		public function set globalY(value : Number) : void
		{
			_controller.globalY = value;
		}
		/** @copy ssen.core.display.ISSenSprite#position */
		public function get position() : Point
		{
			return _controller.position;
		}
		public function set position(point : Point) : void
		{
			_controller.position = point;
		}
		/** @copy ssen.core.display.ISSenSprite#nextX() */
		public function nextX(spaceX : int = 0) : Number
		{
			return _controller.nextX(spaceX);
		}
		/** @copy ssen.core.display.ISSenSprite#nextY() */
		public function nextY(spaceY : int = 0) : Number
		{
			return _controller.nextY(spaceY);
		}
		/** @copy ssen.core.display.ISSenSprite#index */
		public function get index() : int
		{
			return _controller.index;
		}
		public function set index(index : int) : void
		{
			_controller.index = index;
		}
		/** @copy ssen.core.display.ISSenSprite#nextPosition() */
		public function nextPosition(spaceX : int = 5) : Point
		{
			return _controller.nextPosition(spaceX);
		}
		/** @copy ssen.core.display.ISSenSprite#nextPositionBr() */
		public function nextPositionBr(spaceY : int = 5) : Point
		{
			return _controller.nextPositionBr(spaceY);
		} 
	}
}
