import nme.display.Sprite;
import nme.display.Shape;
import nme.display.StageScaleMode;
import nme.geom.Matrix;
import nme.Lib;

import tweenx909.TweenX;
import tweenx909.EaseX;
using tweenx909.ChainX;

class Main extends Sprite {
	static inline var CELL_SIZE = 20;
	public function new() {
		super();
		Lib.current.stage.scaleMode = StageScaleMode.SHOW_ALL;
		
		//Draw background
		graphics.lineStyle( 1, 0xEEEEEE );
		var end = CELL_SIZE * 20;
		for ( i in 0...21 ) {
			var p = i * CELL_SIZE;
			graphics.moveTo( 0, p );
			graphics.lineTo( end, p );
			graphics.moveTo( p, 0 );
			graphics.lineTo( p, end );
		}
		
		//Make square
		var square1 = new Square( CELL_SIZE * 2 );
		var square2 = new Square( CELL_SIZE * 2 );
		var square3 = new Square( CELL_SIZE * 2 );
		
		addChild( square1 );
		addChild( square2 );
		addChild( square3 );
		
		square1.y = CELL_SIZE * 5;
		square2.y = CELL_SIZE * 9;
		square3.y = CELL_SIZE * 13;
		
		//Tween!!
		TweenX.serial([
			TweenX.to( square1 ).x( 360 ).time( 0.4 ).ease( EaseX.quartOut ).repeat( 3 ),
			TweenX.to( square2 ).x( 360 ).time( 0.4 ).ease( EaseX.quartOut ).repeat( 5 ).yoyo(),
			TweenX.to( square3 ).x( 360 ).time( 0.4 ).ease( EaseX.quartOut ).repeat( 5 ).zigzag(),
		]).repeat().interval( 0.4 );
	}
}

private class Square extends Shape {
	public function new( size:Float ) {
		super();
		
		graphics.beginFill( 0x335F73 );
		graphics.drawRect( 0, 0, size, size );
	}
}