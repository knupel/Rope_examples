/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2018
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
guide to code here: 
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*/


void setup() {
	size(500,500);


}



void draw() {
	background(255);
  // mask_mapping_2_blocks(true);
  mask_mapping_border(true);

}


Mask_mapping mask_border;
void mask_mapping_border(boolean change_is) {
  if(mask_border == null) {
    int marge = 40;
    // a,c,d,e for outside
    // f,g,h,i for inside
    iVec2 [] coord_connected = {iVec2(0,0),iVec2(width,0),iVec2(width,height),iVec2(0,height),
    														iVec2(marge,marge),iVec2(width-marge,marge),iVec2(width-marge,height-marge),iVec2(marge,height-marge)};
    iVec2 [] coord_block_1 = {iVec2(width/3,marge),iVec2(width -width/3,marge)};
    iVec2 [] coord_block_2 = new iVec2[0];
    iVec2 [] coord_block_3 = {iVec2(width/3,height-marge),iVec2(width -width/3,height-marge)};
    iVec2 [] coord_block_4 = new iVec2[0];
    //int num_mask = 2;
  
    mask_border = new Mask_mapping(coord_connected, coord_block_1,  coord_block_2, coord_block_3, coord_block_4);
  }

  mask_border.draw(change_is);
}







Mask_mapping [] mask_simple;
void mask_mapping_2_blocks(boolean change_is) {
  if(mask_simple == null) {
    int h = 40;
    iVec2 [] coord_mask_0 = {iVec2(0,0),iVec2(width,0),iVec2(width,h),iVec2(0,h)};
    iVec2 [] coord_mask_1 = {iVec2(0,height-h),iVec2(width,height-h),iVec2(width,height),iVec2(0,height)};
    int num_mask = 2;
    mask_simple = new Mask_mapping[num_mask];
    mask_simple[0] = new Mask_mapping(coord_mask_0);
    mask_simple[1] = new Mask_mapping(coord_mask_1);
  }

  mask_simple[0].draw(change_is);
  mask_simple[1].draw(change_is);
}







public class Mask_mapping {
  // private int num;
  private iVec3 [] coord;
  private iVec3 [] coord_block_1, coord_block_2, coord_block_3, coord_block_4;
  private boolean init;
  private boolean block_is;
  private int c = r.BLACK;
  private int range = 10;

  public Mask_mapping(iVec2 [] list) {
    coord = new iVec3[list.length];
    for(int i = 0 ; i < coord.length ;i++) {
      coord[i] = iVec3(list[i].x,list[i].y,0);
    }
    init = true;
  }

  public Mask_mapping(iVec2 [] list, iVec2 [] list_block_1, iVec2 [] list_block_2, iVec2 [] list_block_3, iVec2 [] list_block_4) {
		if(list.length != 8) {
			printErr("class Mask_mapping need exactly 8 points to create a block, no more no less, there is",list.length,"in the list, no mask can be create");
		} else {
			block_is = true ;
			coord = new iVec3[list.length];
			for(int i = 0 ; i < coord.length ;i++) {
				coord[i] = iVec3(list[i].x,list[i].y,0);
			}
			// block 1
			if(list_block_1.length > 0) {
				coord_block_1 = new iVec3[list_block_1.length];
				for(int i = 0 ; i < coord_block_1.length ;i++) {
					coord_block_1[i] = iVec3(list_block_1[i].x,list_block_1[i].y,0);
				}
			}

  		// block 2
			if(list_block_2.length > 0) {
				coord_block_2 = new iVec3[list_block_2.length];
				for(int i = 0 ; i < coord_block_2.length ;i++) {
					coord_block_2[i] = iVec3(list_block_2[i].x,list_block_2[i].y,0);
				}
			}
  		// block 3
			if(list_block_3.length > 0) {
				coord_block_3 = new iVec3[list_block_3.length];
				for(int i = 0 ; i < coord_block_3.length ;i++) {
					coord_block_3[i] = iVec3(list_block_3[i].x,list_block_3[i].y,0);
				}
			}
  		// block 4
			if(list_block_3.length > 0) {
				coord_block_4 = new iVec3[list_block_4.length];
				for(int i = 0 ; i < coord_block_4.length ;i++) {
					coord_block_4[i] = iVec3(list_block_3[i].x,list_block_4[i].y,0);
				}
			}

  	}
    init = true;
  }

  public void set_fill(int c) {
    this.c = c;
  }



  public void draw(boolean modify_is) {
    if(init) {
      if(modify_is) {
				fill(r.RED);
			} else {
				fill(c);
			}
			noStroke();
			if(block_is) {
				draw_shape(coord, coord_block_1, coord_block_2, coord_block_3, coord_block_4);
				if(modify_is) {
					show_point(coord);
					move_point(coord);
					if(coord_block_1 != null) {
						show_point(coord_block_1);
						move_point(coord_block_1);
					}
					if(coord_block_2 != null) {
						show_point(coord_block_2);
						move_point(coord_block_2);
					}
					if(coord_block_3 != null) {
						show_point(coord_block_3);
						move_point(coord_block_3);
					}
					if(coord_block_4 != null) {
						show_point(coord_block_4);
						move_point(coord_block_4);
					}
	      }
			} else {
				draw_shape(coord);
				if(modify_is) {
					show_point(coord);
					move_point(coord);
	      }
      }
      
    } else {
      printErr("class Mask_mapping(), must be iniatilized with an array list iVec2 [] coord)");
    }
  }
  private void show_point(iVec3 [] list) {
    for(iVec3 iv : list) {
      // fill(255);
      stroke(r.WHITE);
      strokeWeight(range);
      point(iv);
    }
  }
  private boolean drag_is = false ;
  private void move_point(iVec3 [] list) {
    if(!drag_is) {
      for(iVec3 iv : list) {
        iVec2 drag = iVec2(mouseX,mouseY);
        iVec2 area = iVec2(range);
        if(inside(drag,area,iVec2(iv.x,iv.y)) && iv.z == 0) {
          if(mousePressed) {
            iv.set(iv.x,iv.y,1);
            drag_is = true ;
          } else {
            // border magnetism
            if(iv.x < 0 + range) iv.x = 0 ;
            if(iv.x > width -range) iv.x = width;
            if(iv.y < 0 + range) iv.y = 0 ;
            if(iv.y > height -range) iv.y = height;
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

  private void draw_shape(iVec3 [] list) {
    beginShape();
    for(int i = 0 ; i < list.length ; i++) {
      vertex(list[i]);
    }
    endShape(CLOSE);
  }

  private void draw_shape(iVec3 [] list, iVec3 [] list_b_1, iVec3 [] list_b_2, iVec3 [] list_b_3, iVec3 [] list_b_4) {
  	// block 1
    beginShape();
    vertex(list[0]);
    vertex(list[1]);
    vertex(list[5]);
    if(list_b_1 != null) {
    	for(int i = 0 ; i < list_b_1.length ; i++) {
    		vertex(list_b_1[i]);
    	}
    }
    vertex(list[4]);
    endShape(CLOSE);

    // block 2
    beginShape();
    vertex(list[1]);
    vertex(list[2]);
    vertex(list[6]);
    if(list_b_2 != null) {
    	for(int i = 0 ; i < list_b_2.length ; i++) {
	      vertex(list_b_2[i]);
	    }
	  }
    vertex(list[5]);
    endShape(CLOSE);

    // block 3
    beginShape();
    vertex(list[2]);
    vertex(list[3]);
    vertex(list[7]);
    if(list_b_3 != null) {
	    for(int i = 0 ; i < list_b_3.length ; i++) {
	      vertex(list_b_3[i]);
	    }
	  }
    vertex(list[6]);
    endShape(CLOSE);

		// block 4
    beginShape();
    vertex(list[3]);
		vertex(list[0]);
		vertex(list[4]);
    if(list_b_4 != null) {
	    for(int i = 0 ; i < list_b_4.length ; i++) {
	      vertex(list_b_4[i]);
	    }
	  }
    vertex(list[7]);
    endShape(CLOSE);
  }
}


