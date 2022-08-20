/**
* Rope Framework
* mix shader filter
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
* Work on PGraphics;
* Processing 4.0.2b
* v 0.0.1

* mode
* -2 main > show main
* -1 layer > show layer
* 0 ?
* 1 multiply
* 2 screen
* 3 exclusion
* 4 overlay
* 5 hard_light
* 6 soft_light
* 7 color_dodge
* 8 color_burn
* 9 linear_dodge
* 10 linear_burn
* 11 vivid_light
* 12 linear_light
* 13 pin_light
* 14 hard_mix
*  15 subtract
* 16 divide
* 17 addition
* 18 difference
* 19 darken
* 20 lighten
* 21 invert
* 22 invert_rgb
* 23 main
* 24 layer
*/


PImage img_a, img_b;
PGraphics pg_a, pg_b;
PGraphics pg_final;
void setup() {
	size(600,375,P2D);
	img_a = loadImage("petite_puros_girl.jpg");
	img_b = loadImage("petite_leticia.jpg");
	pg_a = createGraphics(width, height,P2D);
	pg_b = createGraphics(width, height,P2D);
	pg_final = createGraphics(width, height,P2D);
}


void draw() {
	pg_a.beginDraw();
	pg_a.image(img_a,0,0);
	pg_a.endDraw();

	pg_b.beginDraw();
	pg_b.image(img_b,0,0);
	pg_b.endDraw();

	vec3 level_src = vec3().sin_wave(frameCount,0.001,0.005,0.002);
	vec3 level_dst = vec3().sin_wave(frameCount,0.002,0.003,0.004);
	int mode = 3;
	pass_render(pg_final, fx_mix(pg_a,pg_b,false,false,mode, level_src, level_dst));
	image(pg_final);
}

void pass_render(PGraphics original, PGraphics buf) {
	original.loadPixels();
	buf.loadPixels();
	original.pixels = buf.pixels;
	original.updatePixels();
}
