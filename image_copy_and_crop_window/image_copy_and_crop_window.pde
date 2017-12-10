/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
*/

PImage img_joconde, img_resize, img_copy ;
int where ;

void setup() {
  size(300,700);
  where = CENTER ;
  img_joconde = loadImage("petite_joconde.jpg");
  img_resize = img_joconde.copy();
  image_resize(img_resize);
  img_copy = image_copy_window(img_resize,where).copy();
}

void draw() {
 image(img_resize,where);
 image(img_copy, mouseX, mouseY);
}


























