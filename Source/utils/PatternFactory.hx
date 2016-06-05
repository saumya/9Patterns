//
package utils;

import openfl.display.Sprite;
import openfl.geom.Point;

import utils.ShapeUtil;

class PatternFactory {
	
	private var patternContainer:Sprite;
	private var bgSize:Point; // width, height . Saved as a point for easy reference
	private var shapeUtil:ShapeUtil;

	private var patternIndex:UInt;

	public function new() {
		construct();
	}
	private function construct():Void{
		shapeUtil = new ShapeUtil();
		patternIndex = 1;
	}
	// First mathod to be called, before anything else
	public function setContainer(container:Sprite,backgroundSize:Point):Void{
		this.patternContainer = container;
		this.bgSize = backgroundSize;
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
		if(patternIndex>=17){
			this.patternIndex = 1;
		}
	}
	public function getPatternNum():UInt{
		return patternIndex;
	}

	public function renderPattern():Void{
		//
		var n:Int = this.patternContainer.numChildren;
		if(n>=1000){
			this.patternContainer.removeChildren();
		}
		
		
		switch (this.patternIndex) {
			case 1:
				pattern_one();
			case 2:
				pattern_two();
			case 3:
				pattern_three();
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
			default:
				trace('case : default : TODO:Fix it for a better experience.');
				//this.patternIndex = 1;
				//pattern_one();
		}
		
		//pattern_9();
	}

	public function pattern_one(?withBorder:Bool = false):Void{
		// clear
		//clearContainer();
		//

		/*
		var s = shapeUtil.getRandomShapeSizeColor(50);
		s.x = get_RandomPosition_InsideContainer().x;
		s.y = get_RandomPosition_InsideContainer().y;
		this.patternContainer.addChild(s);
		*/
		
		
		//s.x = get_CenterPosition_InsideContainer().x + (Math.sin(i) * (i/2)) ;
		//s.y = get_CenterPosition_InsideContainer().y + (Math.cos(i) * (i/2)) ;
		

		/*
		var n = patternContainer.numChildren;
		var i:UInt = (1000 - n)+1;

		var sizeNum:UInt = Math.round((30*n/1000));
		var s = shapeUtil.getCircle(sizeNum, 0xAAAAAA,true );

		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(i)*(i/4));
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(i)*(i/4));
		*/

		//var s = shapeUtil.getRandomShapeSizeColor(30);
		var n = patternContainer.numChildren;
		
		var r:Float = 10 + Math.random()*10 ;

		var s = shapeUtil.getCircle(r,0,withBorder);
		
		s.x = get_CenterPosition_InsideContainer().x + (n/4) * Math.sin(n);
		s.y = get_CenterPosition_InsideContainer().y + (n/4) * Math.cos(n);


		// last
		patternContainer.addChild(s);
	}

	public function pattern_two(?withBorder:Bool = false):Void{
		//clearContainer();
		//

		/*
		var s = shapeUtil.getCircle(Math.round(Math.random()*30));
		s.x = get_RandomPosition_InsideContainer().x;
		s.y = get_RandomPosition_InsideContainer().y;
		*/

		var n = patternContainer.numChildren;
		var r:UInt = Math.round(30 - (30)*(n/1000));
		var s = shapeUtil.getCircle(r,0,withBorder);
		s.x = get_CenterPosition_InsideContainer().x + (n/4) *Math.sin(n);
		s.y = get_CenterPosition_InsideContainer().y + (n/4)*Math.cos(n);

		//
		this.patternContainer.addChild(s);
	}
	public function pattern_three(?withBorder:Bool = false):Void{
		//clearContainer();
		
		/*
		var s = shapeUtil.getSquare(Math.round(Math.random()*30));
		s.x = get_RandomPosition_InsideContainer().x;
		s.y = get_RandomPosition_InsideContainer().y;
		*/

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
		//clearContainer();
		
		var s = shapeUtil.getCircle(30);
		var n = patternContainer.numChildren;
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/2)) ;
		
		/*
		var n = patternContainer.numChildren;
		var r:UInt = Math.round(30 - (30)*(n/1000));
		
		var s = shapeUtil.getSquare(r);
		s.rotation = Math.sin(n);

		s.x = get_CenterPosition_InsideContainer().x + Math.sin(n) * (n/2);
		s.y = get_CenterPosition_InsideContainer().y + Math.cos(n) * (n/2);
		*/
		//
		patternContainer.addChild(s);
	}
	public function pattern_5():Void{
		/*
		var s = shapeUtil.getSquare(30);
		var n = patternContainer.numChildren;
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/2)) ;
		*/

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
		/*
		var s = shapeUtil.getSquare(30);
		var n = patternContainer.numChildren;
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/2)) ;
		s.rotation = n;
		*/
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
		//s.rotation = n;
		patternContainer.addChild(s);
	}
	public function pattern_8():Void{
		
		var n:UInt = patternContainer.numChildren;
		var c:UInt = Math.round((256*256*256)*Math.sin(n));

		//var l:UInt = Math.round(30*Math.sin(n)) ;

		var s = shapeUtil.getSquare(20, c,true );

		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/2)) ;
		s.rotation = Math.random() * n;

		//
		patternContainer.addChild(s);
		
		//pattern_6(true)
	}
	public function pattern_9():Void{
		/*
		var n = patternContainer.numChildren;
		var s = shapeUtil.getCircle(30, 0,true );
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/2)) ;
		
		patternContainer.addChild(s);
		*/
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
		


		/*
		var n:UInt = patternContainer.numChildren;
		var c:UInt = Math.round((256*256*256)*Math.random()*(200));

		//var l:UInt = Math.round(20+(50*Math.sin(n))) ;

		var s = shapeUtil.getCircle(20, c,false );
		s.rotation = n;

		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n) * (n/2)) ;
		*/
		
		//
		patternContainer.addChild(s);
	}
	public function pattern_13():Void{
		/*
		var n = patternContainer.numChildren;
		var i:UInt = 1000 - n;
		var j:Float = 30-(30*((n+1)/1000));
		var s = shapeUtil.getCircle(j,0);
		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(i) * (i/4)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(i) * (i/4)) ;
		*/

		var n:UInt = patternContainer.numChildren;
		var c:UInt = Math.round((256*256*256)*Math.sin(n));

		//var l:Float = 10+(30*Math.sin(n)) ;

		var o = 30;
		var p = Math.random()*n;

		var s = shapeUtil.getCircle(o, c,true );

		s.x = get_CenterPosition_InsideContainer().x + (Math.sin(n*p) * (n/2)) ;
		s.y = get_CenterPosition_InsideContainer().y + (Math.cos(n*p) * (n/2)) ;
		//s.rotation = n;
		//
		patternContainer.addChild(s);
	}
	public function pattern_14():Void{
		var n = patternContainer.numChildren;
		var i:UInt = 1000 - n;
		
		var j:Float = 30-(30*((n+1)/1000));
		var k:UInt = Math.round(Math.random()*j);

		//var k:Float = (Math.sin(i)) * (i/2))*(Math.cos(i)) * (i/2));
		//var k:Float = Math.cos(i) * Math.sin(i) * (i/2);

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
}