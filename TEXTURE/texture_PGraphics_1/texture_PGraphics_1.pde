/**
TEXTURE on PGraphics
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

  PGraphics p = plan(size,img,P2D);

  image(p,pos);
  // image(img);
}




PGraphics pg ;
PGraphics plan(ivec2 size, PImage src, String renderer){
	pg = createGraphics(src.width, src.height,renderer);
	ivec2 uv = ivec2(src.width, src.height);
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
















