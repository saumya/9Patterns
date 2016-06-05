//
package utils.button;

import openfl.display.Graphics;
import openfl.display.Sprite;

import openfl.events.MouseEvent;
import openfl.events.Event;

import utils.ButtonFactory;
import utils.button.QuickButtonWithBgColor;
import utils.button.EventNames;

class Menu extends Sprite {

	private var btnFactory:ButtonFactory;
	private var btnPause:QuickButtonWithBgColor;
	private var gameWidth:Float;

	private var patternNumText:QuickButtonWithBgColor;

	public function new() {
		super();
		
		this.btnFactory = new ButtonFactory();
		gameWidth = 200;

		construct();
	}

	public function setPauseButtonLabel(label:String):Void{
		trace("TODO");
	}
	public function setMenuWidth(newWidth:Float):Void{
		gameWidth = newWidth;
		makeBg();
	}
	public function setPatternNumText(num:UInt):Void{
		//trace(num);
		// for String conversion
		// cast never work
		// use the Std.string to do a conversion

		//var s = cast( num , String ) ;
		var s:String = Std.string(num);

		//trace(Std.is(s,String));
		
		patternNumText.setText(s);
	}

	private function construct():Void{
		makeBg();
		//
		var leftPadding :UInt = 12;
		var bgColor:UInt = 0xFFFFFF;

		var btnRestart:QuickButtonWithBgColor = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"RESTART",42);
		btnRestart.addEventListener("click",onRestart);
		btnRestart.x = leftPadding;
		btnRestart.y = 2;
	
		var btnNew:QuickButtonWithBgColor = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"NEW",42);
		btnNew.addEventListener("click",onNew);
		btnNew.x = leftPadding;
		btnNew.y = btnRestart.y + btnRestart.height + 4;

		this.btnPause = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"PAUSE",42);
		btnPause.addEventListener("click",onPause);
		//btnPause.x = leftPadding + btnNew.x+btnNew.width;
		//btnPause.y = btnNew.y;

		var btnSaveImage = this.btnFactory.getQuickButtonWithBgColor(0xFFFFFF,"SAVE IMAGE",42);
		btnSaveImage.addEventListener("click",onSaveImage);
		btnSaveImage.x = btnNew.x + btnNew.width + leftPadding;
		btnSaveImage.y = btnNew.y;

		patternNumText = btnFactory.getQuickButtonWithBgColor(bgColor,"1");
		patternNumText.x = btnRestart.x+btnRestart.width+leftPadding;
		patternNumText.y = 2;

		btnPause.x = leftPadding + patternNumText.x+patternNumText.width + 24;
		btnPause.y = patternNumText.y;

		this.addChild(btnRestart);
		this.addChild(btnNew);
		this.addChild(btnPause);
		this.addChild(patternNumText);
		addChild(btnSaveImage);
	}
	private function makeBg():Void{
		// The values are set in Project.xml
		var g:Graphics = this.graphics;
		g.clear();
		g.beginFill(0xAAAAAA,1.0);
		g.drawRect(0,0,gameWidth,120);
		g.endFill();
	}
	//
	private function onRestart(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_RESTART);
		dispatchEvent(newEvent);
	}
	private function onNew(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_NEW_PATTERN);
		dispatchEvent(newEvent);
	}
	private function onPause(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.GAME_PAUSE);
		dispatchEvent(newEvent);
	}
	private function onSaveImage(e:MouseEvent):Void{
		var newEvent:Event = new Event(EventNames.SAVE_IMAGE);
		dispatchEvent(newEvent);
	}
}