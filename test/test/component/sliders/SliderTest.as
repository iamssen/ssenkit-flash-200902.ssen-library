package test.component.sliders 
{
	import ssen.component.sliders.SliderBase;
	import ssen.core.display.SSenSprite;
	import ssen.debug.TestButtonGroup;
	
	/**
	 * @author SSen
	 */
	public class SliderTest extends SSenSprite 
	{
		private var _slider : SliderBase;
		
		public function SliderTest()
		{
			_slider = new TestSlider(100);
			_slider.x = 10;
			_slider.y = 10;
			
			var test : TestButtonGroup = new TestButtonGroup("sec change", secChange, "value change", valueChange);
			test.position = _slider.nextPositionBr(10);
			
			addChildren(_slider, test);
		}

		private function secChange() : void
		{
			_slider.sec = 0.3;
		}
		private function valueChange() : void
		{
			_slider.value = 100;
		}
	}
}
