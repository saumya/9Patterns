//
package;

import openfl.display.Sprite;
import openfl.events.Event;

import game.GBackground;


class Main extends Sprite {

	private var gBackground:GBackground;

	
	public function new () {
		
		super ();
		/*
		initialize ();
		construct ();
		
		resize (stage.stageWidth, stage.stageHeight);
		stage.addEventListener (Event.RESIZE, stage_onResize);
		*/
		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
	}

	private function construct ():Void {
		trace('construct');

		addChild(gBackground);
	}

	private function initialize ():Void {
		trace('initialize');

		stage.addEventListener (Event.RESIZE, stage_onResize);

		gBackground = new GBackground(this.stage.stageWidth,this.stage.stageHeight);
		
		construct();
	}

	private function resize (newWidth:Int, newHeight:Int):Void {
		trace('resize');
		gBackground.reDraw(newWidth,newHeight);
		
	}
	
	
	private function stage_onResize (event:Event):Void {
		
		resize (stage.stageWidth, stage.stageHeight);
		
	}

	private function onAddedToStage(event:Event):Void{
		trace('onAddedToStage');
		initialize();
	}
	
	
}