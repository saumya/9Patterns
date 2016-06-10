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
	var bgSize:Point;
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
	public function setContainer(containerRef:Sprite,size:Point):Void{
		this.container = containerRef;
		//this.container.addChild(circle);
		this.bgSize = size;
	}
	public function render(patternIndex:UInt):Void{
		trace("render: ");
		/*
		trace(this.container.numChildren);
		//var c:Bitmap = shapeUtil.getBitmapSquare();
		//var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.CIRCLE,true);
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);

		//var n:UInt = container.numChildren;
		//var l:Float = c.width * (n);

		c.x = Math.random()*(bgSize.x);
		c.y = Math.random()*(bgSize.y);
		
		//c.x = bgSize.x/2;
		//c.y = bgSize.y/2;
		
		c.rotation = Math.random() * (90);
		//c.scaleX = c.scaleY = Math.random()*10;

		container.addChild(c);
		//counter ++;
		//circle.x = 200+Math.sin(counter);
		//circle.y = 200+Math.cos(counter);
		

		//container.addChild(circle);
		//container.addChild(square);
		*/
		pattern_2();
	}
	private function pattern_1():Void{
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		c.x = Math.random()*(bgSize.x);
		c.y = Math.random()*(bgSize.y);
		c.rotation = Math.random() * (90);
		container.addChild(c);
	}
	private function pattern_2():Void{
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		//c.rotation = Math.random() * (90);
		container.addChild(c);
	}
	private function pattern_3():Void{
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.rotation = counter;
		container.addChild(c);
	}
}