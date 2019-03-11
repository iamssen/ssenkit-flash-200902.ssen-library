package test.array 
{
	import ssen.core.array.Values;	
	import ssen.core.display.SSenSprite;
	/**
	 * @author SSen
	 */
	public class ValuesTest extends SSenSprite 
	{
		public function ValuesTest()
		{
			var values : Values = new Values();
			values["c"] = 1;
			values["d"] = 2;
			values["a"] = 3;
			values["b"] = 4;
			
			trace(values);
			trace(values.names);
			trace(values.values);
			
			values.sortNames(true);
			trace(values);
			values.sortNames(false);
			trace(values);
			
			var f : int;
			for (f = 0;f < values.length; f++) {
				trace(values.getNameAt(f), values[f]);
			}
			delete values[2];
			for (f = 0;f < values.length; f++) {
				trace(values.getNameAt(f), values[f]);
			}
			var s : String;
			for (s in values) {
				trace(s, values[s]);
			}
			var r : *;
			for each (r in values) {
				trace(r);
			}
			
			var clone : Values = values.clone();
			trace(values, clone);
			var copy : Values = values.copy("a", "d");
			trace(values, copy);
			var splice : Values = values.splice("a");
			trace(values, splice);
		}
	}
}
