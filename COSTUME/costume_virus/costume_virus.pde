/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
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

  
  virus_mutation(2);
  virus_node(4);
  virus_num(36);
  costume(pos,size,dir,VIRUS);
}
