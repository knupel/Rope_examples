/**
*
* Shader FX posterization
*
* Copyleft (c) 2019-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Shader
*
* Processing 4.0.2b
* v 0.0.2
*
*/

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
	
	vec3 threshold = vec3().sin_wave(frameCount,0.001,0.005,0.002);
	int num = 10;
	fx_posterization(g,true,true,threshold,num);
}
