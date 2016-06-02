//
package game;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.display.Shape;

import openfl.geom.Point;

import openfl.system.Capabilities;

import openfl.Assets;
import openfl.Lib;

import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

import utils.ShapeUtil;
import utils.ButtonFactory;
import utils.PatternFactory;

import utils.button.QuickButton;
import utils.button.QuickButtonWithBgColor;
import utils.button.Menu;

import utils.button.EventNames;

class Game extends Sprite {
	
	private var shapeUtil:ShapeUtil;
	private var buttonFactory:ButtonFactory;
	private var pFactory:PatternFactory;

	private var background:Shape;
	private var shapeContainer:Sprite;
	private var menu:Menu;

	private var isPaused:Bool;

	public var currentScale:Float;

	private var nWidth:Float;
	private var nHeight:Float;


	public function new(newWidth:Float,newHeight:Float){
		super();

		nWidth = newWidth;
		nHeight = newHeight;

		init();
	}
	public function init():Void{
		this.shapeUtil = new ShapeUtil();
		this.buttonFactory = new ButtonFactory();
		this.pFactory = new PatternFactory();

		this.isPaused = false;
		//
		construct();
	}
	public function construct():Void{
		// The values are set in Project.xml
		//var bgWidth:UInt = 700;
		//var bgHeight:UInt = 1100;

		//var bgWidth:UInt = this.stage.stageWidth;
		//var bgHeight:UInt = this.stage.stageHeight;
		//
		//this.background = this.shapeUtil.getBackground(bgWidth,bgHeight,0xAAAAAA);
		//this.addChild(this.background);

		//this.background.y = 10;

		this.shapeContainer = new Sprite();
		this.addChild(this.shapeContainer);

		this.menu = new Menu();
		this.menu.y = nHeight - menu.height;

		this.menu.addEventListener(EventNames.GAME_RESTART,onGameRestart);
		this.menu.addEventListener(EventNames.GAME_NEW_PATTERN,onGameNewPattern);
		this.menu.addEventListener(EventNames.GAME_PAUSE,onGamePause);
		this.addChild(menu);

		/*
		//var b1:QuickButton = this.buttonFactory.getQuickButton();
		var b1:QuickButtonWithBgColor = this.buttonFactory.getQuickButtonWithBgColor(0xFFFFFF,"RESTART",18);
		//var b2:QuickButton = this.buttonFactory.getQuickButton("Boom",60);
		//var b3:QuickButtonWithBgColor = this.buttonFactory.getQuickButtonWithBgColor(0xFFFFFF,"One");
		
		//b2.y = b1.height + 10;
		//b3.y = b2.y+b2.height + 10;

		
		b1.addEventListener("click",onButton1Click);

		this.addChild(b1);
		//this.addChild(b2);
		//this.addChild(b3);
		*/

		// set the container
		var bgSize:Point = new Point(nWidth,nHeight);
		this.pFactory.setContainer(shapeContainer,bgSize);
		//
		this.addEventListener(Event.ENTER_FRAME,render);
	}
	
	public function render(e:Event):Void{
		/*
		//this.shapeContainer.removeChildren();
		var n:Int = this.shapeContainer.numChildren;
		if(n>=1000){
			this.shapeContainer.removeChildren();
		}

		//var s = shapeUtil.getCircle(Math.round(Math.random()*50));
		//var s = shapeUtil.getSquare(Math.round(Math.random()*50));
		//var n:UInt = Math.round(Math.random()*50);
		//var s = shapeUtil.getRandomShape(n);

		var s = shapeUtil.getRandomShapeSizeColor(50);

		s.x = this.background.width*Math.random();
		s.y = this.background.height*Math.random();

		this.shapeContainer.addChild(s);
		*/

		this.pFactory.renderPattern();
		
	}

	public function resize(newWidth:Int, newHeight:Int):Void {
		var maxWidth = newWidth * 0.90;
		var maxHeight = newHeight * 0.86;
		
		currentScale = 1;
		scaleX = 1;
		scaleY = 1;
		
		var currentWidth = width;
		var currentHeight = height;
		
		if (currentWidth > maxWidth || currentHeight > maxHeight) {
			
			var maxScaleX = maxWidth / currentWidth;
			var maxScaleY = maxHeight / currentHeight;
			
			if (maxScaleX < maxScaleY) {
				currentScale = maxScaleX;
			} else {
				currentScale = maxScaleY;
			}

			
			/*
			scaleX = currentScale;
			scaleY = currentScale;
			*/
		}
		
		//x = newWidth / 2 - (currentWidth * currentScale) / 2;
		var i:Float = (newWidth / 2 - (currentWidth ) / 2);
		x = (1)*(i);

	}

	public function restart():Void{
		trace('restart');
	}

	//
	private function cleanAndRenderAgain():Void{
		this.shapeContainer.removeChildren();
		this.render(null);
	}
	private function changePattern():Void{
		this.shapeContainer.removeChildren();
		this.pFactory.nextPattern();
		this.render(null);
	}
	// Event Listeners
	/*
	private function onButton1Click(e:MouseEvent):Void {
		cleanAndRenderAgain();
	}
	*/
	private function onGameRestart(e:Event):Void{
		cleanAndRenderAgain();
	}
	private function onGameNewPattern(e:Event):Void{
		changePattern();
	}
	private function onGamePause(e:Event):Void{
		
		//this.addEventListener(Event.ENTER_FRAME,render);
		this.menu.setPauseButtonLabel("PLAY");
		
		if(this.isPaused){
			this.addEventListener(Event.ENTER_FRAME,render);
			this.isPaused = false;
		}else{
			this.removeEventListener(Event.ENTER_FRAME,render);
			this.isPaused = true;
		}
	}

}