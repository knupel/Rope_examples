/**
* Rope Framework
* v 1.0.1
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* Processing 3.5.3
* Rope library 0.7.1.25
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/

import rope.costume.R_Polygon;
void setup() {
  size(400,400,P2D);
  background(0);
  fill(255,0,0);
  create_polygon(50);
  

  beginShape();
  // for some reason the count must a countdown
  for(int i = main.get_summits()-1 ; i >= 0 ; i--) {
    vertex(main.get_final_point(i));
  }

  beginContour();
  // for some reason the count must normal
  for(int i = 0 ; i < contour.get_summits() ; i++) {
    vertex(contour.get_final_point(i));
  }
  
  endContour();
  endShape(CLOSE);
}

R_Polygon main;
R_Polygon contour;
void create_polygon(int summits) {
  main = new R_Polygon(this,summits);
  main.radius(100);
  main.pos(width/2,height/2);

  contour = new R_Polygon(this,summits);
  contour.radius(40);
  contour.pos(width/2,height/2);

  main.calc();
  contour.calc();
}


