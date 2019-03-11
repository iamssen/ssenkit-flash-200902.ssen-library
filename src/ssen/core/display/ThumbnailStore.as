package ssen.core.display 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;		
	/**
	 * @author SSen
	 */
	public class ThumbnailStore 
	{
		private var _dic : Dictionary;

		public function ThumbnailStore()
		{
			_dic = new Dictionary(true);
		}
		/** bitmapData 혹은 {skinMode:bitmapData} 형식으로 thumbnail을 추가 */
		public function addThumbnail(name : String, object : Object) : void
		{
			_dic[name] = object;
		}
		/** thumbnail을 지운다 */
		public function removeThumbnail(name : String) : void
		{
			delete _dic[name];
		}
		/** thumbnail이 존재하는지 확인한다 */
		public function hasThumbnail(name : String) : Boolean
		{
			return _dic[name] != undefined;
		}
		/** thumbnail을 가져온다 */
		public function getThumbnail(name : String, pixelSnapping : String = "auto", smoothing : Boolean = false) : DisplayObject
		{
			if (_dic[name] is BitmapData) {
				return new SSenBitmap(_dic[name], pixelSnapping, smoothing);
			} else {
				var skins : Dictionary = new Dictionary(true);
				for (var s : String in _dic[name]) {
					skins[s] = new Bitmap(_dic[name][s], pixelSnapping, smoothing);
				}
				return new SkinSprite(skins);
			}
		}
	}
}
