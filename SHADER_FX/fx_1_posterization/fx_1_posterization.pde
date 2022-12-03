/**
*
* Shader FX posterization
*
* Copyleft (c) 2019-2022
* @author @knupel
* @see https://github.com/knupel/Shader
*
* Processing 4.0.2b
* v 0.1.0
*
*/
import rope.vector.*;
import rope.core.Rope;
Rope r = new Rope();

PImage img_a;
void setup() {
	size(640,480,P2D);
	// img_a = loadImage("damier_medium.jpg");
	img_a = loadImage("medium_puros_girl.jpg");
}


void draw() {
	if (img_a.width != width || img_a.height != height) {
    surface.setResizable(true);
    surface.setSize(img_a.width, img_a.height);
    surface.setResizable(false);
	}
	image(img_a);
	
	vec3 threshold = new vec3().sin_wave(frameCount,0.001,0.005,0.002);
	int num = 10;
	fx_posterization(g,true,true,threshold,num);
}
