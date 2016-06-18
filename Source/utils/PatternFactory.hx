//
package utils;

import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.geom.Point;

import utils.ShapeUtil;
import utils.BitmapPatterns;

class PatternFactory {
	
	private var patternContainer:Sprite;
	private var bgSize:Point; // width, height . Saved as a point for easy reference
	private var shapeUtil:ShapeUtil;
	private var bitmapPatterns:BitmapPatterns;

	private var patternIndex:UInt;
	//
	private var isBitmapPatterns:Bool;

	private var counterX:UInt;

	public function new(?shouldRenderBitmap:Bool=false) {
		isBitmapPatterns = shouldRenderBitmap;
		construct();
	}
	private function construct():Void{
		shapeUtil = new ShapeUtil();
		bitmapPatterns = new BitmapPatterns(shapeUtil);
		patternIndex = 1;
		counterX = 0;
	}
	// First mathod to be called, before anything else
	public function setContainer(container:Sprite,backgroundSize:Point):Void{
		this.patternContainer = container;
		this.bgSize = backgroundSize;
		//
		bitmapPatterns.setContainer(this.patternContainer,this.bgSize);
	}
	public function swapRenderType():Void{
		isBitmapPatterns = !isBitmapPatterns;
		this.patternContainer.removeChildren();
	}
	public function restart():Void{
		bitmapPatterns.restart();
	}

	// internal
	private function clearContainer():Void{
		var n:Int = this.patternContainer.numChildren;
		if(n>=1000){
			this.patternContainer.removeChildren();
		}
	}
	private function get_RandomPosition_InsideContainer():Point{
		var p:Point = new Point();
		p.x = this.bgSize.x*Math.random();
		p.y = this.bgSize.y*Math.random();
		return p;
	}
	private function get_CenterPosition_InsideContainer():Point{
		var p:Point = new Point();
		p.x = this.bgSize.x / 2;
		p.y = this.bgSize.y / 2;
		return p;
	}

	// API
	public function nextPattern():Void{
		this.patternIndex = this.patternIndex+1;
		/*
		if (this.isBitmapPatterns) {
			if(patternIndex>=10){
				this.patternIndex = 1;
			}
		}else{
			if(patternIndex>=19){
				this.patternIndex = 1;
			}
		}*/

		if(patternIndex>=10){
			this.patternIndex = 1;
		}
		bitmapPatterns.nextPattern();
	}
	public function getPatternNum():UInt{
		return patternIndex;
	}

	public function renderPattern():Void{
		//
		if (this.isBitmapPatterns) {
			bitmapPatterns.render(patternIndex);
		} else {
			//
			var n:Int = this.patternContainer.numChildren;
			if(n>=1000){
				this.patternContainer.removeChildren();
			}
			//switch
			switch (this.patternIndex) {
				case 1:
					//pattern_one();
					p_1();
				case 2:
					//pattern_two();
					p_2();
				case 3:
					//pattern_three();
					p_3();
				case 4:
					//pattern_4();
					p_4();
				case 5:
					//pattern_5();
					p_5();
				case 6:
					//pattern_6();
					p_6();
				case 7:
					//pattern_7();
					p_7();
				case 8:
					//pattern_8();
					p_8();
				case 9:
					//pattern_9();
					p_9();
				case 10:
					pattern_10();
				case 11:
					pattern_11();
				case 12:
					pattern_12();
				case 13:
					pattern_13();
				case 14:
					pattern_14();
				case 15:
					pattern_15();
				case 16:
					pattern_16();
				case 17:
					pattern_17();
				case 18:
					pattern_18();
				default:
					trace('case : default : TODO:Fix it for a better experience.');
					this.patternIndex = 1;
					pattern_one();
				}// End Switch
		}// End Else
		
		//pattern_9();
	}

	public function pattern_one(?withBorder:Bool = false):Void{
		
		var n = patternContainer.numChildren;
		var r:Float = 10 + Math.random()*10 ;
		var s = shapeUtil.getCircle(r,0,withBorder);
		s.x = get_CenterPosition_InsideContainer().x + (n/4) * Math.sin(n);
		s.y = get_CenterPosition_InsideContainer().y + (n/4) * Math.cos(n);
		
		// last
		patternContainer.addChild(s);
		
	}

	public function pattern_two(?withBorder:Bool = false):Void{
		var n = patternContainer.numChildren;
		var r:UInt = Math.round(30 - (30)*(n/1000));
		var s = shapeUtil.getCircle(r,0,withBorder);
		s.x = get_CenterPosition_InsideContainer().x + (n/4) *Math.sin(n);
		s.y = get_CenterPosition_InsideContainer().y + (n/4)*Math.cos(n);
		//
		this.patternContainer.addChild(s);
	}
	public function pattern_three(?withBorder:Bool = false):Void{
		var n = patternContainer.numChildren;
		var i:UInt = 1000 - n;
		var j:UInt = Math.round(30*(n/1000));
		var s = shapeUtil.getSquare(j,0,withBorder);
		s.rotation = n;
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(i) * (i/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(i) * (i/4)) ;

		patternContainer.addChild(s);
	}
	public function pattern_4():Void{
		var s = shapeUtil.getCircle(30);
		var n = patternContainer.numChildren;
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/2)) ;
		//
		patternContainer.addChild(s);
	}
	public function pattern_5():Void{
		var n = patternContainer.numChildren;
		var r:UInt = Math.round(30 - (30)*(n/1000));
		var s = shapeUtil.getSquare(r);
		s.rotation = n;
		s.x = get_CenterPosition_InsideContainer().x + Math.sin(n) * (n/2);
		s.y = get_CenterPosition_InsideContainer().y + Math.cos(n) * (n/2);
		//
		patternContainer.addChild(s);
	}
	public function pattern_6():Void{
		var n = patternContainer.numChildren;
		var r:UInt = Math.round(30 - (30)*(n/1000));
		var s = shapeUtil.getSquare(r,0xAAAAAA,true);
		s.rotation = Math.random() * n;
		s.x = get_CenterPosition_InsideContainer().x + Math.sin(n) * (n/2);
		s.y = get_CenterPosition_InsideContainer().y + Math.cos(n) * (n/2);
		//
		patternContainer.addChild(s);
	}
	public function pattern_7():Void{
		var n = patternContainer.numChildren;
		var o = 30;
		var p = Math.random()*n;
		var s = shapeUtil.getCircle(o, 0xAAAAAA,true );
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n*p) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n*p) * (n/2)) ;
		//
		patternContainer.addChild(s);
	}
	public function pattern_8():Void{
		var n:UInt = patternContainer.numChildren;
		var c:UInt = Math.round((256*256*256)*Math.random());
		var s = shapeUtil.getSquare(20, c,true );
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/2)) ;
		s.rotation = Math.random() * n;
		//
		patternContainer.addChild(s);
	}
	public function pattern_9():Void{
		pattern_two(true);
	}
	public function pattern_10():Void{
		var n = patternContainer.numChildren;
		var i:UInt = 1000 - n;
		var o = 30;
		var p = Math.random()*n;
		var s = shapeUtil.getCircle(o, 0xAAAAAA,true );
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(i*p) * (i/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(i*p) * (i/4)) ;
		
		patternContainer.addChild(s);
	}
	public function pattern_11():Void{
		var n = patternContainer.numChildren;
		var i:UInt = 1000 - n;
		var j:Float = 30*(n/1000);
		var s = shapeUtil.getCircle(j,0,true );
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(i) * (i/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(i) * (i/4)) ;
		
		patternContainer.addChild(s);
	}
	public function pattern_12():Void{
		var n = patternContainer.numChildren;
		var i:UInt = 1000 - n;
		var j:Float = 30-(30*((n+1)/1000));
		var s = shapeUtil.getCircle(j,0,true );
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(i) * (i/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(i) * (i/4)) ;
		//
		patternContainer.addChild(s);
	}
	public function pattern_13():Void{
		var n:UInt = patternContainer.numChildren;
		var c:UInt = Math.round((256*256*256)*Math.sin(n));
		var o = 30;
		var p = Math.random()*n;
		var s = shapeUtil.getCircle(o, c,true );
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n*p) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n*p) * (n/2)) ;
		//
		patternContainer.addChild(s);
	}
	public function pattern_14():Void{
		var n = patternContainer.numChildren;
		var i:UInt = 1000 - n;
		
		var j:Float = 30-(30*((n+1)/1000));
		var k:UInt = Math.round(Math.random()*j);
		var s = shapeUtil.getCircle(k,0);
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(i) * (i/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(i) * (i/4))  ;
		
		patternContainer.addChild(s);
	}
	public function pattern_15():Void{
		pattern_one(true);
	}
	public function pattern_16():Void{
		pattern_three(true);
	}
	public function pattern_17(?isRandomColor:Bool=false,?hasBorder:Bool=true):Void {
		var n = patternContainer.numChildren;
		var i:UInt = 1000 - n;
		var o = 30 * (i/1000);
		var p = Math.random()*n;
		var c = 0xAAAAAA;
		if(isRandomColor){
			c = Math.round(Math.random()*(256*256*256));
		}
		var s = shapeUtil.getCircle(o, c,hasBorder );
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n*p) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n*p) * (n/2)) ;

		patternContainer.addChild(s);
	}
	public function pattern_18():Void {
		pattern_17(true,false);
	}
	//
	private function renderParticle(?d:UInt=2,?radius:Float=10,?withBorder:Bool=false,?isRandomPos:Bool=false):Void{
		var n = patternContainer.numChildren;
		var p:Float = 1;
		if(isRandomPos){
			p = Math.random()*n;
		}
		var s = shapeUtil.getCircle(radius,0,withBorder);
		s.x = get_CenterPosition_InsideContainer().x + (n/d) * Math.sin(n*p);
		s.y = get_CenterPosition_InsideContainer().y + (n/d) * Math.cos(n*p);
		// add to display list
		patternContainer.addChild(s);
	}
	private function p_1(?withBorder:Bool=false):Void{
		renderParticle(2,10,withBorder);
	}
	private function p_2(?withBorder:Bool=false):Void{
		renderParticle(2,20,withBorder);
	}
	private function p_3(?withBorder:Bool=false):Void{
		renderParticle(2,40,withBorder);
	}
	private function p_4(?radius:Float=10,?withBorder:Bool=false):Void{
		renderParticle(4,10,withBorder);
	}
	private function p_5(?withBorder:Bool=false):Void{
		renderParticle(4,20,withBorder);
	}
	private function p_6(?withBorder:Bool=false):Void{
		renderParticle(4,40,withBorder);
	}
	public function p_7(?radius:Float=10,?withBorder:Bool=false):Void{
		renderParticle(2,10,withBorder,true);
	}
	private function p_8(?withBorder:Bool=false):Void{
		renderParticle(2,20,withBorder,true);
	}
	private function p_9(?withBorder:Bool=false):Void{
		renderParticle(2,40,withBorder,true);
	}


}