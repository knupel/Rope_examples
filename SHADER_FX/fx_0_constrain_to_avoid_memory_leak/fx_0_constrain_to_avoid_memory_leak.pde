
/**
* Rope framework
* Copyleft (c) 2014-2022
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
* 
* 
* example to show a simple FX shader filter using with bunch of images with different size
* and avoir a memory leak *****
* 
* 
*/

PImage result;
PImage [] img;

vec2 threshold_mask = new vec2(0,1);
vec4 level_mask = new vec4(1);


void setup() {
	size(300,400,P2D);
	frameRate(12);
	surface.setResizable(true);
	rope_version();
	// various image with different size
	img = new PImage[6];
	img[0] = loadImage("jpg file/petite_puros_girl.jpg");
	img[1] = loadImage("jpg file/damier_petit_gradient.jpg");
	img[2] = loadImage("jpg file/small_dame_hermine.jpg");
	img[3] = loadImage("jpg file/square_dame_hermine.jpg");
	img[4] = loadImage("jpg file/petite_joconde.jpg");
	img[5] = loadImage("jpg file/pirate_small.jpg");

	/**
	 * 
	 ***** WARNING ********
	 * 
	 * to center the rendering on the window and avoir the memory leaks
	 * to see what's happen open soft can check the computer memory
	 * and change the method to 
	 * fx_constrain_is(false);
	 * 
	 * */
	 fx_constrain_is(true);

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

	int index_a = floor(random(6));
	int index_b = floor(random(6));
	result = fx_mask(img[index_a], img[index_b], 
									on_g, filter_is, 
									fx_mask_mode, 
									num_separation, 
									threshold_mask, level_mask);

	image(result);
}




