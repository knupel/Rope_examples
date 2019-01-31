/**
LEADING
* @see https://github.com/StanLepunK/Rope_examples
2018-2019
*/

Motion motion;
vec2 pos;

void setup() {
	size(400,400); 
	pos = vec2(width/2,height/2);
  float max_speed = 6;
  motion = new Motion(max_speed);
}

void draw() {
	background(0);
  vec2 lead_pos = vec2(mouseX,mouseY);
  vec2 new_pos = motion.leading(lead_pos,pos);
  pos.set(new_pos);
  ellipse(pos,vec2(10));
}



























