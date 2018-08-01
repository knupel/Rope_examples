int [][] pix ;
PImage img ;

void settings() {
  size(800,400) ;
}
void setup() {
  img = loadImage("purosGirl.jpg") ;
  surface.setSize(img.width, img.height) ;
}



void draw() {
	if(!keyPressed) {
    image(img, 0, 0);
    if(pix == null) {
      pix = loadPixels_array_2D() ;
    }
  } else {
    background(0) ;
    println("pix[0].length", pix[0].length, "pix.length", pix.length) ;
    for(int y = 0 ; y < pix.length ; y++) {
      for(int x = 0 ; x < pix[0].length ; x++) {
        if(x%2 == 0) {
          stroke(pix[y][x]) ;
          strokeWeight(3);
          point(x,y) ;
        }
      }
    }
  }
}
