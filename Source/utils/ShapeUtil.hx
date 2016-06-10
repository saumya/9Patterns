// Factory 
// provides us shapes
package utils;

import openfl.display.Shape;
import openfl.display.Graphics;
import openfl.display.Bitmap;
import openfl.display.BitmapData;

import openfl.geom.Point;

import openfl.Assets;
import openfl.Lib;

import utils.display.BitmapSprite;

class ShapeUtil {

	public static var CIRCLE:String = 'circle';
	public static var SQUARE:String = 'square';

	private var maxColorValue:UInt;
	private var bgSize:Point;

	public function new() {
		this.maxColorValue = 256*256*256;
		//this.bgSize = new Point(1017,800);
		this.bgSize = new Point(400,600);// The values are set in Project.xml
	}
	public function getBackground(width:UInt=400,height:UInt=600,?color:UInt):Shape{
		this.bgSize = new Point(width,height);

		var s:Shape = new Shape();
		var g:Graphics = s.graphics;
		var c:UInt = Math.round(Math.random()*this.maxColorValue);
		
		if (color != null) {
			c = color;
		}

		g.beginFill(c,1.0);
		g.drawRect(0,0,bgSize.x,bgSize.y);
		g.endFill();
		return s;
	}
	// For a random color and border, parameters would be (4,0,true)
	// The middle parameter would be zero ( 0 )
	public function getCircle(radius:Float,?color:UInt=0,?hasBorder:Bool):Shape{
		
		var c:UInt = getARandomColor();
		if(color != 0 ){
			c = color;
		}
		
		var s:Shape = new Shape();
		var g:Graphics = s.graphics;
		
		if (hasBorder) {
			g.lineStyle(1,0xFFFFFF);
		}

		// make it in center by starting the drawing from negative half
		var cx:Float = 0 ;
		var cy:Float = 0 ;
		//cx = cy = (-1)*(radius/2) ;

		g.beginFill(c,1.0);
		g.drawCircle(cx,cy,radius);
		g.endFill();
		return s;
	}
	// For a random color and border, parameters would be (4,0,true)
	// The middle parameter would be zero ( 0 )
	public function getSquare(length:UInt,?color:UInt=0, ?hasBorder:Bool):Shape{

		var c:UInt = getARandomColor();
		if(color != 0){
			c = color;
		}

		var s:Shape = new Shape();
		var g:Graphics = s.graphics;

		if (hasBorder) {
			g.lineStyle(1,0xFFFFFF);
		}

		// make it in center by starting the drawing from negative half
		var cx:Float = 0 ;
		var cy:Float = 0 ;
		cx = cy = (-1)*(length/2) ;
		//
		g.beginFill(c,1.0);
		g.drawRect(cx,cy,length,length);
		g.endFill();
		return s;
	}
	// Returns a Random shape
	// n is 
	// radius of the circle
	// length of a side of the square
	public function getRandomShape(n:UInt):Shape{
		var a = Math.round(Math.random()*2); // 2 : as we have circle,rectangle
		var s:Shape;
		switch (a) {
			case 1:
				s = getCircle(n);
			case 2:
				s = getSquare(n);
				// incase random rotation is required
				//var r1:UInt = Math.round(Math.random()*90);
				//s.rotation = r1;
			default:
				s = getCircle(n);
		}
		return s;
	}
	public function getRandomShapeSizeColor(maxSize:UInt):Shape{
		var randomSize:UInt = Math.round(Math.random()*maxSize);
		var s = getRandomShape(randomSize);
		return s;
	}
	//
	public function getARandomColor():UInt{
		var i:Float = Math.random()*this.maxColorValue;
		var j:UInt = Math.round(i);
		return j;
	}
	//  ########################### Bitmap #############################
	public function getBitmapSquare():Bitmap{
		var map:Bitmap = new Bitmap (Assets.getBitmapData ("images/square.png"));
		return map;
	}
	public function getBitmapCircle():Bitmap{
		var map:Bitmap = new Bitmap (Assets.getBitmapData ("images/circle.png"));
		return map;
	}
	public function getBitmapSprite(?type:String='square',?isCentered:Bool=false):BitmapSprite{
		var map:Bitmap;
		var bitmapSprite:BitmapSprite;
		if (type==ShapeUtil.SQUARE) {
			map = getBitmapSquare();
		}else if(type==ShapeUtil.CIRCLE){
			map = getBitmapCircle();
		}else{
			// default
			map = getBitmapSquare();
		}
		bitmapSprite = new BitmapSprite(map,isCentered);
		return bitmapSprite;
	}
}