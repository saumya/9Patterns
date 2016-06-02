//
package game;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.Assets;
import openfl.Lib;

class GBackground extends Sprite {

	private var bitmapBG:Bitmap;
	private var isVectorDisplay:Bool;
	private var bgPadding:Float;


	function new(newWidth:Float,newHeight:Float,isVector:Bool=false){
		super();
		//
		bgPadding = 10;
		isVectorDisplay = isVector;
		if(isVectorDisplay){
			draw(newWidth,newHeight);
		}else{
			makeBitmapBg(newWidth,newHeight);
		}
		//draw(newWidth,newHeight); // Vector Draw
		//makeBitmapBg(newWidth,newHeight); // Image Draw
	}

	private function makeBitmapBg(newWidth:Float,newHeight:Float):Void{
		bitmapBG = new Bitmap (Assets.getBitmapData ("images/background_tile.png"));

		bitmapBG.x = bitmapBG.y = bgPadding;
		resizeBitmap(newWidth,newHeight);

		addChild(bitmapBG);
	}
	private function resizeBitmap(newWidth:Float,newHeight:Float):Void{

		var p:Float = 2*bgPadding;

		bitmapBG.width = newWidth-p;
		bitmapBG.height = newHeight-p;
	}

	private function draw(newWidth:Float,newHeight:Float):Void{
		trace('draw');
		var c:UInt = 0xCCCCCC;
		var p:Float = 2*bgPadding;

		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(c,1.0);
		g.drawRect(bgPadding,bgPadding,newWidth-p,newHeight-p);
		g.endFill();
	}

	public function reDraw(newWidth:Float,newHeight:Float):Void{
		trace('reDraw');
		//this.graphics.clear();
		//draw(newWidth,newHeight);
		if(isVectorDisplay){
			draw(newWidth,newHeight);
		}else{
			resizeBitmap(newWidth,newHeight);
		}
	}
	
}