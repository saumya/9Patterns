//
package utils.display;

import openfl.display.Sprite;
import openfl.display.Bitmap;

import openfl.events.MouseEvent;

import motion.Actuate;
import motion.easing.Quad;


class BitmapSprite extends Sprite {
	var map:Bitmap;
	var isAtCenter:Bool;
	public function new(bitmap:Bitmap,?isCenterPositioned:Bool=false) {
		super();
		map = bitmap;
		isAtCenter = isCenterPositioned;
		//
		map.smoothing = true;
		//
		construct();
	}
	private function construct():Void{
		if (isAtCenter) {
			map.x = (-1)*(map.width/2);
			map.y = (-1)*(map.height/2);
		}
		this.addEventListener(MouseEvent.CLICK,onClick);
		//
		this.addChild(map);
	}

	private function onClick(e:MouseEvent):Void {

		var r:Float = Math.random() * 100;
		var a:Float = r+Math.sin(Math.random()*90) + this.x;
		var b:Float = r*Math.cos(Math.random()*90) + this.y;

		Actuate.tween(this,1.0,{ x:a, y:b });
	}
}