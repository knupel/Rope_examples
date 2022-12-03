/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
* work with

* Processing 3.5.3.269
* Rope library 0.8.5.30
* Rope frame Work 1.1.5.51
*
* image collection
* v 0.2.1
* 2017-2022
*/
import rope.image.R_Image_Manager;
import rope.image.R_Image;


R_Image_Manager collection;
PGraphics buffer;

void setup() {
  size(100,100,P2D);
  rope_version();
  collection = new R_Image_Manager(this);  
  // 
  collection.load("jpg file/petite_puros_girl.jpg", "jpg file/pirate_small.jpg","jpg file/pirate_small.jpg");
  PImage img = loadImage("jpg file/banc_public_small.jpg");
  collection.add(img,"new image");
  surface.setSize(collection.get(0).width(),collection.get(0).height());

}

void draw() {
  // if you get an R_Image use get(int index) instead get_PImage(int index);
  if(mousePressed) {
    R_Image img = collection.rand();
    println(img.get_id(),img.get_name());
    background(img.get_PImage());
  } else {
    background(collection.get_PImage(0));
  }
}
