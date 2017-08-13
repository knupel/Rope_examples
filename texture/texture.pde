PImage img ;

void setup() {
  size (100,100,P2D) ;
  // img = loadImage("purosGirl_small.jpg") ;
  img = loadImage("BancPublic.jpg");
  surface.setSize(img.width, img.height);

}

void draw() {
  background(0);
  // iVec2 pos = iVec2(mouseX,mouseY);
   iVec2 pos = iVec2(0);
  iVec2 size = iVec2(img.width, img.height);
  // plan(pos,size,img);
  plan(pos,size,img);
  // image(img);
}

void plan(iVec2 pos, iVec2 size, PImage src){
	iVec2 uv = iVec2(src.width, src.height);
  beginShape();
  texture(src);
  
  /*
  NORMAL
  */
  vertex(pos.x,        pos.y,        0,0);
  vertex(pos.x,        pos.y+size.y, 0,uv.v);
  vertex(pos.x+size.x, pos.y+size.y, uv.u,uv.v);
  vertex(pos.x+size.x, pos.y,        uv.u,0);


  /*
  // DOWN REVERSE
  vertex(pos.x,        pos.y,        0,uv.v);
  vertex(pos.x,        pos.y+size.y, 0,0);
  vertex(pos.x+size.x, pos.y+size.y, uv.u,0);
  vertex(pos.x+size.x, pos.y,        uv.u,uv.v);
  */
  
  /*
  // REVERSE
  vertex(pos.x,        pos.y,        uv.u,0);
  vertex(pos.x,        pos.y+size.y, uv.u,uv.v);
  vertex(pos.x+size.x, pos.y+size.y, 0,uv.v);
  vertex(pos.x+size.x, pos.y,        0,0);
  */

  /*
  // LEFT
  vertex(pos.x,        pos.y,        uv.u,0);
  vertex(pos.x,        pos.y+size.y, 0,0);
  vertex(pos.x+size.x, pos.y+size.y, 0,uv.v);
  vertex(pos.x+size.x, pos.y,        uv.u,uv.v);
  */

  /*
  // LEFT REVERSE
  vertex(pos.x,        pos.y,        0,0);
  vertex(pos.x,        pos.y+size.y, uv.u,0);
  vertex(pos.x+size.x, pos.y+size.y, uv.u,uv.v);
  vertex(pos.x+size.x, pos.y,        0,uv.v);
  */
  
  
  /*
  // RIGHT REVERSE
  vertex(pos.x,        pos.y,        uv.u,uv.v);
  vertex(pos.x,        pos.y+size.y, 0,uv.v);
  vertex(pos.x+size.x, pos.y+size.y, 0,0);
  vertex(pos.x+size.x, pos.y,        uv.u,0);
  */


  /*
  // RIGHT
  vertex(pos.x,        pos.y,        0,uv.v);
  vertex(pos.x,        pos.y+size.y, uv.u,uv.v);
  vertex(pos.x+size.x, pos.y+size.y, uv.u,0);
  vertex(pos.x+size.x, pos.y,        0,0);
  */
  
  endShape() ;  
}
















