package utils.button;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.events.MouseEvent;
import openfl.events.Event;

import motion.Actuate;
import motion.easing.Quad;
import motion.easing.Elastic;


class ToggleButton extends Sprite {

	public static var TOGGLE_EVENT:String = "ToggleEvent";
	
	private var btn:Sprite;
	private var isOn:Bool;

	public function new() {
		super();
		construct();
	}
	private function construct():Void{
		btn = new Sprite();
		
		var margin:Float = 2.0;
		drawBackground(100,50,margin);
		drawBtn(50,40,margin);

		btn.x = 4;
		btn.y = 5;
		addChild(btn);

		addEventListener(MouseEvent.CLICK,onUserClick);

		initialise();
	}
	private function initialise():Void{
		isOn = false;
	}
	private function drawBackground(w:Float,h:Float,margin:Float):Void{
		//var widthX:Float = w + (2*margin);
		var g:Graphics = this.graphics;
		//var maxColorValue:UInt = 256 * 256 * 256;
		//var c:UInt = Math.round(Math.random()*maxColorValue);
		var c:UInt = 0xDDDDDD; // background
		g.clear();
		g.beginFill(c,1.0);
		g.drawRect(0,0,w,h);
		g.endFill();
		//
		g.beginFill(0x993333,1.0);// left side
		g.drawRect(4,7,46,36);
		g.endFill();
		//
		g.beginFill(0x339933,1.0);// right side
		g.drawRect(50,7,46,36);
		g.endFill();
	}
	private function drawBtn(w:Float,h:Float,margin:Float):Void{
		var g:Graphics = btn.graphics;
		var c:UInt = 0xCCCCCC;
		g.clear();
		g.beginFill(c,1.0);
		g.drawRect(0,0,w,h);
		g.endFill();
	}

	private function onUserClick(e:MouseEvent):Void{
		// Change value
		isOn = !isOn;
		// animate
		var newX:Float = 0.0; // (100-4)-(50)
		var newColor:UInt = 0xFFFFFF;
		if (isOn) {
			newX = 46;
			newColor = 0xFFFFFF;
		} else{
			newX = 4;
			newColor = 0xCCCCCC;
		}
		Actuate.tween(this.btn,0.6,{ x:newX }).ease (Quad.easeOut);
		//finally 
		dispatchEvent(new Event(ToggleButton.TOGGLE_EVENT));
	}

}