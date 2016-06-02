//
package;

import openfl.display.Sprite;
import openfl.events.Event;

import game.GBackground;
import game.Game;


class Main extends Sprite {

	private var gBackground:GBackground;
	private var game:Game;

	
	public function new () {
		
		super ();
		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
	}

	private function construct ():Void {
		trace('construct');

		addChild(gBackground);
		addChild(game);
	}

	private function initialize ():Void {
		trace('initialize');
		this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		stage.addEventListener (Event.RESIZE, stage_onResize);

		var w:Float = stage.stageWidth;
		var h:Float = stage.stageHeight;

		gBackground = new GBackground(w,h,false);
		game = new Game(w,h);
		
		construct();
	}

	private function resize (newWidth:Int, newHeight:Int):Void {
		trace('resize');
		gBackground.reDraw(newWidth,newHeight);
		game.restart();
	}
	
	
	private function stage_onResize (event:Event):Void {
		
		resize (stage.stageWidth, stage.stageHeight);
		
	}

	private function onAddedToStage(event:Event):Void{
		trace('onAddedToStage');
		initialize();
	}
	
	
}