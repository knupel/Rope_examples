
void setup() {
  size(400,400) ;
  background(0) ;

}


void draw() {
  background(0);
  
  // compute
  Vec2 target = Vec2(mouseX, mouseY);
  Vec2 origin =  Vec2(width/2, height/2);
  Vec2 dir = look_at(target, origin);
  float theta = dir.angle() +HALF_PI;
  
  //display
  stroke(255);
  line(target, origin);
  primitive(origin, 20., 3, theta);
}




