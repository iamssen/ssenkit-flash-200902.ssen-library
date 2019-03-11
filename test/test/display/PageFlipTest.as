package test.display 
{
	import ssen.core.display.DisplayObjectEx;
	import ssen.core.display.SSenSprite;
	import ssen.core.number.MathEx;

	import test.display.Vector2;

	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;	
	/**
	 * @author SSen
	 */
	public class PageFlipTest extends SSenSprite 
	{
		private var _d1 : Sprite;
		private var _d2 : Sprite;
		private var _d3 : Sprite;
		private var _d4 : Sprite;
		private var _evt1 : Sprite;
		private var _evt2 : Sprite;
		private var _canvas : Shape;
		/* *********************************************************************
		 * copy from FlexBook
		 ********************************************************************* */
		private static const TURN_DIRECTION_FORWARD : Number = 0;
		private static const TURN_DIRECTION_BACKWARDS : Number = 1;
		// 페이지 넘기는 방향
		private var _turnDirection : Number;
		// 마우스를 누른 지점
		private var grabPt : Point;
		// 마우스가 움직이고 있는 지점
		private var dragPt : Point;
		// 두 페이지의 중앙
		private var _hCenter : Number;
		// 페이지의 왼쪽 끝
		private var _pageLeft : Number;
		// 페이지의 오른쪽 끝
		private var _pageRight : Number;
		// 페이지의 맨 위
		private var _pageTop : Number;
		// 페이지의 높이
		private var _pageHeight : Number;
		// 페이지의 넓이
		private var _pageWidth : Number;

		/* *********************************************************************
		 * cache
		 ********************************************************************* */
		public function PageFlipTest()
		{
			x = 50;
			y = 50;
			
			var w : int = 150;
			var h : int = 180;
			
			_d1 = DisplayObjectEx.createColorSpriteBox(MathEx.rand(0xffffff, 0x000000), w, h);
			_d2 = DisplayObjectEx.createColorSpriteBox(MathEx.rand(0xffffff, 0x000000), w, h);
			_d3 = DisplayObjectEx.createColorSpriteBox(MathEx.rand(0xffffff, 0x000000), w, h);
			_d4 = DisplayObjectEx.createColorSpriteBox(MathEx.rand(0xffffff, 0x000000), w, h);
			
			_d1.x = 0;
			_d1.y = 0;
			_d2.x = _d1.x + _d1.width;
			_d2.y = _d1.y;
			
			_evt1 = DisplayObjectEx.createTransparentSpriteBox(100, 350);
			_evt2 = DisplayObjectEx.createTransparentSpriteBox(100, 350);
			_evt1.x = _d1.x;
			_evt1.y = _d1.y;
			_evt2.x = _d2.x + _d2.width - _evt2.width;
			_evt2.y = _d1.y + _d1.height - _evt2.height;
			
			_canvas = new Shape();
			
			addChildren(_d1, _d2, _evt1, _evt2, _canvas);
			
			_evt1.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			_evt2.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			
			_hCenter = _d1.width;
			_pageLeft = _d1.x;
			_pageRight = _d2.x + _d2.width;
			_pageTop = _d1.y;
			_pageHeight = _d1.height;
			_pageWidth = _d1.width;
			grabPt = new Point();
			dragPt = new Point();
		}
		private function mouseDown(event : MouseEvent) : void
		{
			// 앞 페이지 일때 이전 페이지 이동가능, 뒷 페이지 일때 다음 페이지 이동가능 체크
			grabPt.x = mouseX;
			grabPt.y = mouseY;
			dragPt.x = mouseX;
			dragPt.y = mouseY;
			
			draw();
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		private function mouseUp(event : MouseEvent) : void
		{
			var g : Graphics = _canvas.graphics;
			g.clear();
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		private function mouseMove(event : MouseEvent) : void
		{
			dragPt.x = mouseX;
			dragPt.y = mouseY;
			
			draw();
			
			event.updateAfterEvent();
		}
		private function draw() : void
		{
			if (grabPt.x < _hCenter) {
				grabPt.x = _pageLeft;
				_turnDirection = TURN_DIRECTION_BACKWARDS;
			} else {
				grabPt.x = _pageRight;
				_turnDirection = TURN_DIRECTION_FORWARD;
			}
			
			if (dragPt.x < _pageLeft) {
				dragPt.x = _pageLeft;
			} else if (dragPt.x > _pageRight) {
				dragPt.x = _pageRight;
			}
			
			var maxDistanceFromAnchor : Number;
			var hPageEdge : Number;
			var hOppositePageEdge : Number;
			
			if (grabPt.x > _hCenter) {
				hPageEdge = _pageRight;
				hOppositePageEdge = _pageLeft;
			} else {
				hPageEdge = _pageLeft;
				hOppositePageEdge = _pageRight;
			}
			
			var topAnchor : Point = new Point(_hCenter, _pageTop);
			var bottomAnchor : Point = new Point(_hCenter, _pageHeight);
			var topCorner : Point = new Point(hPageEdge, _pageTop);
			var topOppositeCorner : Point = new Point(hOppositePageEdge, _pageTop);
			var bottomCorner : Point = new Point(hPageEdge, _pageHeight);
			var bottomOppositeCorner : Point = new Point(hOppositePageEdge, _pageHeight);
			
			var anchorToDragPt : Vector2;
			var dragDistanceFromAnchor : Number;
			
			if(dragPt.y <= grabPt.y) {
				maxDistanceFromAnchor = new Vector2(bottomAnchor, grabPt).length;
				anchorToDragPt = new Vector2(bottomAnchor, dragPt);
				dragDistanceFromAnchor = anchorToDragPt.length;
				if (dragDistanceFromAnchor > maxDistanceFromAnchor) {
					anchorToDragPt.length = maxDistanceFromAnchor;
					dragPt = anchorToDragPt.p1.clone();
				}
			}
			else {
				maxDistanceFromAnchor = new Vector2(topAnchor, grabPt).length;
				anchorToDragPt = new Vector2(topAnchor, dragPt);
				dragDistanceFromAnchor = anchorToDragPt.length;
				if (dragDistanceFromAnchor > maxDistanceFromAnchor) {
					anchorToDragPt.length = maxDistanceFromAnchor;
					dragPt = anchorToDragPt.p1.clone();
				}
			}
			var dragToStart : Vector2 = new Vector2(dragPt, grabPt);
			
			var fold : Vector2 = dragToStart.clone();
			fold.length /= 2;
			var dragToStartCenter : Point = fold.p1.clone();
			fold.perp();
			fold.moveTo(dragToStartCenter);
			fold.normalize();
						
			var foldTopRight : Point;
			var foldTopLeft : Point;
			var foldBottomRight : Point;
			var foldBottomLeft : Point;
			var virtualPageTopLeft : Point;
			
			var foldIntersectionWithTop : Number = fold.xForY(_pageTop);
			
			if(Math.abs(foldIntersectionWithTop - _hCenter) < Math.abs(hPageEdge - _hCenter)) {
				var topEdge : Vector2 = new Vector2(new Point(foldIntersectionWithTop, _pageTop), topCorner);
				topEdge.reflect(fold);
				foldTopLeft = virtualPageTopLeft = topEdge.p1;
				foldTopRight = topEdge.p0;
			}
			else {
				foldTopLeft = foldTopRight = new Point(hPageEdge, fold.yForX(hPageEdge));
				var foldExtension : Vector2 = new Vector2(foldTopLeft, topCorner);
				foldExtension.reflect(fold);
				virtualPageTopLeft = foldExtension.p1;
			}

			var foldIntersectionWithBottom : Number = fold.xForY(_pageHeight);
			if (Math.abs(foldIntersectionWithBottom - _hCenter) < Math.abs(hPageEdge - _hCenter)) {
				var bottomEdge : Vector2 = new Vector2(new Point(foldIntersectionWithBottom, _pageHeight), bottomCorner);
				bottomEdge.reflect(fold);
				foldBottomLeft = bottomEdge.p1;
				foldBottomRight = bottomEdge.p0;
			}
			else {
				foldBottomLeft = foldBottomRight = new Point(hPageEdge, fold.yForX(hPageEdge));
			}

			var topDoublePagePoly : Array = [];
			var topTurningPagePoly : Array = [];

			if(dragToStart.length2 > .1) {
			
				if(foldTopRight.y > _pageTop)
					topDoublePagePoly.push(topCorner);
				topDoublePagePoly.push(foldTopRight);
				topDoublePagePoly.push(foldBottomRight);
				if(foldBottomRight.y < _pageHeight)
					topDoublePagePoly.push(bottomCorner);
			}
			else {
				topDoublePagePoly.push(topCorner);
				topDoublePagePoly.push(bottomCorner);
			}
			
			topTurningPagePoly = topDoublePagePoly.concat();

			topTurningPagePoly.unshift(topAnchor);
			topTurningPagePoly.push(bottomAnchor);

			topDoublePagePoly.unshift(topOppositeCorner);
			topDoublePagePoly.push(bottomOppositeCorner);
			
			
			
			var revealedPagePoly : Array = [];
			revealedPagePoly.push(foldTopRight);
			if(foldTopRight.y == _pageTop)
				revealedPagePoly.push(topCorner);
			if(foldBottomRight.y == _pageHeight)
				revealedPagePoly.push(bottomCorner);
			revealedPagePoly.push(foldBottomRight);
			
			var leadingEdge : Vector2;
			var shortPageEdge : Vector2;
			
			if(_turnDirection == TURN_DIRECTION_FORWARD) {
				leadingEdge = new Vector2(foldBottomLeft, foldTopLeft);
			}
			else if(_turnDirection == TURN_DIRECTION_BACKWARDS) {
				var tmpP : Point = foldTopLeft;
				foldTopLeft = foldTopRight;
				foldTopRight = tmpP;
				
				tmpP = foldBottomLeft;
				foldBottomLeft = foldBottomRight;
				foldBottomRight = tmpP;
				
				leadingEdge = new Vector2(foldBottomRight, foldTopRight);
				shortPageEdge = leadingEdge.clone();
				shortPageEdge.perp();
				shortPageEdge.length = _pageWidth;
				shortPageEdge.moveTo(virtualPageTopLeft);
				virtualPageTopLeft = shortPageEdge.p1;
			}

			var foldPoly : Array = [];
			foldPoly.push(foldTopLeft);
			foldPoly.push(foldTopRight);
			foldPoly.push(foldBottomRight);
			foldPoly.push(foldBottomLeft);
			
			var turnPercent : Number;
			
			if(_turnDirection == TURN_DIRECTION_FORWARD) {
				turnPercent = 1 - (dragPt.x - _pageLeft) / (2 * _pageWidth);
			} else {
				turnPercent = (dragPt.x - _pageLeft) / (2 * _pageWidth);
			}
			
			var m : Matrix = new Matrix();
			var g : Graphics = _canvas.graphics;
			g.clear();
			
			if(true) {
				// draw the top of the turning page
				m.identity();
				if(_turnDirection == TURN_DIRECTION_FORWARD) {
					m.tx = _hCenter;
					m.ty = _pageTop;
					//g.beginBitmapFill(_frontTurningBitmap,m,false,true);
					g.beginFill(0xcccccc);
				}
				else {
					m.tx = hPageEdge;
					m.ty = _pageTop;
					//g.beginBitmapFill(_frontTurningBitmap,m,false,true);
					g.beginFill(0xcccccc);
				}
				

				drawPoly(g, topTurningPagePoly);
				g.endFill();
			}


			// draw the curvature gradient on the page being revealed by the turn
			if(_turnDirection == TURN_DIRECTION_FORWARD) {
				m.createGradientBox(_pageWidth, _pageHeight, 0, _hCenter, _pageTop);		
				beginRightSideGradient(g, m);
			}
			else {
				m.createGradientBox(_pageWidth, _pageHeight, Math.PI, _pageLeft, _pageTop);		
				beginLeftSideGradient(g, m);
			}
			drawPoly(g, topTurningPagePoly);
			g.endFill();

			var centerToDrag : Vector2;
			var len : Number;
			
			if(dragToStart.length2 > .1) {
				// draw the shadow cast on the top pages by the turned page
				centerToDrag = new Vector2(dragToStartCenter, dragPt);
				m.identity();
				len = centerToDrag.length * 1.2;
				if(len > 10) {
					m.scale(len / 1638.4, 50 / 1638.4);
					m.rotate(fold.angle + Math.PI);
					m.translate(dragToStartCenter.x + centerToDrag.x / 2, dragToStartCenter.y + centerToDrag.y / 2);
					if(_turnDirection == TURN_DIRECTION_FORWARD)
						beginTopPageGradient(g, m);
					else
						beginTopPageGradient(g, m);					
					/* technically, this code should be enabled. With this code enabled, the shadow cast by the 
					turn onto the top page will cross both sides of the book. Otherwise, it will only be cast on the side
					the turn initiated from.  But it needs some work for shadows to really look good with transparency enabled.
					So enable if you like */
					//					if((_turnDirection == TURN_DIRECTION_FORWARD && hasLeftContent) || 
					//					   (_turnDirection == TURN_DIRECTION_BACKWARDS && hasRightContent))
					//					{
					//						drawPoly(g,topDoublePagePoly);
					//					}
					//					else
					{
					drawPoly(g, topTurningPagePoly);
					}
					g.endFill();
				}

				// draw the shadow being cast onto the revealed page
				var centerToGrab : Vector2 = new Vector2(dragToStartCenter, grabPt);
				m.identity();
				var boxLen : Number = centerToGrab.length;
				
				if(boxLen > 1 && ((_turnDirection == TURN_DIRECTION_FORWARD) || (_turnDirection == TURN_DIRECTION_BACKWARDS))) {
					//if(boxLen > 1 && ((_turnDirection == TURN_DIRECTION_FORWARD && _backTurningPage.hasRightContent) || (_turnDirection == TURN_DIRECTION_BACKWARDS && _backTurningPage.hasLeftContent))) {
					m.scale(boxLen / 1638.4, 50 / 1638.4);
					if(_turnDirection == TURN_DIRECTION_FORWARD) {
						m.rotate(fold.angle);
						m.translate(dragToStartCenter.x + centerToGrab.x / 2, dragToStartCenter.y + centerToGrab.y / 2);
						beginShadowOnRevealedPage(g, m, turnPercent);
					}
					else {
						m.rotate(fold.angle);
						m.translate(dragToStartCenter.x + centerToGrab.x / 2, dragToStartCenter.y + centerToGrab.y / 2);
						beginShadowOnRevealedPage(g, m, turnPercent);
					}
					drawPoly(g, revealedPagePoly);
					g.endFill();
				}
				
				if(true) {
					//_backTurningBitmap != null) {
					// draw the underside of the turned page
					m.identity();
					m.rotate(Math.atan2(leadingEdge.x, -leadingEdge.y));
					m.tx = virtualPageTopLeft.x;
					m.ty = virtualPageTopLeft.y;
					
					//g.beginBitmapFill(_backTurningBitmap, m, true, true);
					g.beginFill(0xeeeeee);
					
					g.lineStyle(0, 0, 0);
					drawPoly(g, foldPoly);
					g.endFill();
	
					// draw the curvature gradient on the underside of the turned page
					centerToDrag = new Vector2(dragToStartCenter, dragPt);
					len = centerToDrag.length;
					if(len > 10) {
						m.identity();
						m.scale(len / 1638.4, 50 / 1638.4);
						m.rotate(fold.angle + Math.PI);
						m.translate(dragToStartCenter.x + centerToDrag.x / 2, dragToStartCenter.y + centerToDrag.y / 2);
						if(_turnDirection == TURN_DIRECTION_FORWARD)
							beginForwardUndersideCurveGradient(g, m, turnPercent);
						else
							beginBackwardsUndersideCurveGradient(g, m, turnPercent);
						drawPoly(g, foldPoly);
						g.endFill();
					}
				}
			}
		}
		private function drawPoly(g : Graphics,poly : Array) : void
		{
			g.moveTo(poly[0].x, poly[0].y);
			for(var i : int = 0;i < poly.length;i++) {
				g.lineTo(poly[i].x, poly[i].y);
			}
			g.lineTo(poly[0].x, poly[0].y);
		}
		private function beginLeftSideGradient(g : Graphics,m : Matrix,isStiff : Boolean = false) : void
		{
			g.beginGradientFill(GradientType.LINEAR, [0xFFFFFF,0], [(isStiff ? 0.08 : 0.19) * pageSlopeD,0], [0,65.80], m, SpreadMethod.PAD);
		}
		private function beginRightSideGradient(g : Graphics,m : Matrix,isStiff : Boolean = false) : void
		{
			g.beginGradientFill(GradientType.LINEAR, [0,0xFFFFFF], [((isStiff) ? 0.08 : 0.27) * pageSlopeD,0], [0,86], m);
		}
		private function beginTopPageGradient(g : Graphics,m : Matrix) : void
		{
			g.beginGradientFill(GradientType.LINEAR, [0,0], [.9 * shadowStrengthD,0.00], [0,131.61], m, SpreadMethod.PAD);
		}
		private function beginForwardUndersideCurveGradient(g : Graphics,m : Matrix,p : Number) : void
		{
			var base : Number = curveShadowD;
			var v : Number = base + (pageSlopeD - base) * p;
			g.beginGradientFill(GradientType.LINEAR, [0xFFFFFF,0], [0.19 * v,0], [0,65.80], m, SpreadMethod.PAD);
		}
		private function beginBackwardsUndersideCurveGradient(g : Graphics,m : Matrix,p : Number) : void
		{
			var base : Number = curveShadowD;
			var v : Number = base + (pageSlopeD - base) * p;
			g.beginGradientFill(GradientType.LINEAR, [0,0xFFFFFF], [0.27 * v,0], [0,86], m);
		}
		private function beginShadowOnRevealedPage(g : Graphics,m : Matrix,p : Number) : void
		{
			g.beginGradientFill(GradientType.LINEAR, [0,0], [1.8 * (1 - p) * shadowStrengthD,0], [0,200], m);
		}
		private function get pageSlopeD() : Number
		{
			var result : Number = 0.5;
			return (isNaN(result)) ? 1 : result;
		}
		private function get curveShadowD() : Number
		{
			var result : Number = 0.5;
			return ((isNaN(result)) ? 1 : result) * 5;
		}
		private function get shadowStrengthD() : Number
		{
			var result : Number = 0.7;
			return (isNaN(result)) ? 1.4 : result;
		}
	}
}
