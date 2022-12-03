/**
* Rope framework
* Copyleft (c) 2014-2022
* @author @knupel
* @see https://github.com/knupel/Rope_framework
*
* fx exemple without image
* v 0.1.0
*
*/
import rope.vector.*;
import rope.core.Rope;
Rope r = new Rope();

PImage img_a;
void setup() {
	size(600,600,P2D);
}


int mode = 0; // rgb
vec3 level = new vec3(0.5);
void draw() {
	background(r.WHITE);
	int diam = height/4;

	fill(r.BLOOD);
	ellipse(mouseX,mouseY,diam,diam);
	fill(r.OUTREMER);
	ellipse(mouseY,mouseX,diam,diam);
	fill(r.YELLOW);
	ellipse(width - mouseX, height - mouseY,diam,diam);
	fill(r.GREEN);
	ellipse(width - mouseY, height -mouseX,diam,diam);
	
	if(mousePressed) {
	  mode = 0; // rgb 
	} else {
		mode = 3; // hsb
	}
	
	if(keyPressed)
		level = r.abs(new vec3().sin_wave(frameCount,0.01,0.02,0.03));

	boolean on_g_is = true;
	boolean filter_is = true;
	fx_dither_bayer_8(g, on_g_is, filter_is, level, mode);
}
