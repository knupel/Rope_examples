/**
DISPLAY SVG
* @see https://github.com/StanLepunK/Rope_examples
2018-2019
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




