/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
guide to code here: 
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*/
ROPE_svg svg; 

void setup() {
	size(400,400);
	svg = new ROPE_svg(this, sketchPath(1)+"/import/corbeau.svg");
	svg.build() ;

}



void draw() {
	background(255);
	svg.mode(CENTER);
	svg.pos(mouseX,mouseY);
	svg.draw() ;

}




