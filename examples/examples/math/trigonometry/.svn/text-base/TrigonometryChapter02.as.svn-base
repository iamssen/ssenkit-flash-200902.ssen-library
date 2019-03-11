package examples.math.trigonometry 
{
	import examples.Example;	
	/**
	 * @author SSen
	 */
	public class TrigonometryChapter02 extends Example 
	{
		public function TrigonometryChapter02()
		{
			trace(1, 45, 16, getAB(16, 45), Math.sqrt(Math.pow(16, 2) + Math.pow(getAB(16, 45), 2)), "답안 증명 :", 16 * Math.sqrt(2));
			// 빗변과 각도를 통해서 밑변과 높이를 알 수 있는 방법이 없을까?
		}
		/* *********************************************************************
		 * 직각삼각형에서 밑변 혹은 높이와 밑변의 각도를 통해 반대의 높이, 밑변을 구하는 공식
		 * http://blog.naver.com/destiny_epik?Redirect=Log&logNo=150039499535
		 * 높이 = 밑변 * (밑변 각도 / 45)
		 * 밑변 = 높이 * (밑변 각도 / 45)
		 ********************************************************************* */
		private function getAB(ab : Number, degree : Number) : Number
		{
			return ab * (degree / 45);
		}
	}
}
