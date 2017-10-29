/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


PGraphics pg ;
PImage tex ;
PImage inc ;
void setup() {
  size(1000,600,P2D);


// tex = loadImage("puros_girl_small.jpg");
 tex = loadImage("pirate_small.jpg");
  inc = loadImage("puros_girl_small.jpg");
  //temp = loadImage("puros_girl_small.jpg");

  int w = inc.width;
  int h = inc.height;
  surface.setSize(w,h);
  pg = createGraphics(w/2,h/2,P2D);
  //temp = createImage(w,h, ARGB);
  

  // pixel_chaos(temp) ;

  pg.beginDraw() ;
  pg.updatePixels();
  pg.endDraw() ;  
}


void draw() {
	background(125);
	blur_rendering();
	// blur_offscreen_rendering();
	// full_rendering();
	//offscreen_rendering() ;
}

void blur_rendering() {
	float intensity = map(mouseX, 0,width, 1, 50) ;
	blur(null, tex, intensity);
	image(tex);
}

void blur_offscreen_rendering() {
	float intensity = map(mouseX, 0,width, 1, 50) ;
	pg.beginDraw();
	blur(pg, tex, intensity);
	pg.endDraw() ;
	image(pg, 0,0);
}




void offscreen_rendering() {
	pg.beginDraw();
	mix_flip(false,true);
	mix(pg, tex, inc, .5, .5, .5, .5);
	pg.endDraw() ;
	// image(pg,mouseX,mouseY);
	// mix(temp, inc, .5, .5, .5, .5);

	
  if(mousePressed) {
  	pixel_chaos(tex, 1000) ;
  } else {
  	// inc.loadPixels() ;
  	// inc.pixels = buffing(pg,inc).pixels;
  	// inc.updatePixels() ;

  }
	image(pg);
	PImage buffer = buffering(pg) ;
	image(buffer,mouseX,mouseY);

}



PImage buffering(PGraphics p) {
	PImage temp = createImage(p.width,p.height, ARGB);
	p.loadPixels();
	temp.pixels = p.pixels;
	temp.updatePixels();
	return temp;
}




void full_rendering() {
	if(mousePressed) {
		tex.loadPixels() ;
		tex.pixels = pixel_chaos(tex).pixels;
		tex.updatePixels();
	}
	// mix_flip(false,false);
	mix(tex, inc, .5, .5, .5, .5);
	image(tex);
}



PImage pixel_chaos(PImage target, int num) {
	target.loadPixels();
	int max = num ;
	if(max >= target.pixels.length) max = target.pixels.length ;
	int c = color(random(255),random(255),random(255));
	for(int i = 0 ; i < max ; i++) {

		int which = floor(random(target.pixels.length));

  	target.pixels[which] = c ;
  }
  target.updatePixels();
  return target ;
}


PImage pixel_chaos(PImage target) {
	target.loadPixels();
	for(int i = 0 ; i < target.pixels.length ; i++) {
  	target.pixels[i] = color(random(255),random(255),random(255)) ;
  }
  target.updatePixels();
  return target ;
}





void layer(PImage layer) {
	int c = color(random(255),random(255),random(255));
	layer.loadPixels();
	for(int i = 0 ; i < layer.pixels.length ; i++) {
		layer.pixels[i] = c;
	}
	layer.updatePixels();
}
























