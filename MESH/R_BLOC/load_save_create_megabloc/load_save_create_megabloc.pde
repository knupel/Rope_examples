/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* R_Megabloc && R_BLoc
* example : create save blocs and load them
* v 0.0.2
* 2019-2019
*/

// R_Bloc [] bloc;
R_Megabloc megabloc;
R_Megabloc megabloc_from_save;

void setup() {
	size(400,400,P2D);
	rope_version();
	megabloc = new R_Megabloc(this);
	// create_bloc(megabloc);
}


void draw() {
	background(r.SANG);
	if(megabloc != null) {
		show_bloc(megabloc);
	}
	if(megabloc_from_save != null) {
		show_bloc(megabloc_from_save);
	}
}

void keyPressed() {
	if(key == 'n') {
		create_bloc(megabloc);
	}
	if(key == 's') {
		save_megabloc(megabloc,"","bloc");
	}

	if(key == 'l') {
		megabloc_from_save = read_megabloc(load_megabloc("bloc.blc"));
		//build_bloc_from_file
	}
}

void show_bloc(R_Megabloc mb) {
	mb.show();
	/*
	for(R_Bloc b : mb.get()) {
		println(b.get_fill(),b.get_stroke(),b.get_thickness());
		for(vec3 v : b.get()) {
			println(v);
		}
	}
	*/
}


void create_bloc(R_Megabloc megabloc) {
	megabloc.clear();
	megabloc.set(width,height);
	int fill = color(random(g.colorModeX),random(g.colorModeX),random(g.colorModeX));
	int num = 3;
	for(int i = 0 ; i < num ; i++) {
		R_Bloc bloc = new R_Bloc(this,width,height);
		bloc.set_fill(fill);
		int complexity = (int)random(3,5);
		for(int k = 0 ; k < complexity ; k++) {
			float x = random(width);
			float y = random(height);
			bloc.build(x,y,true);
		}
		megabloc.add(bloc);
	}
}



















