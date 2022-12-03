/**
* Copyleft (c) 2019-2022
* @author @knupel
* @see https://github.com/knupel/Shader
* 
* Processing 4.0.2b
*/

import rope.vector.*;
import rope.core.Rope;
Rope r = new Rope();

PImage img_a;
void setup() {
	size(640,480,P2D);
	img_a = loadImage("medium_puros_girl.jpg");
	surface.setResizable(true);
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
		level = r.abs(new vec3().sin_wave(frameCount,0.01,0.02,0.03));

	fx_dither_bayer_8(g,true,true, level, mode);
}
