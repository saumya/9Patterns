//
package utils.display;

import openfl.display.Sprite;
import openfl.display.Bitmap;

class BitmapSprite extends Sprite {
	var map:Bitmap;
	var isAtCenter:Bool;
	public function new(bitmap:Bitmap,?isCenterPositioned:Bool=false) {
		super();
		map = bitmap;
		isAtCenter = isCenterPositioned;
		//
		map.smoothing = true;
		//
		construct();
	}
	private function construct():Void{
		if (isAtCenter) {
			map.x = (-1)*(map.width/2);
			map.y = (-1)*(map.height/2);
		}
		this.addChild(map);
	}
}