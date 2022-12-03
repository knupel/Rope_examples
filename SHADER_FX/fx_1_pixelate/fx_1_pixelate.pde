/**
* Shader FX laboratory
* Copyleft (c) 2019-2022
* @author @knupel
* @see https://github.com/knupel/Shader
* 
* Processing 4.0.2b
* v 0.1.0
*/
import rope.vector.*;
import rope.core.Rope;
Rope r = new Rope();


PImage img_a;
void setup() {
	size(640,480,P2D);
	// img_a = loadImage("damier_medium.jpg");
	img_a = loadImage("medium_puros_girl.jpg");
	surface.setResizable(true);
}

void draw() {
	if(img_a.width != width || img_a.height != height) {
		surface.setSize(img_a.width,img_a.height);
	}

	background(r.WHITE);

	image(img_a);
	
	if(mousePressed) {
	  ivec2 pix_size = new ivec2(5);
	  int num_colour = 5;
	  vec3 level = r.abs(new vec3().sin_wave(frameCount,0.01,0.02,0.03));
	  boolean effect = true ;
	  if(keyPressed) effect = false;
	  fx_pixel(g,true,true,pix_size,num_colour,level,effect);
	}
}
