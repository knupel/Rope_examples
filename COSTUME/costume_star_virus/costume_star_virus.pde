/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


void setup() {
  size(500,500,P3D);
  // frameRate(1000);

}


vec3 dir = vec3();
void draw() {
  background_rope(0);
  vec3 pos = vec3(width/2,height/2,0);
  vec3 size = vec3(200,200,40);
  dir.add(.01,.02,.05);
  int fill = color(255,0,0,25);
  int stroke = color(255,0,0);
  float thickness =1;
  aspect(fill,stroke,thickness);
  //costume(pos,size,dir,STAR_ROPE);
  star_summits(36);
  // set_costume_star_angle(0);
  star_ratio(.1,.2,.3,.4,.5,.6,.7,.8,.9);

  Costume c = new Costume(STAR_3D_ROPE);
  costume(pos,size,dir,c);
  // costume(pos,size,dir,STAR_3D_ROPE);
  /*
  virus_mutation(2);
  virus_node(4);
  virus_num(36);
  costume(pos,size,dir,VIRUS_ROPE);
  */

}














