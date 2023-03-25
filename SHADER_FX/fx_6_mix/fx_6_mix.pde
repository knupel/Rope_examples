

/**
* Rope framework
* Copyleft (c) 2014-2023
* v 0.2.0
* @author @knupel
* @see https://github.com/knupel/Rope_framework
*
*/
import rope.vector.*;
import rope.core.Rope;
Rope r = new Rope();







PImage result;
PImage img_src;
PGraphics pg;
vec3 level_mask_3;

void setup() {
	size(600,360,P2D);
	// colorMode(HSB);
	img_src = loadImage("jpg file/petite_puros_girl.jpg");
  pg = createGraphics(width, height,P2D);
  level_mask_3 = new vec3().sin_wave(frameCount, 0.03, 0.02, 0.05);
  create_graphic();
}

void create_graphic() {
  pg.beginDraw();
  pg.clear();
  pg.background(r.CYAN);
  pg.fill(r.YELLOW);
  pg.stroke(r.MAGENTA);
  pg.strokeWeight(30);
  pg.circle(width/2, height/2, height/2);
  pg.endDraw();
}

void draw() {
  // alpha
  vec3 level_src = new vec3(1);
	level_mask_3.wave(frameCount, 0.03, 0.02, 0.05).abs();

	/**
	* mix
	* v 0.1.5
	* 2019-2022
	*
	* -2 main
	* -1 layer 
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
	* 15 subtract
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
	int fx_mode = 2;

	int num_separation = (int)map(sin(frameCount * 0.1),-1,1,3,30); // the number of layer of colour separation.
	boolean on_g = false; // if you want work on g. Where "g" is a main rendering
	boolean filter_is = true; // I don't remember, what I code that. It's up to you to experiment !

	result = fx_mix(img_src, pg, 
								on_g, filter_is, 
								fx_mode, 
								level_src, level_mask_3);

	image(result);
}
