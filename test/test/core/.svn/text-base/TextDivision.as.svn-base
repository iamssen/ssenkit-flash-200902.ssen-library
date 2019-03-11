package test.core 
{
	import ssen.core.text.StringEx;	
	import ssen.core.display.SSenSprite;	
	/**
	 * @author SSen
	 */
	public class TextDivision extends SSenSprite
	{
		private var txtSor : Array = ["ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"];

		public function TextDivision()
		{
			trace(TextDevide("안녕하세요."));
			
			trace(StringEx.hangulWordSplit("가"));
			trace(StringEx.hangulWordSplit("각"));
			trace(StringEx.hangulWordSplit("나"));
			trace(StringEx.hangulWordSplit("난"));
			trace(StringEx.hangulWordSplit("의"));
			trace(Math.floor(3.6));
		}
		public function TextDevide(text : String) : Array
		{
			var textArray : Array = new Array();
			var splitArray : Array = new Array();
			splitArray = text.split("");
			var valueString : String;
			var valueNumber : Number = 0;
			for each (valueString in splitArray) {
				textArray[valueNumber] = TextValue(valueString);
				valueNumber++;
			}
			return textArray;
		}

		//문자의 원래 코드값(영문을 제외한 );
		private var textCode : Number;
		//문자의 자음값 대입
		private var textT1 : Number;
		//자신의 받침을 제외한 ㅏ 대열 
		private var textT2 : Number;
		//자신의 캐릭터값 
		private var textT3 : Number;
		//캐릭터값 계산숫자
		private static var topText : Number;

		private function TextValue(word : String) : Array
		{
			//반환할 배열
			var valueArray : Array = new Array();
			if (word.charCodeAt() >= 44032 && word.charCodeAt() <= 55203) {
				//한글 배열 넣기
				textCode = word.charCodeAt() - 44032;
				textT1 = Math.floor(textCode / 588);
				//자음값 구하기
				textT2 = textT1 * 588 + 44032;
				//자신의 받침을 제외한 ㅏ 대열 
				textT3 = Math.floor((word.charCodeAt() - textT2) / 28) * 28 + textT2;
				//자신의 한쪽 자음을 더한 대열 제일 앞의 값;
				topText = Math.floor((word.charCodeAt() - textT2) / 28) * 28;
				valueArray.push(txtSor[textT1]);
				//자음값 입력
				
				//글자가 "과" 에 관련된 글자일때  ㅗ 를 포함한 글자를 추가
				if (topText >= 252 && topText <= 308) {
					valueArray.push(String.fromCharCode(textT2 + 224));
				}
				//글자가 "궈" 에 관련된 글자일때 ㅜ 를 포함한 글자를 추가 
				else if (topText >= 392 && topText <= 448) {
					valueArray.push(String.fromCharCode(textT2 + 364));
				}
				//글자가 "긔" 에 관련된 글자일때 ㅡ 를 포함한 글자를 추가 
				else if (topText >= 532 && topText <= 559) {
					valueArray.push(String.fromCharCode(textT2 + 504));
				}
				//자음추가
				valueArray.push(String.fromCharCode(textT3));
				//받침 계산 추가
				if((word.charCodeAt() - textT3) % 28 != 0) {
					valueArray.push(word);
				}
			} else if(word.charCodeAt() == 32) {
				//영문과 특수자 연산
				valueArray.push(String.fromCharCode(32));
			}else if (word.charCodeAt() >= 33 && word.charCodeAt() <= 126 && word.charCodeAt() != 47) {
				//줄바꿈
				valueArray.push(String.fromCharCode(word.charCodeAt()));
			}else if(word.charCodeAt() == 47) {
				valueArray.push("\n");
			}else {
				valueArray.push(String.fromCharCode(word.charCodeAt()));
			}
			return valueArray;
		}
	}
}
