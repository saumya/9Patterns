package utils.display;

import openfl.display.Sprite;
import openfl.display.Graphics;

import openfl.events.Event;
import openfl.events.MouseEvent;

import utils.button.QuickButtonWithBgColor;

class SplashScreen extends Sprite {

	public static var SPLASH_EVENT:String = "splashEvent";

	private var btn1:QuickButtonWithBgColor;
	private var btn2:QuickButtonWithBgColor;
	private var colorValue:UInt;
	
	public function new() {
		super();
		//addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		construct();
	}

	private function onAddedToStage(e:Event):Void{
		removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		construct();
	}
	private function construct():Void{
		/*
		var w:Float = this.stage.stageWidth;
		var h:Float = this.stage.stageHeight;
		*/
		colorValue = Math.round(Math.random()*(256*256*256));
		btn1 = new QuickButtonWithBgColor("9 Patterns",80,colorValue);
		btn2 = new QuickButtonWithBgColor("Tap to continue",40,colorValue);
		addChild(btn1);
		addChild(btn2);
		//
		this.addEventListener(MouseEvent.CLICK,onUserClick);
	}
	private function onUserClick(e:MouseEvent):Void{
		trace('onUserClick');
		dispatchEvent(new Event(SplashScreen.SPLASH_EVENT));
	}
	// This is where it is rendered now
	// TODO: fix the rendering logic of the game from the beginning  with ADDED_TO_STAGE event
	public function restart():Void{
		//trace('SplashScreen : restart');
		var w:Float = this.stage.stageWidth;
		var h:Float = this.stage.stageHeight;
		//trace(w,h);
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(colorValue,1.0);
		g.drawRect(0,0,w,h);
		g.endFill();
		/*
		if(w<btn1.width){
			btn1.scaleX = btn1.scaleY = 0.5;
		}else{
			btn1.scaleX = btn1.scaleY = 1.0;
		}*/
		//
		var xPos:Float = (w - btn1.width)/2;
		var yPos:Float = (h-btn1.height)/2 - 50;
		btn1.x = xPos;
		btn1.y = yPos;
		btn2.x = (w-btn2.width)/2;
		btn2.y = yPos + 100;
	}


}