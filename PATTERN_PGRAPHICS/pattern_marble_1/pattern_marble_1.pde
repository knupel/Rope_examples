/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
*/

/**
* pattern marble example 2
* 2021-2021
* v 0.0.4
*
* from Lode Vandevenne algorithm
* https://lodev.org/cgtutor/randomnoise.html
*
* methods
*
* matrice_marble(int w, int h);
* float [][] generate_matrix_2D(int w, int h, float min, float max): // the min and max value must be normal [0,1]
* PGraphics pattern_marble(int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale);
* PGraphics pattern_marble(float [][] mat2D, int w, int h, float x_period, float y_period, float turb_power, float turb_size, int turbulence, float scale)
*/


PGraphics pattern_marble;
// x_period and y_period together define the angle of the lines
// x_period and y_period both 0 ==> it becomes a normal clouds or turbulence pattern
float x_period = 5.0; //defines repetition of marble lines in x direction
float y_period = 10.0; //defines repetition of marble lines in y direction

// turb_power = 0 ==> it becomes a normal sine pattern
float turb_power = 5.0; //makes twists
float turb_size = 32.0; //initial size of the turbulence

int turbulence = 2;
float scale = 3.0;

int detail = 3;


void setup() {
	size(800,512,P2D);
	colorMode(HSB,360,100,100,100);
	rope_version();
	background(r.RED);
	float [][] mat2D = generate_matrix_2D(128, 128, 0, 1);
	pattern_marble = pattern_marble(mat2D, width,height, x_period, y_period, turb_power, turb_size, turbulence, scale);
	image(pattern_marble);
}

void draw() {}

void mousePressed() {
	background(r.RED);
	
	int width_mat = floor(random(1,width));
	int height_mat = floor(random(1,height));
	float min_val = random(1);
	float max_val = random(min_val,1);

	println("x_period", x_period);
	println("y_period", y_period);
	println("turb_power", turb_power);
	println("turb_size", turb_size);
	println("turbulence", turbulence);
	println("scale", scale);
	println("width_mat", width_mat);
	println("height_mat", height_mat);
	println("min_val", min_val);
	println("max_val", max_val);

	float [][] mat2D = generate_matrix_2D(width_mat, height_mat, min_val, max_val);
	pattern_marble = pattern_marble(mat2D, width,height, x_period, y_period, turb_power, turb_size, turbulence, scale);
	image(pattern_marble);
}
