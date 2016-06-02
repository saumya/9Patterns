//
package game;

import openfl.display.Sprite;
import openfl.display.Graphics;

class GBackground extends Sprite {
	function new(newwidth:Float,newHeight:Float){
		super();
		draw(newwidth,newHeight);
	}

	private function draw(newWidth:Float,newHeight:Float):Void{
		trace('draw');
		var c:UInt = 0xCCCCCC;
		var padding:UInt = 10;

		var g:Graphics = this.graphics;
		g.beginFill(c,1.0);
		g.drawRect(padding,padding,newWidth-(padding*2),newHeight-(padding*2));
		g.endFill();
	}

	public function reDraw(newWidth:Float,newHeight:Float):Void{
		trace('reDraw');
		this.graphics.clear();
		draw(newWidth,newHeight);
	}
	
}