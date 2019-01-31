/**
* PROJECTION 3D
* @see https://github.com/StanLepunK/Rope_examples
2016-2019
*/
void setup() {
  size(500,500,P3D);
}


float speed = .01;
float proj_angle;
float dir_angle;
void draw() {
  background(0) ;
  float orientation = PI/2;
  
  vec3 pos_center = vec3(width/2, height -height/4,0);
  proj_angle += speed;
  // dir_angle -= speed ;
  dir_angle = -1 *proj_angle + orientation;
  println(proj_angle,dir_angle);
  int radius = 100;
  vec2 pos_XY = projection(proj_angle,radius);
  vec3 pos_XYZ = vec3(pos_XY.x,0,pos_XY.y);
  vec3 final_pos = add(pos_center,pos_XYZ);
  
  vec3 size = vec3(50,50,100);
  // show
  noFill();
  stroke(255);
  /*
  start_matrix() ;
  translate(final_pos) ;
  rotateY(dir_angle) ;
  box(size) ;
  stop_matrix() ;
  */
  costume_rotate_y();
  costume(final_pos,size,dir_angle,RECT_ROPE);
}