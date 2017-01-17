void setup() {
  size(500,500, P3D) ;
}


float speed = .01 ;
float proj_angle ;
float dir_angle ;
void draw() {
  background(0) ;
  float orientation = PI/2 ;
  
  Vec3 pos_center = Vec3(width/2, height -height/4, 0) ;
  proj_angle += speed ;
  // dir_angle -= speed ;
  dir_angle = -1 *proj_angle + orientation ;
  println(proj_angle, dir_angle) ;
  int radius = 100 ;
  Vec2 pos_XY = projection(proj_angle, radius) ;
  Vec3 pos_XYZ = Vec3(pos_XY.x, 0, pos_XY.y) ;
  Vec3 final_pos = add(pos_center, pos_XYZ) ;
  
  Vec3 size = Vec3(50, 50, 100) ;
  // show
  noFill() ;
  stroke(255) ;
  /*
  start_matrix() ;
  translate(final_pos) ;
  rotateY(dir_angle) ;
  box(size) ;
  stop_matrix() ;
  */
  costume_rotate_y() ;
  costume_rope(final_pos, size, dir_angle, RECT_ROPE) ;
}