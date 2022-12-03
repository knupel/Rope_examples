/**
* Rope framework
* Copyleft (c) 2014-2022
* @author @knupel
* @see https://github.com/knupel/Rope_framework
*
* Work on PGraphics;
* Processing 4.0.2b
* v 0.1.0
*
*/
import rope.vector.*;
import rope.core.Rope;
Rope r = new Rope();

PImage img_a;
PGraphics pg;
void setup() {
	size(640,480,P2D);
	img_a = loadImage("petite_puros_girl.jpg");
}


void draw() {
	if (img_a.width != width || img_a.height != height) {
		pg = createGraphics(img_a.width, img_a.height,P2D);
		surface.setResizable(true);
		surface.setSize(img_a.width, img_a.height);
		surface.setResizable(false);
	}
	pg.beginDraw();
	pg.image(img_a,0,0);
	pg.endDraw();

	vec3 threshold = new vec3().sin_wave(frameCount,0.001,0.005,0.002);
	int num = 10;
	pass_render(pg, fx_posterization(pg,false,false,threshold,num));
	image(pg);
}

void pass_render(PGraphics original, PGraphics buf) {
	original.loadPixels();
	buf.loadPixels();
	original.pixels = buf.pixels;
	original.updatePixels();
}
