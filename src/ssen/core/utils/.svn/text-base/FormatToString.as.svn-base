package ssen.core.utils 
{
	import flash.utils.getQualifiedClassName;			
	/**
	 * @author SSen
	 */
	public class FormatToString 
	{
		public static function toString(object : Object, ...properties) : String
		{
			var c : String = "[" + getQualifiedClassName(object).split("::")[1];
			var f : int;
			for (f = 0;f < properties.length; f++) {
				c += ' ' + properties[f] + '="' + object[properties[f]] + '"';
			}
			return c + "]";
		}
		public static function ssenErrorTrace(...messages) : void
		{
			messages.unshift("SSEN//");
			trace.apply(null, messages);
		}
	}
}
