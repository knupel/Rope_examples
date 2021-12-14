/**
* Shader FX laboratory
* Copyleft (c) 2019-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Shader
* 
* Processing 4.0.2b
* v 0.0.2
*/

PImage img_a;
void setup() {
	size(640,480,P2D);
	init_rope();
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
	  ivec2 pix_size = ivec2(5);
	  int num_colour = 5;
	  vec3 level = abs(vec3().sin_wave(frameCount,0.01,0.02,0.03));
	  boolean effect = true ;
	  if(keyPressed) effect = false;
	  fx_pixel(g,true,true,pix_size,num_colour,level,effect);
	}
}
