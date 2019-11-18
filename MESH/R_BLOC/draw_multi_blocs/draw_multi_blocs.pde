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
boolean bloc_manage_is = false;


void setup() {
	size(800,500,P2D);
	rope_version();
	megabloc = new R_Megabloc(this);
}


void draw() {
	background(r.SANG);
	if(megabloc != null) {
		megabloc.show();
	}
	check_for_new_bloc(megabloc);
	bloc_show_struct(megabloc,mouseX,mouseY);
	if(bloc_build_is) {
		if(bloc_show_available_point(megabloc,mouseX,mouseY)) {
			bloc_draw(megabloc,mouseX,mouseY,mousePressed,true);
			add_new_bloc_is = false;
		} else {
			bloc_draw(megabloc,mouseX,mouseY,mousePressed,true);
		}		
	}
	bloc_select(megabloc,mouseX,mouseY,mousePressed);
	if(bloc_manage_is) {
		bloc_manage(megabloc);
	}
	info(megabloc);
	
}


void mousePressed() {
	if(bloc_build_is && add_new_bloc_is) {
		new_bloc(megabloc);
		add_new_bloc_is = false;
	}
	for(R_Bloc b : megabloc.get()) {
		b.select_is(false);
	}
}


void mouseReleased() {
	if(bloc_build_is) {
		add_point_to_bloc_is(true);
	}
}

void keyPressed() {
	if(keyCode == BACKSPACE) {
		bloc_remove_single(megabloc);
		// megabloc.clear();
	}

	if(key == 'n') {
		bloc_build_is = !bloc_build_is;
		if(bloc_build_is) bloc_manage_is = false;
		add_new_bloc_is = true;
	}

	if(key == 'm') {
		bloc_manage_is = !bloc_manage_is;
		if(bloc_manage_is) bloc_build_is = false;
	}
}



void bloc_manage(R_Megabloc mb) {
	if(!bloc_move(mb,mouseX,mouseY,mousePressed)) {
		bloc_move_point(mb,mouseX,mouseY,mousePressed);
	}
}



void bloc_remove_single(R_Megabloc mb) {
	int index = -1;
	for(int i = 0 ; i < mb.size() ; i++) {
		R_Bloc b = mb.get().get(i);
		if(b.select_is()) {
			index = i;
		}
	}
	if(index > -1) {
		mb.remove(index);
	}
}



void info(R_Megabloc mb) {
	if(bloc_build_is) {
		text("build bloc mode", 20,20);
	}

	if(bloc_manage_is) {
		text("manage bloc mode", 20,20);
	}

	for(R_Bloc b : mb.get()) {
		if(b.select_is()) {
			text("there is bloc selected", 20,40);
			break;
		} 
	}
}







