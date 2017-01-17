Motion motion  ;
Vec2 pos ;
void setup() {
  // size(400,400) ; 
  fullScreen() ;
  pos = Vec2(width/2, height/2) ;
  float max_speed = 6 ;
  motion = new Motion(max_speed) ;
  /*
  motion.set_acceleration(.1) ;
  motion.set_deceleration(.01) ;
  motion.acceleration_is(false) ;
  motion.deceleration_is(false) ;
  */

 
}



void draw() {
  background(0) ;
  Vec2 lead_pos = Vec2(mouseX,mouseY) ;
  Vec2 new_pos = motion.leading(lead_pos, pos) ;
  pos.set(new_pos) ;
  ellipse(pos, Vec2(10)) ;
}


