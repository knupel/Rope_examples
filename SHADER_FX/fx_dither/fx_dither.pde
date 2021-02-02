/**
* Shader FX laboratory
* v 0.0.1
* Copyleft (c) 2019-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Shader
* 
* note:
* Processing 3.5.3
* Rope library 0.8.3.28 
*/

PImage img_a;
void setup() {
	size(640,480,P2D);
	img_a = loadImage("medium_puros_girl.jpg");
	surface.setSize(img_a.width,img_a.height);
}


int mode = 0; // rgb
vec3 level = new vec3(0.5);
void draw() {
	background(r.WHITE);

	image(img_a);
	
	if(!mousePressed) {
	  mode = 0; // rgb 
	} else {
		mode = 3; // hsb
	}
	
	if(keyPressed)
		level = abs(vec3().sin_wave(frameCount,0.01,0.02,0.03));

	fx_dither_bayer_8(g,true,true, level, mode);
}
