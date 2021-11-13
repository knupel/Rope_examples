/**
* Rope Framework Image copy and resize example
* v 1.0.1
* Copyleft (c) 2014-2021
* 
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
*/

PImage img_joconde, img_resize_0, img_resize_1, img_resize_2, img_copy;
int where ;

void setup() {
  size(300,700);
  where = CENTER ;
  img_joconde = loadImage("petite_joconde.jpg");
  img_resize_0 = img_joconde.copy();
  img_resize_1 = img_joconde.copy();
  img_resize_2 = img_joconde.copy();
  image_resize(img_resize_0);
  image_resize(img_resize_1,150,150,true);
  image_resize(img_resize_2,150,150,false);
  img_copy = image_copy_window(img_resize_0,where).copy();
}

void draw() {
  image(img_resize_0,where);
  image(img_resize_1);
  image(img_resize_2,0,img_resize_1.height);
  image(img_copy, mouseX, mouseY);
}
