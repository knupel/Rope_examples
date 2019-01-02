Path path ;

float speed = .5 ; // speed of the ball
// Vec3 pos = Vec3(-1)  ; // to initialize the position


void setup() {
  size(400,400) ; 
  background(255) ; 

  path = new Path() ;
  
   //fllw.Path() ; // add point to the path example
   //fllw.readFileToThePath() ; // add point from file.txt
  
}


boolean direction ; 
void draw() {
  background(255) ;
   show_path() ; // draw the path
   if(keyPressed) {
    direction = true ;
   } else {
    direction = false ;
   }
  

  path.set_velocity(map(mouseX,0,width,0,5)) ;
  if(direction) path.previous() ; else path.next() ;
  Vec3 pos = path.get_pos().add(jitter_3D(1)) ;
  figure(pos) ; // example shape who must follow the path
}
// example shape who must follow the path
void figure(Vec3 pos)  {
  noFill() ;
  ellipse(pos, Vec2(50)) ;
}


void show_path() {
  fill(255,25,25) ;
  strokeWeight(5) ;
  

  int count = 0 ;
  for(Vec3 pos : path.path_ArrayList()) {
    text(count, pos.x -2, pos.y -5) ;
    point(pos) ;
    count ++ ;
  }
  
}
// to add point with a mouse clic
void mousePressed() {
  Vec2 mouse = Vec2(mouseX,mouseY) ;
  path.add(mouse) ;
}


