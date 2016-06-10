//
package utils;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.geom.Point;

import utils.ShapeUtil;
import utils.display.BitmapSprite;

class BitmapPatterns {

	var shapeUtil:ShapeUtil;
	var container:Sprite;
	//var circle:Bitmap;
	//var square:Bitmap;
	var counter:UInt;

	public function new(shapeUtilRef:ShapeUtil) {
		shapeUtil = shapeUtilRef;
		counter = 0;
		construct();
	}
	private function construct():Void{
		trace("TODO: construct");
		//circle = shapeUtil.getBitmapCircle();
		//square = shapeUtil.getBitmapSquare();
	}
	public function setContainer(containerRef:Sprite):Void{
		this.container = containerRef;
		//this.container.addChild(circle);
	}
	public function render(patternIndex:UInt):Void{
		trace("render");
		trace(this.container.numChildren);
		//var c:Bitmap = shapeUtil.getBitmapSquare();
		var c:BitmapSprite = shapeUtil.getBitmapSprite("square",true);

		var n:UInt = container.numChildren;
		var l:Float = c.width * (n);

		c.x = c.width *(container.numChildren);
		c.rotation = n;

		container.addChild(c);
		//counter ++;
		//circle.x = 200+Math.sin(counter);
		//circle.y = 200+Math.cos(counter);
		

		//container.addChild(circle);
		//container.addChild(square);
	}
}