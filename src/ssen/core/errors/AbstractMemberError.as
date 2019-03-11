package ssen.core.errors
{
	/**
	 * @author SSen
	 */
	public class AbstractMemberError extends Error 
	{
		public function AbstractMemberError()
		{
			super("abstract member 입니다.", 0);
		}
	}
}
