PImage img ;

void setup() {
  size (100,100,P2D) ;
  frameRate(180);
  // img = loadImage("purosGirl_small.jpg") ;
  img = loadImage("BancPublic.jpg");
  surface.setSize(img.width, img.height);
  shader_setup();
}

void draw() {
  background(0);
  println(frameRate);
  iVec2 pos = iVec2(0);
  iVec2 pos_mouse = iVec2(mouseX,mouseY);
  
  // PImage img_result = change_colour(img).copy(); 
  // PGraphics p = plan(img_result,P2D);
  change_colour(img); 
  image(img);
}


/**
SHADER part
*/
PShader shader ;
void shader_setup() {
	shader = loadShader("shader/pix_color.glsl");
}

PImage change_colour(PImage src) {
	Vec4 c = Vec4(1);
	c.x = map(mouseX, 0,width, 0,1);
	c.y = map(mouseY, 0,height, 0,1);
  c.z = abs(sin(frameCount *.01));
	
	shader(shader);
	shader.set("texture",src);
	shader.set("colour",c.x,c.y,c.z,c.w);

	return src;
}

/**
Put your result on PGraphics
*/
PGraphics pg ;
PGraphics plan(PImage src, String renderer){
	pg = createGraphics(src.width, src.height,renderer);
	iVec2 uv = iVec2(src.width, src.height);
  iVec2 size = iVec2(src.width, src.height); 

  pg.beginDraw();
  pg.noStroke(); 
  /*
  NORMAL
  */
  pg.beginShape();
  pg.texture(src);
  pg.tint(g.colorModeX, g.colorModeY, g.colorModeZ, g.colorModeA);
  pg.vertex(0,0,            0,0);
  pg.vertex(0,size.y,       0,uv.v);
  pg.vertex(size.x, size.y, uv.u,uv.v);
  pg.vertex(size.x, 0,      uv.u,0);
  pg.endShape();
  
  pg.endShape();
  
  pg.endDraw();
  return pg ;  
}