/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
*/

PImage img_puros_girl,img_joconde, img_resize ;

void setup() {
	size(960, 140);
  //fullScreen(P2D) ;
  img_joconde = loadImage("petite_joconde.jpg");
  img_puros_girl = loadImage("petite_puros_girl.jpg");
  // img_resize = img_joconde.copy();
  img_resize = img_puros_girl.copy();
  /*
  img_1 = loadImage("RioCarnaval.jpg");
  img_1 = loadImage("banc_public.jpg");
  */
}

void draw() { 
 image_resize(img_resize);
 image(img_resize, BOTTOM);
 //image(img_puros_girl);
}
























