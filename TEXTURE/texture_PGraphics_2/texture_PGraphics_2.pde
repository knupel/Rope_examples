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
   ivec2 pos_mouse = ivec2(mouseX,mouseY);
  PGraphics p = plan(pos_mouse, size,img,P2D);

  image(p,pos);
  // image(img);
}




PGraphics pg ;
PGraphics plan(ivec2 pos, ivec2 size, PImage src, String renderer){
	pg = createGraphics(src.width, src.height,renderer);
	ivec2 uv = ivec2(src.width, src.height);
	float ratio = map(mouseX, 0,width,0, 1);
	println(ratio);
  pg.beginDraw();
  pg.noStroke();
  
  /*
  NORMAL
  */
  pg.beginShape();
  pg.texture(src);
  pg.tint(g.colorModeX *ratio, g.colorModeY *ratio, g.colorModeZ *ratio, g.colorModeA);
  pg.vertex(0,0,            0,0);
  pg.vertex(0,size.y,       0,uv.v);
  pg.vertex(size.x, size.y, uv.u,uv.v);
  pg.vertex(size.x, 0,      uv.u,0);
  pg.endShape();
  
  pg.beginShape();
  pg.texture(src);
  pg.tint(g.colorModeX *ratio, g.colorModeY *ratio, g.colorModeZ *ratio, g.colorModeA);
  pg.vertex(0,0,            0,0);
  pg.vertex(0,size.y,       0,uv.v);
  pg.vertex(size.x, size.y, uv.u,uv.v);
  pg.vertex(size.x, 0,      uv.u,0);
  /*
  pg.vertex(pos.x,        pos.y,        0,0);
  pg.vertex(pos.x,        pos.y+size.y, 0,uv.v);
  pg.vertex(pos.x+size.x, pos.y+size.y, uv.u,uv.v);
  pg.vertex(pos.x+size.x, pos.y,        uv.u,0);
  */
  pg.endShape();
  


  pg.endDraw();
  return pg ;  
}
















