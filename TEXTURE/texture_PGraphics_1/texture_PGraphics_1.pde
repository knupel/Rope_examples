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

  PGraphics p = plan(size,img,P2D);

  image(p,pos);
  // image(img);
}




PGraphics pg ;
PGraphics plan(iVec2 size, PImage src, String renderer){
	pg = createGraphics(src.width, src.height,renderer);
	iVec2 uv = iVec2(src.width, src.height);
  pg.beginDraw();
  
  /*
  NORMAL
  */
  pg.beginShape();
  pg.texture(src);
  pg.vertex(0,0,            0,0);
  pg.vertex(0,size.y,       0,uv.v);
  pg.vertex(size.x, size.y, uv.u,uv.v);
  pg.vertex(size.x, 0,      uv.u,0);
  pg.endShape();

  pg.endDraw();
  return pg ;  
}
















