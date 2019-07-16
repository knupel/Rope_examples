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
PGraphics other;

void setup() {
  size(600,600,P2D);
  other = createGraphics(width,height,P2D);
  origin = vec2();
  destination = vec2();

  tempo(10,20,5);
  alpha_line2D(1,0);
  palette(r.VERT,r.JAUNE,r.ROUGE); // this method take the lead on stroke
  
  beginDraw(other);
  background(r.BLACK,other);
  endDraw(other);
  image(other);
}

void draw() {
  
  println(frameRate);

  origin.x(width/2);
  origin.y(height/2);

  //boolean update_pixel_is = false;
  boolean update_pixel_is = true;
  // it's faster to load and update pixels outside when there is a lot line, 
  // but it's can be good to update inside  for some moirring effect.
  
  // boolean aa_is = false; // no antialiasing
  boolean aa_is = true; // antialising 

  beginDraw(other);
  background(r.BLACK,other);
  
  float radius = map(mouseX,0,width,width/10,width/3);
  int num = 1000;
  float step = TAU / num;
  for(int i = 0 ; i < num ; i++) {
    float dir =  i *step ;
    float ndx = sin(dir);
    float ndy = cos(dir);
    destination = vec2(ndx,ndy).mult(radius).add(origin);
    line2D(origin.x(),origin.y(),destination.x(),destination.y(),aa_is,update_pixel_is,other);
  }
  
  
  
  // directional
  destination.x(mouseX);
  destination.y(mouseY);
  if(origin != null && destination != null) {
    line2D(origin.xy(),destination.xy(),aa_is,update_pixel_is,other);
  }
  
  endDraw(other);
  image(other);
}
