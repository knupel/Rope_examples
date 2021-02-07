/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/

/**
* patern noise example
* 2019-2021
* 0.2.0
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
*/
PGraphics pg_1,pg_2, pg_3;
int size;
void setup() {
	size(450,150);
	size = width/2;
	set_pattern_size(150,150);

	generate_pattern();
}


void draw() {
	image(pg_1);
	image(pg_2,width/3,0);
	image(pg_3,width -(width/3),0);
}

void mousePressed() {
	generate_pattern();
}


void generate_pattern() {
	set_pattern_increment(random(0,1)/10,random(0,1)/10,random(0,1)/10);
	pg_1 = pattern_noise(size,size);
	set_pattern_no_angle();
	pg_2 = pattern_noise_xyz(size,size);
	set_pattern_angle(random(-PI,PI),random(-PI,PI),random(-PI,PI));
	pg_3 = pattern_noise_xyz(size,size);
}
