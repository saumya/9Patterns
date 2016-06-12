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
	public function nextPattern():Void{
		counter = 0;
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
		//pattern_8();
		//
		if(patternIndex > 9){
			patternIndex = patternIndex - 9;
		}
		var n:Int = this.container.numChildren;
		if(n>=1000){
			this.container.removeChildren();
		}
		//switch
		switch (patternIndex) {
			case 1:
				pattern_1();
			case 2:
				pattern_2();
			case 3:
				pattern_3();
			case 4:
				pattern_4();
			case 5:
				pattern_5();
			case 6:
				pattern_6();
			case 7:
				pattern_7();
			case 8:
				pattern_8();
			case 9:
				pattern_9();
			default:
				trace('case : default : TODO:Fix it for a better experience.');
				//this.patternIndex = 1;
				//pattern_one();
			}// End Switch
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
	private function pattern_4():Void{
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.rotation = (22.5)*(counter);
		container.addChild(c);
	}
	private function pattern_5():Void{
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.rotation = (2)*(counter);
		container.addChild(c);
	}
	private function pattern_6():Void{
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.rotation = (2)*(counter);
		c.scaleX = c.scaleY = Math.sin(counter);
		container.addChild(c);
	}
	private function pattern_7():Void{
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*(counter/5);
		c.y = (bgSize.y/2)+ Math.cos(counter)*(counter/5);
		c.rotation = (1)*(counter);

		//c.scaleX = c.scaleY = Math.sin(counter);

		// counter from 0 to 1000
		// options from 0 to 1
		// fix this
		/*
		var a:Float = 0(0) / 1(1000);
		var min = 0; var max = 1000;
		var min1 = 0; var max1 = 1;
		*/
		var b = (1 - (1/1000)*(counter));
		c.scaleX = c.scaleY = b;

		container.addChild(c);
	}
	private function pattern_8():Void{
		// TODO:
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*(counter/5);
		c.y = (bgSize.y/2)+ Math.cos(counter)*(counter/5);
		c.rotation = (9)*(counter);
		var b = (1 - (1/1000)*(counter));
		c.scaleX = c.scaleY = b;

		container.addChild(c);
	}
	private function pattern_9():Void{
		// TODO: 
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*(counter/5);
		c.y = (bgSize.y/2)+ Math.cos(counter)*(counter/5);
		c.rotation = (9)*(counter);
		var b = (1 - (1/1000)*(counter));
		c.scaleX = c.scaleY = b;

		container.addChild(c);
	}
}