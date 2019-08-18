/**
* Rope Framework
*
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* dependancies
* Processing 3.5.3.269
* Rope library 0.8.5.30
* Rope framework 1.1.4
*/



/**
* comparaison with glsl methode
*/
void setup() {
  size(300,300,P2D);
  vec2 a = vec2(-1,1);
  bvec2 less_zero = lessThan(a,vec2(0));
  bvec2 greater_canvas = greaterThan(a,vec2(width,height));
  println("less",less_zero);
  println("greater",greater_canvas);
  println("all less",all(less_zero));
  println("all greater",all(greater_canvas));
  println("any less",any(less_zero));
  println("any greater",any(greater_canvas));
}













