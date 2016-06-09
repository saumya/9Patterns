// A quick bitmap button
package utils.button;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.Assets;
import openfl.Lib;

class BitmapButton extends Sprite {
	private var bitmapBG:Bitmap;
	private var btnName:String;
	public function new(?name:String="restart") {
		super();
		btnName = name;
		construct();
	}
	private function construct():Void{
		bitmapBG = new Bitmap (Assets.getBitmapData ("images/"+btnName+".png"));
		addChild(bitmapBG);
	}

}
