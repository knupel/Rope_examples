/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
*/

void setup() {
  size(400,400,P3D) ;
  // colorMode(HSB, 360, 100, 100, 100) ;
  // load_costume_pic("pirate.png") ;
  // load_costume_pic("pirate.svg") ;
 //  print_list_costume() ;
}


int which_costume ;
float angle ;
void draw() {
  background(0) ;
  stroke(255, 0,0) ;
  strokeWeight(2) ;
  fill(255,0,0) ;


  Vec3 pos = Vec3(mouseX, mouseY, 0) ;
  Vec2 size = Vec2(100) ;
  int summits = 12 ;
  angle += .01 ;
  star(pos, size, summits, angle, 2., .5, 1., .5, 1., .5) ;

  // star(pos, size, summits, 2., .5, 1., .5, 1., .5) ;
  // costume_rope(Vec3(width/2, height/2, 1), 50, SUPER_STAR_8_ROPE) ;

  // costume_rope(Vec3(mouseX, mouseY, 1), 50, VIRUS_3_8_1_ROPE) ;
  // costume_rope(pos, size_x, -1) ;
  /*
  Vec2 pos_a = Vec2(mouseX, mouseY) ;
  Vec3 size = Vec3(60, 60, -30) ;
  int node = 3 ;
  int num = 10 ;
  int speed = 3 ;
  virus(pos_a, size, node, num) ;
  Vec2 pos_b = Vec2(width/2, height/2) ;
  angle += .01 ;
  // virus(pos_b, size, node, num, angle) ;
  virus(pos_b, size, node, num, angle) ;
  */


  
}



































