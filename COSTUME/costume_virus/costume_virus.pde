/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

/**
 * Virus exemple use with costume
 * it's very buggy... like a the coronavirus
 * 2019-2021
 * v 0.2.0
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

  costume(pos,size,dir,r.VIRUS);

	aspect(r.BLANC,r.GREEN,3.0);
	R_Costume virus = new R_Costume(this,r.VIRUS);
	virus.set_summits(60);
	costume(pos,size,dir,virus);
}
