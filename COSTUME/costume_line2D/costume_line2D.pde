/**
* Line2D on pgraphics
*
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* work with
* Rope frame Work 1.1.3
* Processing 3.5.3
* Rope library 0.8.3.28
*/


vec2 origin;
vec2 destination;

void setup() {
  size(600,600,P2D);
  background(0);
  origin = vec2();
  destination = vec2();
  
  // create pattern line
  tempo(10,20,5);
  alpha_line2D(1,0);
  palette(r.VERT,r.JAUNE,r.ROUGE); // this method take the lead on stroke
}


void draw() {
  println(frameRate);

  origin.x(width/2);
  origin.y(height/2);

  boolean update_pixel_is = true;
  //boolean update_pixel_is = true;
  // it's faster to load and update pixels outside when there is a lot line, 
  // but it's can be good to update inside for some moirring effect.
  
  // boolean aa_is = false; // no antialiasing
  boolean aa_is = false; // antialising 

  // loadPixels();
  // directional
  destination.x(mouseX);
  destination.y(mouseY);
  if(origin != null && destination != null) {
    line2D(origin.xy(),destination.xy(),aa_is,update_pixel_is);
  }
  // updatePixels();
}

void keyPressed() {
  background(r.BLACK);
}
