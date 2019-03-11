package test.core 
{
	import ssen.core.display.SSenSprite;
	
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;	
	/**
	 * @author SSen
	 */
	public class EmbedTest extends SSenSprite 
	{
		[Embed(source="test.png", scaleGridTop="20", scaleGridBottom="80", scaleGridLeft="20", scaleGridRight="80")]
		public var imgCls : Class;
		
		public function EmbedTest()
		{
			trace(imgCls, getQualifiedClassName(imgCls), getQualifiedSuperclassName(imgCls));
			trace(new imgCls(), getQualifiedClassName(new imgCls()), getQualifiedSuperclassName(new imgCls()));
		}
	}
}
