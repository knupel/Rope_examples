/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
/**
* Example to useshader effect on picture, to do that you need to pass by a PGraphics system
*/
PImage img_1, img_2, img_3 ;

void setup() {
  size (100,100,P2D) ;
  frameRate(180);
  img_1 = loadImage("banc_public_small.jpg");
  img_2 = loadImage("puros_girl_small.jpg");
  img_3 = loadImage("pirate_small.jpg");
  surface.setSize(img_1.width, img_1.height);

  shader_rope_setup();
}


void draw() {
  background(0);
  println(frameRate);
   
  float ratio_x = abs(sin(frameCount * .001));
  float ratio_y = abs(cos(frameCount * .002));
  float ratio_z = abs(sin(frameCount * .005));
 
  overlay(img_2, img_3, ratio_x, ratio_y, ratio_z);
  image(img_2);
}