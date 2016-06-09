//
package utils;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.geom.Point;

import utils.ShapeUtil;

class BitmapPatterns {

	var shapeUtil:ShapeUtil;
	var circle:Bitmap;
	var square:Bitmap;

	public function new(shapeUtilRef:ShapeUtil) {
		shapeUtil = shapeUtilRef;
		construct();
	}
	private function construct():Void{
		trace("TODO: construct");
		circle = shapeUtil.getBitmapCircle();
		square = shapeUtil.getBitmapSquare();
	}
	public function render(container:Sprite):Void{
		trace("render");
		container.addChild(circle);
		//container.addChild(square);
	}
}