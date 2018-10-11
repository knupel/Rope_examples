/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
guide to code here: 
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*/
int num = 10 ;
iVec3 [] coord = new iVec3[num];

void setup() {
  size(600,600,P2D);
  for(int i = 0 ; i < coord.length ; i++) {
  	int x = floor(random(width));
  	int y = floor(random(height));
  	coord[i] = iVec3(x,y,0);
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
void move_point(iVec3 [] list) {
	if(!drag_is) {
		for(iVec3 iv : list) {
			iVec2 drag = iVec2(mouseX,mouseY);
			iVec2 area = iVec2(10);
			if(inside(drag,area,iVec2(iv.x,iv.y)) && iv.z == 0) {
				if(mousePressed) {
					iv.set(iv.x,iv.y,1);
					drag_is = true ;
				}
			}
		}
	}
	

	for(iVec3 iv : list) {
		if(iv.z == 1) iv.set(mouseX,mouseY,1);
	}

	if(!mousePressed) {
		drag_is = false;
		for(iVec3 iv : list) {
			iv.set(iv.x,iv.y,0);
		}
	}
}

void draw_shape(iVec3 [] list) {
	beginShape();
	for(int i = 0 ; i < list.length ; i++) {
		vertex(list[i]);
	}
	endShape(CLOSE);
}


