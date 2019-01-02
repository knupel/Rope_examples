/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
*/

Motion motion  ;
Vec2 pos ;

void setup() {
	size(400,400) ; 
	pos = Vec2(width/2, height/2) ;
  float max_speed = 6 ;
  motion = new Motion(max_speed) ;
}

void draw() {
	  background(0) ;
  Vec2 lead_pos = Vec2(mouseX,mouseY) ;
  Vec2 new_pos = motion.leading(lead_pos, pos) ;
  pos.set(new_pos) ;
  ellipse(pos, Vec2(10)) ;

}




void keyPressed() {

}
























