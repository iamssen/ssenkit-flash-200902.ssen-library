package test.array 
{
	import ssen.core.array.Values;
	import ssen.core.display.SSenSprite;

	import flash.utils.Dictionary;
	import flash.utils.getTimer;	
	/**
	 * @author SSen
	 */
	public class CollectionTest extends SSenSprite 
	{
		public function CollectionTest()
		{
			var array : Array = new Array();
			var values : Values = new Values();
			var dic : Dictionary = new Dictionary(true);
			var xml : XML = <xml />;
			var loop : int = 1000;
			
			var t : Vector.<Number> = new Vector.<Number>();
			t.push(getTimer());
			
			var f : int;
			for (f = 0;f < loop; f++) {
				array["name" + f] = "new text";
			}
			t.push(getTimer());
			
			for (f = 0;f < loop; f++) {
				values["name" + f] = "new text" + f;
			}
			t.push(getTimer());
			
			for (f = 0;f < loop; f++) {
				dic["name" + f] = "new text";
			}
			t.push(getTimer());
			
			for (f = 0;f < loop; f++) {
				xml["item"] += <item name="name" text="new text"/>;
			}
			t.push(getTimer());
			
			var x : *;
			f = 0;
			for each (x in array) {
				f++;
			}
			trace(f);
			t.push(getTimer());
			
			f = 0;
			for each (x in values) {
				f++;
			}
			trace(f);
			t.push(getTimer());
			
			f = 0;
			for each (x in dic) {
				f++;
			}
			trace(f);
			t.push(getTimer());
			
			f = 0;
			for each(x in xml["item"]) {
				f++;
			}
			trace(f);
			t.push(getTimer());
			
			for (f = 0;f < loop; f++) {
				delete array["name" + f];
			}
			t.push(getTimer());
			
			for (f = 0;f < loop; f++) {
				delete values["name" + f];
			}
			t.push(getTimer());
			
			for (f = 0;f < loop; f++) {
				delete dic["name" + f];
			}
			t.push(getTimer());
			
			for (f = 0;f < loop; f++) {
				delete xml["item"][f];
			}
			t.push(getTimer());
			
			trace("생성 :", t[1] - t[0], t[2] - t[1], t[3] - t[2], t[4] - t[3]);
			trace("조회 :", t[5] - t[4], t[6] - t[5], t[7] - t[6], t[8] - t[7]);
			trace("삭제 :", t[9] - t[8], t[10] - t[9], t[11] - t[10], t[12] - t[11]);
		}
	}
}
