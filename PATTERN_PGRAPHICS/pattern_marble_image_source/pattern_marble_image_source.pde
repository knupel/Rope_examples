/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/

/**
* pattern marble example
* 2021-2021
* v 0.1.0
*
* based on Lode Vandevenne algorithm
* https://lodev.org/cgtutor/randomnoise.html
*
* methods
* void init_pattern();
* void reset_pattern();
* void set_pattern_no_angle();
* void set_pattern_no_increment();
* void set_pattern_no_smooth();
* setting
* void set_pattern_turbulence(float turbulence) ;
* void set_pattern_size(int w, int h);
* void set_pattern_range(float min, float max);
* void set_pattern_increment(float inc);
* void set_pattern_increment(float x, float y, float z);
* void set_pattern_smooth(float smooth);
* void set_pattern_angle(float a_x, float a_y, float a_z);
* void set_pattern_period(float x, float y);
* build
* PGraphics pattern_rand(int w, int h);
* PGraphics pattern_rand_xyz(int w, int h);
* PGraphics pattern_noise(int w, int h);
* PGraphics pattern_noise_xyz(int w, int h);
* PGraphics pattern_img(PImage src, int w, int h);
* PGraphics pattern_marble_brightness(PImage src, int w, int h);
* PGraphics pattern_marble_rgb(PImage src, int w, int h);
* PGraphics pattern_marble_hsb(PImage src, int w, int h);
* PGraphics pattern_marble(int w, int h);
*
*/


PGraphics pattern_marble;
PImage img_src;
// x_period and y_period together define the angle of the lines
// x_period and y_period both 0 ==> it becomes a normal clouds or turbulence pattern
float x_period = 5.0; //defines repetition of marble lines in x direction
float y_period = 10.0; //defines repetition of marble lines in y direction

// turb_power = 0 ==> it becomes a normal sine pattern
float turb_power = 5.0; //makes twists
float smooth = 32.0; //initial size of the turbulence


void setup() {
	size(800,512);
	colorMode(HSB,360,100,100,100);
	rope_version();
	img_src = loadImage("jpg file/small_dame_hermine.jpg");
	surface.setSize(img_src.width, img_src.height);
	pattern_marble = pattern_marble_brightness(img_src, width,height);
	image(pattern_marble);
}

void draw() {}

void mousePressed() {
	x_period = random(0,10);
	y_period = random(0,10);
	turb_power = random(0,10.0);
	smooth = random(0,64.0);
	set_pattern_smooth(smooth);
	set_pattern_turbulence(turb_power);
	set_pattern_period(x_period,y_period);

	float which_one = random(1);
	if(which_one < 0.3) {
		println("pattern_marble is brightness mode");
		pattern_marble = pattern_marble_brightness(img_src, width,height);
	} else if(which_one >=0.3 && which_one < 0.6) {
		println("pattern_marble is RGB mode");
		pattern_marble = pattern_marble_rgb(img_src, width,height);
	} else {
		println("pattern_marble is HSB mode");
		pattern_marble = pattern_marble_hsb(img_src, width,height);
	}
	println("x_period", x_period);
	println("y_period", y_period);
	println("turbulence", turb_power);
	println("smooth", smooth);
	image(pattern_marble);
}
