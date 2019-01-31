/**
DRAG TO CHANGE
* @see https://github.com/StanLepunK/Rope_examples
2018-2019
*/
int num = 10 ;
ivec3 [] coord = new ivec3[num];

void setup() {
  size(600,600,P2D);
  for(int i = 0 ; i < coord.length ; i++) {
  	int x = floor(random(width));
  	int y = floor(random(height));
  	coord[i] = ivec3(x,y,0);
  }
}



void draw() {
	background_rope(abs(sin(frameCount *.001))*255);
	stroke(255);
	//noFill();
	fill(0);
	draw_shape(coord);
	move_point(coord);
}

boolean drag_is = false ;
void move_point(ivec3 [] list) {
	if(!drag_is) {
		for(ivec3 iv : list) {
			ivec2 drag = ivec2(mouseX,mouseY);
			ivec2 area = ivec2(10);
			if(inside(drag,area,ivec2(iv.x,iv.y)) && iv.z == 0) {
				if(mousePressed) {
					iv.set(iv.x,iv.y,1);
					drag_is = true ;
				}
			}
		}
	}
	

	for(ivec3 iv : list) {
		if(iv.z == 1) iv.set(mouseX,mouseY,1);
	}

	if(!mousePressed) {
		drag_is = false;
		for(ivec3 iv : list) {
			iv.set(iv.x,iv.y,0);
		}
	}
}

void draw_shape(ivec3 [] list) {
	beginShape();
	for(int i = 0 ; i < list.length ; i++) {
		vertex(list[i]);
	}
	endShape(CLOSE);
}


