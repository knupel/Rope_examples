/**
* Rope Framework
* v 1.0.0
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/

void setup() {
}

void draw() {
  boolean explore_sub_folder = true;
  String [] ext = {"mov"};
  explore_folder(folder(),explore_sub_folder,ext); 

  if(get_files() != null && get_files().size() > 0) {
  	println("size",get_files().size());
  	for(File f : get_files()) {
	  	println(f);
	  }
    exit();
  }
}


void keyPressed() {
	if(key == 'f') select_folder();
}
