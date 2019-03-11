package ssen.flash.buttons 
{
	import ssen.component.buttons.ButtonType;
	import ssen.component.buttons.IButton;
	import ssen.component.interaction.ButtonInteraction;
	import ssen.core.display.SSenMovieClip;
	import ssen.core.display.SkinMode;
	import ssen.core.events.SSenEvent;

	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;	

	/** @copy ssen.core.events.OnOffEvent#ONOFF */
	[Event(name="onoff", type="ssen.core.events.OnOffEvent")]

	/** 마우스 클릭 - 당연히 interactive object 의 모든 event 가 된다 */
	[Event(name="click", type="flash.events.MouseEvent")]
	/**
	 * MovieClip frame 상에서 Skin 작업을 할 수 있는 버튼
	 * @author SSen
	 */
	public class McButton extends SSenMovieClip implements IButton 
	{
		private var _interaction : ButtonInteraction;
		private var _hitArea : Sprite;

		public function McButton()
		{
			stop();
			
			// frame6 를 hitArea 로 설정
			gotoAndStop(6);
			_hitArea = new Sprite();
			_hitArea.addChild(getChildAt(0));
			_hitArea.mouseEnabled = false;
			_hitArea.visible = false;
			addChild(_hitArea);
			hitArea = _hitArea;
			buttonMode = true;
			gotoAndStop(1);
			
			_interaction = new ButtonInteraction(this, ButtonType.NORMAL);
			_interaction.addEventListener(SSenEvent.SKINNING, skinning, false, 0, true);
			_interaction.start();
		}
		/* *********************************************************************
		 * implement IButton
		 ********************************************************************* */
		public function resourceKill() : void
		{
			_interaction.resourceKill();
			_interaction.removeEventListener(SSenEvent.SKINNING, skinning);
			_hitArea = null;
		}
		public function get toggleOn() : Boolean
		{
			return _interaction.toggleOn;
		}
		public function set toggleOn(toggleOn : Boolean) : void
		{
			_interaction.toggleOn = toggleOn;
		}
		public function get buttonType() : String
		{
			return _interaction.buttonType;
		}
		public function set buttonType(buttonType : String) : void
		{
			_interaction.buttonType = buttonType;
		}
		public function get isMousePress() : Boolean
		{
			return _interaction.isMousePress;
		}
		public function get enable() : Boolean
		{
			return _interaction.enabled;
		}
		public function set enable(enable : Boolean) : void
		{
			if (enable) {
				_interaction.start();
			} else {
				_interaction.stop();
			}
		}
		/* *********************************************************************
		 * skinning
		 ********************************************************************* */
		private function skinning(event : SSenEvent) : void
		{
			var frame : int;
			switch (_interaction.skinMode) {
				case SkinMode.DEFAULT :
					frame = 1;
					break;
				case SkinMode.SELECTED :
					frame = 5;
					break;
				case SkinMode.OVER :
					frame = 2;
					break;
				case SkinMode.ACTION :
					frame = 3;
					break;
				case SkinMode.DISABLE :
					frame = 4;
					break;
				default : 
					frame = 1;
			}
			gotoAndStop(frame);
		}
	}
}
