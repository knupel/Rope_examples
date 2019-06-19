/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/

R_Image_Manager img_manager;
PGraphics pg ;

void setup() {
  
	size(100,100,P2D);
	img_manager = new R_Image_Manager();	
	// 
	img_manager.load("puros_girl_small.jpg", "pirate_small.jpg");
  surface.setSize(img_manager.get(1).width,img_manager.get(1).height);
  
  pg = createGraphics(width,height,P2D);
  img_manager.add(pg, "truc");
}


void draw() {
  background(0);
  
  pg.beginDraw();
  pg.background(255,0,0);
  pg.fill(255,255,0);
  pg.noStroke();
  float size = abs(sin(frameCount *.01)) *100 + 50 ;
  pg.ellipse(mouseX,mouseY,size, size);
  pg.rect(0,height -height/3, width,height/3);
  pg.endDraw();
  pg.loadPixels();
  pg.updatePixels();
  img_manager.set(pg,"truc");

  

  img_manager.select("truc");
  println(img_manager.get(0).width,img_manager.get(0).height);
  println(img_manager.get().length);
  image(img_manager.get(1));
 
}





















