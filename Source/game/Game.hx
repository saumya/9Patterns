//
package game;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Graphics;
import openfl.display.Shape;

import openfl.display.PNGEncoderOptions;
import openfl.display.JPEGEncoderOptions;

import openfl.geom.Point;
import openfl.geom.Rectangle;

import openfl.system.Capabilities;

import openfl.Assets;
import openfl.Lib;

import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

import openfl.utils.ByteArray;

import sys.io.FileOutput;

import utils.ShapeUtil;
import utils.ButtonFactory;
import utils.PatternFactory;

import utils.button.QuickButton;
import utils.button.QuickButtonWithBgColor;
import utils.button.Menu;

import utils.display.SplashScreen;

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

	private var splashScreen:SplashScreen;


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

		this.splashScreen = new SplashScreen();

		this.isPaused = false;
		//
		construct();
	}
	public function construct():Void{
		//
		this.shapeContainer = new Sprite();
		this.addChild(this.shapeContainer);

		this.menu = new Menu();
		this.menu.y = nHeight - menu.height;

		this.menu.addEventListener(EventNames.GAME_RESTART,onGameRestart);
		this.menu.addEventListener(EventNames.GAME_NEW_PATTERN,onGameNewPattern);
		this.menu.addEventListener(EventNames.GAME_PAUSE,onGamePause);
		this.menu.addEventListener(EventNames.SAVE_IMAGE,onSaveImage);
		this.menu.addEventListener(EventNames.CHANGE_RENDER_TYPE,onChangeRenderType);
		this.addChild(menu);

		// set the container
		var bgSize:Point = new Point(nWidth,nHeight - menu.height);
		this.pFactory.setContainer(shapeContainer,bgSize);

		// splashscreen
		this.splashScreen.addEventListener(SplashScreen.SPLASH_EVENT,onSplashScreenTap);
		this.addChild(this.splashScreen);

		// now it will start with the SplashScreen TAP 
		//this.addEventListener(Event.ENTER_FRAME,render);
	}
	private function onSplashScreenTap(e:Event):Void{
		trace('onSplashScreenTap');
		this.removeChild(splashScreen);
		//
		this.addEventListener(Event.ENTER_FRAME,render);
	}
	
	public function render(e:Event):Void{
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
		}
		var i:Float = (newWidth / 2 - (currentWidth ) / 2);
		x = (1)*(i);

	}
	// This actually renders the final output
	public function restart(newWidth:Float,newHeight:Float):Void{
		trace('restart');
		splashScreen.restart();
		//
		nWidth = newWidth;
		nHeight = newHeight;

		this.menu.y = nHeight - menu.height;
		this.menu.setMenuWidth(newWidth);

		var bgSize:Point = new Point(nWidth,nHeight-(menu.height+10));// Change the value of 10 to render towards upper part
		this.pFactory.setContainer(shapeContainer,bgSize);

		cleanAndRenderAgain();
	}
	//
	private function cleanAndRenderAgain():Void{
		this.shapeContainer.removeChildren();
		this.render(null);
	}
	private function changePattern():Void{
		this.shapeContainer.removeChildren();
		this.pFactory.nextPattern();
		this.menu.setPatternNumText(pFactory.getPatternNum());
		this.render(null);
	}
	// Event Listeners
	/*
	private function onButton1Click(e:MouseEvent):Void {
		cleanAndRenderAgain();
	}
	*/
	private function onGameRestart(e:Event):Void{
		this.pFactory.restart();
		cleanAndRenderAgain();
	}
	private function onGameNewPattern(e:Event):Void{
		changePattern();
	}
	private function onGamePause(e:Event):Void{
		this.menu.setPauseButtonLabel("PLAY");
		if(this.isPaused){
			this.addEventListener(Event.ENTER_FRAME,render);
			this.isPaused = false;
		}else{
			this.removeEventListener(Event.ENTER_FRAME,render);
			this.isPaused = true;
		}
	}
	private function onChangeRenderType(e:Event):Void{
		pFactory.swapRenderType();
	}
	private function onSaveImage(e:Event):Void{
		trace('onSaveImage');
		//shapeContainer

		// Ref : 
		// http://stackoverflow.com/questions/22630008/save-bitmapdata-bytearray-as-a-png-file
		// http://community.openfl.org/t/bitmapdata-encode-method-solved/560/2

		// Making a BitmapData from the Sprite
		var s:Sprite = shapeContainer;
		var r:Rectangle = new Rectangle(0,0,Std.int( s.width ),Std.int( s.height ));
		var image:BitmapData = new BitmapData( Std.int( s.width ), Std.int( s.height ), false, 0x00FF00);
		image.draw(s);

		//
		var p:PNGEncoderOptions = new PNGEncoderOptions();
		var b:ByteArray = image.encode(image.rect,p);

		var fo:FileOutput = sys.io.File.write("screen_9Patterns.png", true);
		fo.writeString(b.toString());
		fo.close();

		trace("onSaveImage : Done");

		
		// Saving the BitmapData
		//var b:ByteArray = image.encode("png", 1);
		//var fo:FileOutput = sys.io.File.write("screen_9Patterns.png", true);
		//fo.writeString(b.toString());
		//fo.close();
	}

}