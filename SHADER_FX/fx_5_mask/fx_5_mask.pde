

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
PImage img_a, img_b;

vec2 threshold_mask = new vec2(0,1);
vec4 level_mask = new vec4(1);


void setup() {
	size(600,360,P2D);
	img_a = loadImage("jpg file/petite_puros_girl.jpg");
	img_b = loadImage("jpg file/damier_petit_gradient.jpg");
}



void draw() {
	background(r.WHITE);

	threshold_mask.set(0,1); // the range where your mask work from 0 to 1, I don't understand well my goal when I code that :)

	float x = map(sin(frameCount * 0.1),-1,1,0,1);
	float y = map(sin(frameCount * 0.01),-1,1,0,1);
	float z = map(sin(frameCount * 0.02),-1,1,0,1);
	float a = map(sin(frameCount * 0.03),-1,1,0,1);
	level_mask.set(x,y,z,a); // the level work for each color argument work rgbA or hsba depend of you space color if I rember well.

	int fx_mask_mode = 0 ; // 0 is gray 1 is RGB


	int num_separation = (int)map(sin(frameCount * 0.1),-1,1,3,30); // the number of layer of colour separation.
	boolean on_g = false; // if you want work on g. Where "g" is a main rendering
	boolean filter_is = true; // I don't remember, what I code that. It's up to you to experiment !

	result = fx_mask(img_a, img_b, 
									on_g, filter_is, 
									fx_mask_mode, 
									num_separation, 
									threshold_mask, level_mask);

	image(result);
}
