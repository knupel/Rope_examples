/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
* Work on PGraphics;
* Processing 4.0.2b
* v 0.0.1
*
*/

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

	vec3 threshold = vec3().sin_wave(frameCount,0.001,0.005,0.002);
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
