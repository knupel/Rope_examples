/**
FOLLOW
* @see https://github.com/StanLepunK/Rope_examples
2018-2019
*/
void setup() {
  size(400,400) ;
  background(0) ;

}


void draw() {
  background(0);
  
  // compute
  vec2 target = vec2(mouseX, mouseY);
  vec2 origin =  vec2(width/2, height/2);
  vec2 dir = look_at(target,origin);
  float theta = dir.angle() +HALF_PI;
  
  //display
  stroke(255);
  line(target, origin);
  primitive(origin, 20., 3, theta);
}




