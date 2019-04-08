/**
* Rope Framework
* v 1.0.1
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* Processing 3.5.3
* Rope library 0.5.1
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/

PImage img_puros_girl,img_joconde, img_resize ;

void setup() {
	size(960, 140);
  //fullScreen(P2D) ;
  img_joconde = loadImage("petite_joconde.jpg");
  img_puros_girl = loadImage("petite_puros_girl.jpg");
  img_resize = img_joconde.copy();
 // img_resize = img_puros_girl.copy();
  /*
  img_1 = loadImage("RioCarnaval.jpg");
  img_1 = loadImage("banc_public.jpg");
  */
}

void draw() { 
 //  image_resize(img_resize);
 //image_resize(img_resize,false);
 image_resize(img_resize,g,true);
 image(img_resize, LEFT);
 //image(img_puros_girl);
}
