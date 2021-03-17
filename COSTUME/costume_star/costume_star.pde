/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

/**
* STAR example
*/


void setup() {
  size(500,500,P3D);
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
  star_ratio(.1,.2,.3,.4,.5,.6,.7,.8,.9);
  Costume c = new Costume(this,STAR_3D);
  costume(pos,size,dir,c);


  star_ratio(0.1f,2.0f);
  aspect(r.WHITE,r.WHITE,thickness);
  costume(pos,size,dir,STAR_3D);
}
