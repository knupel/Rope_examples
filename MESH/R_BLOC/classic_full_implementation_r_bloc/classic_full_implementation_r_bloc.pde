/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* R_Bloc R_Megabloc and method full implementation
* example : create save blocs and load them
* v 0.0.1
* 2019-2019
*/

R_Megabloc megabloc;

boolean bloc_build_is = true;
boolean bloc_move_point_is = false;
boolean bloc_move_bloc_is = false;
float inc_bloc = 0.5;


void setup() {
	// fullScreen(P3D);
	size(800,800,P3D);
	rope_version();
	megabloc = new R_Megabloc();
	megabloc.set_magnetism(5);
}


void draw() {
	rendering();
	show();
	check_for_new_bloc(megabloc);
	bloc_show_structure(megabloc);
	if(bloc_build_is) {
		if(bloc_show_available_point(megabloc, mouseX, mouseY)) {
			bloc_draw(megabloc, mouseX, mouseY, mousePressed, true);
			add_new_bloc_is = false;
		} else {
			bloc_draw(megabloc, mouseX, mouseY, mousePressed, true);
		}		
	}
	// bloc_select(megabloc);
	bloc_manage(megabloc);

	info(megabloc);
  
  // test
	for(R_Bloc b : megabloc.get()) {
		if(b.select_is()) {
			// println("id",b.get_id(),frameCount);
			// println("magnetisme",b.get_magnetism(),frameCount);
		}
	}
}


void mousePressed() {
	if(bloc_build_is && add_new_bloc_is) {
		new_bloc(megabloc);
		add_new_bloc_is = false;
	}
	if(!bloc_move_event_is()) {
		for(R_Bloc b : megabloc.get()) {
			b.select_is(false);
		}
	}
}


void mouseReleased() {
	if(bloc_build_is) {
		add_point_to_bloc_is(true);
	}
	bloc_move_event_is(false);
}

void keyPressed() {
	if(keyCode == BACKSPACE) {
		bloc_remove_single_select(megabloc);
		// megabloc.clear();
	}

	if(key == 'n') {
		bloc_build_is = !bloc_build_is;
		if(bloc_build_is) {
			bloc_move_point_is = false;
			bloc_move_bloc_is = false;
		}
		add_new_bloc_is = true;
	}

	if(key == 'm') {
		bloc_move_point_is = !bloc_move_point_is;
		if(bloc_move_point_is) {
			bloc_build_is = false;
			bloc_move_bloc_is = false;
		}
	}

	if(key == 'M') {
		bloc_move_bloc_is = !bloc_move_bloc_is;
		if(bloc_move_bloc_is) {
			bloc_build_is = false;
			bloc_move_point_is = false;
		}
	}

	if(key == 's') {
		save_megabloc(megabloc,"bloc","");
	}

	if(key == 'l') {
		megabloc = read_megabloc(load_megabloc("bloc.blc"));
		int fill = color(random(g.colorModeX),random(g.colorModeY), random(g.colorModeZ));
		megabloc.set_fill(fill);
		megabloc.set_stroke(r.NOIR);
		megabloc.set_thickness(3);
	}
}




void show() {
	if(megabloc != null) {
		megabloc.show();
	}
}


void bloc_manage(R_Megabloc megabloc) {
	if(bloc_move_point_is) {
		bloc_show_point(mouseX, mouseY);
		bloc_select_single_point(megabloc, mouseX, mouseY, mousePressed);
		// bloc_select_all_point(megabloc, mouseX, mouseY, mousePressed);
		bloc_move_point(megabloc, mouseX, mouseY, mousePressed);
		// bloc_move_point_key(megabloc);
		
	}
	if(bloc_move_bloc_is) {
		// bloc_show_point(mouseX, mouseY);
		bloc_select(megabloc, mouseX, mouseY, mousePressed);
		bloc_move(megabloc, mouseX, mouseY, mousePressed);
	}
}

void bloc_move_point_key(R_Megabloc megabloc) {
	boolean up_is = false;
	boolean down_is = false;
	boolean right_is = false;
	boolean left_is = false;
	if(keyPressed && key == CODED) {
		if(keyCode == UP) up_is = true;
		if(keyCode == DOWN) down_is = true;
		if(keyCode == LEFT) left_is = true;
		if(keyCode == RIGHT) right_is = true;
  }

  if(up_is || down_is || right_is || left_is) {
  	for(R_Bloc b : megabloc.get()) {
  		if(b.select_point_is()) {
  			println(b.get_id(), frameCount);
  		}
		}
  }
}


void info(R_Megabloc megabloc) {
	if(bloc_build_is) {
		text("BUILD bloc mode", 20,20);
	}

	if(bloc_move_point_is) {
		text("MOVE points mode", 20,20);
	}

		if(bloc_move_bloc_is) {
		text("MOVE bloc mode", 20,20);
	}

	for(R_Bloc b : megabloc.get()) {
		if(b.select_is()) {
			text("there is bloc selected", 20,40);
			break;
		} 
	}
}








float rotate_x,rotate_y,rotate_z;
void rendering() {
	rotate_x += 0.01;
	rotate_y += 0.02;
	background_rope(255,0,255);
	fill(255);
	stroke(0);
	strokeWeight(1);
	pushMatrix();
	
	translate(width/2,height/2,width/3);
	rotateX(rotate_x);
	rotateZ(rotate_y);

	box(200);
	popMatrix();
}

