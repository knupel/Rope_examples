/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

/**
* Rope framework
* Copyleft (c) 2014-2022
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

PImage result;
PImage img;

void setup() {
	size(800,600,P2D);
	frameRate(12);
	surface.setResizable(true);
	rope_version();
	// various image with different size
	img = loadImage("jpg file/petite_puros_girl.jpg");
	surface.setSize(img.width, img.height);
}



void draw() {
	background(r.WHITE);
	float min = map(mouseY, 0, height, 0, -0.3);
	float max = map(mouseX, 0, width, 0, 0.3);
	println("range",min,max);
	vec4 cardinal = map(vec4().sin_wave(frameCount,0.01,0.02,0.03,0.04), -1, 1, min, max); // var from - 1 to 1
	result = fx_glitch_fxaa(img, false, true, cardinal);

	image(result);
}
