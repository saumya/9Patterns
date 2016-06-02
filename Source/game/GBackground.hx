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
	private var bgPadding2X:Float;


	function new(newWidth:Float,newHeight:Float,isVector:Bool=false){
		super();
		//
		bgPadding = 0;
		bgPadding2X = bgPadding * 2;
		isVectorDisplay = isVector;
		if(isVectorDisplay){
			draw(newWidth,newHeight);
		}else{
			makeBitmapBg(newWidth,newHeight);
		}
	}

	private function makeBitmapBg(newWidth:Float,newHeight:Float):Void{
		bitmapBG = new Bitmap (Assets.getBitmapData ("images/background_tile.png"));

		bitmapBG.x = bitmapBG.y = bgPadding;
		resizeBitmap(newWidth,newHeight);

		addChild(bitmapBG);
	}
	private function resizeBitmap(newWidth:Float,newHeight:Float):Void{

		bitmapBG.width = newWidth-bgPadding2X;
		bitmapBG.height = newHeight-bgPadding2X;
	}

	private function draw(newWidth:Float,newHeight:Float):Void{
		var c:UInt = 0xCCCCCC;
		//
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(c,1.0);
		g.drawRect(bgPadding,bgPadding,newWidth-bgPadding2X,newHeight-bgPadding2X);
		g.endFill();
	}

	public function reDraw(newWidth:Float,newHeight:Float):Void{
		if(isVectorDisplay){
			draw(newWidth,newHeight);
		}else{
			resizeBitmap(newWidth,newHeight);
		}
	}
	
}