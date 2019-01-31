/**
TEXTURE
* @see https://github.com/StanLepunK/Rope_examples
2018-2019
*/
PImage img ;

void setup() {
  size (100,100,P2D) ;
  // img = loadImage("purosGirl_small.jpg") ;
  img = loadImage("BancPublic.jpg");
  surface.setSize(img.width, img.height);

}

void draw() {
  background(0);
  // ivec2 pos = ivec2(mouseX,mouseY);
   ivec2 pos = ivec2(0);
  ivec2 size = ivec2(img.width, img.height);
  // plan(pos,size,img);
  plan(pos,size,img);
  // image(img);
}

void plan(ivec2 pos, ivec2 size, PImage src){
	ivec2 uv = ivec2(src.width, src.height);
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
















