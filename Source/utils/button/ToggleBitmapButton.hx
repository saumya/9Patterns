package utils.button;

import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.display.Bitmap;

import openfl.events.MouseEvent;
import openfl.events.Event;

import motion.Actuate;
import motion.easing.Quad;
import motion.easing.Elastic;

import openfl.Assets;

class ToggleBitmapButton extends Sprite {

	public static var TOGGLE_EVENT:String = "ToggleEvent";
	
	private var btn:Sprite;
	private var isOn:Bool;

	private var map1:Bitmap; // off
	private var map2:Bitmap; // on

	public function new(onMap:Bitmap,offMap:Bitmap) {
		super();
		/*
		var s1:String = "images/pause.png" ;
		this.map1 = new Bitmap (Assets.getBitmapData (s1));
		var s2:String = "images/play.png" ;
		this.map2 = new Bitmap (Assets.getBitmapData (s2));
		*/
		this.map1 = onMap;
		this.map2 = offMap;
		construct();
	}
	private function construct():Void{
		//drawBackground(100,50);
		
		
		this.addChild(map1);
		this.addChild(map2);

		addEventListener(MouseEvent.CLICK,onUserClick);
		initialise();
	}
	private function initialise():Void{
		isOn = false;

		map1.visible = true;
		map2.visible = false;

	}
	private function drawBackground(w:Float,h:Float):Void{
		//var widthX:Float = w + (2*margin);
		var g:Graphics = this.graphics;
		//var maxColorValue:UInt = 256 * 256 * 256;
		//var c:UInt = Math.round(Math.random()*maxColorValue);
		var c:UInt = 0xDDDDDD; // background
		g.clear();
		g.beginFill(c,1.0);
		g.drawRect(0,0,w,h);
		g.endFill();
	}
	

	private function onUserClick(e:MouseEvent):Void{
		// Change value
		isOn = !isOn;
		if (isOn) {
			map1.visible = false;
			map2.visible = true;
		} else{
			map1.visible = true;
			map2.visible = false;
		}
		
		//finally 
		dispatchEvent(new Event(ToggleButton.TOGGLE_EVENT));
	}

}