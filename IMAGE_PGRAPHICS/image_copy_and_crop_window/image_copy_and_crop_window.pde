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
