//
package utils;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.geom.Point;

import utils.ShapeUtil;
import utils.display.BitmapSprite;

import motion.Actuate;
import motion.easing.Quad;
import motion.easing.Bounce;

class BitmapPatterns {

	var shapeUtil:ShapeUtil;
	var container:Sprite;
	var bgSize:Point;
	var counter:UInt;

	public function new(shapeUtilRef:ShapeUtil) {
		shapeUtil = shapeUtilRef;
		counter = 0;
		construct();
	}
	private function construct():Void{
		trace("TODO: construct");
	}
	public function setContainer(containerRef:Sprite,size:Point):Void{
		this.container = containerRef;
		this.bgSize = size;
	}
	public function nextPattern():Void{
		resetCounter();
	}
	public function restart():Void{
		resetCounter();
	}
	private function resetCounter():Void{
		counter = 0;
	}
	public function render(patternIndex:UInt):Void{
		//
		if(patternIndex > 9){
			patternIndex = patternIndex - 9;
		}
		var n:Int = this.container.numChildren;
		if(n>=1000){
			this.container.removeChildren();
			resetCounter();
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
				pattern_1();
			}// End Switch
	}

	private function renderParticle(?d:UInt=2,?isRandomPos:Bool=false,?shouldScaleDown:Bool=false,?shouldTween:Bool=false,?shouldBounce:Bool=false):Void{
		var n = container.numChildren;

		var cx = (bgSize.x/2) ;
		var cy = (bgSize.y/2) ;
		//
		var p:Float = 1;
		if(isRandomPos){
			p = Math.random()*n;
		}
		//
		var s:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		container.addChild(s);
		//
		var sx:Float = cx + (n/d) * Math.sin(n*p);
		var sy:Float = cy + (n/d) * Math.cos(n*p);
		var scaleXY:Float = 1;
		//
		if(shouldScaleDown){
			scaleXY = 1 - (0.001*n); 
		}
		
		// lets animate the position
		if(shouldTween){
			s.x = cx;
			s.y = cy;
			s.scaleX = s.scaleY = 0.1;
			if(shouldBounce){
				Actuate.tween(s,1.0,{x:sx,y:sy,scaleX:scaleXY,scaleY:scaleXY}).ease(Bounce.easeOut);
			}else{
				Actuate.tween(s,2.0,{x:sx,y:sy,scaleX:scaleXY,scaleY:scaleXY});
			}
		}else{
			s.x = sx;
			s.y = sy;
			s.scaleX = s.scaleY = scaleXY;
		}
		

	}

	private function pattern_1():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		c.x = Math.random()*(bgSize.x);
		c.y = Math.random()*(bgSize.y);
		c.rotation = Math.random() * (90);
		c.scaleX = c.scaleY = 0.4;
		container.addChild(c);
		//Actuate.tween(this,1.0,{ rotation:r }).ease (Quad.easeOut);
		*/
		renderParticle(2,false,false,true,true);

	}
	private function pattern_2():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.scaleX = c.scaleY = 0.4;
		container.addChild(c);
		*/
		renderParticle(2,false,true,false,false);
		//renderParticle(2,10,withBorder,false,true);
	}
	private function pattern_3():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.rotation = counter;
		c.scaleX = c.scaleY = 0.4;
		container.addChild(c);
		*/
		renderParticle(4,false);
	}
	private function pattern_4():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.rotation = (22.5)*(counter);
		c.scaleX = c.scaleY = 0.4;
		container.addChild(c);
		*/
		renderParticle(4,false,true);
	}
	private function pattern_5():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.rotation = (2)*(counter);
		c.scaleX = c.scaleY = 0.4;
		container.addChild(c);
		*/
		renderParticle(7,false,false,true);
	}
	private function pattern_6():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*counter;
		c.y = (bgSize.y/2)+ Math.cos(counter)*counter;
		c.rotation = (2)*(counter);
		c.scaleX = c.scaleY = Math.sin(counter);
		container.addChild(c);
		*/
		renderParticle(9,false,false,true);
	}
	private function pattern_7():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*(counter/5);
		c.y = (bgSize.y/2)+ Math.cos(counter)*(counter/5);
		c.rotation = (1)*(counter);
		var b = (1 - (1/1000)*(counter));
		c.scaleX = c.scaleY = b;
		container.addChild(c);
		*/
		renderParticle(2,true,false,true);
	}
	private function pattern_8():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*(counter/5);
		c.y = (bgSize.y/2)+ Math.cos(counter)*(counter/5);
		var b = (1 - (1/1000)*(counter));
		c.scaleX = c.scaleY = b;
		container.addChild(c);
		*/
		renderParticle(2,true,false);
	}
	private function pattern_9():Void{
		/*
		var c:BitmapSprite = shapeUtil.getBitmapSprite(ShapeUtil.SQUARE,true);
		counter++;
		c.x = (bgSize.x/2)+ Math.sin(counter)*(counter/5);
		c.y = (bgSize.y/2)+ Math.cos(counter)*(counter/5);
		c.rotation = (9)*(counter);
		var b = (1 - (1/1000)*(counter));
		c.scaleX = c.scaleY = b;
		container.addChild(c);
		*/
		renderParticle(2,true,false,true);
	}
}