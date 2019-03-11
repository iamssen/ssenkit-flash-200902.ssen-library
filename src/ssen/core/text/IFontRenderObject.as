package ssen.core.text 
{
	/**
	 * @author SSen
	 */
	public interface IFontRenderObject 
	{
		function setFontRenderingStyle(embedFonts : Boolean = false, sharpness : Number = 0, thickness : Number = 0) : void;
		function setFontRender(fontRender : FontRender = null) : void;
	}
}
