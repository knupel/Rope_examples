/**
* Rope Framework
* v 1.0.0
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* note:
* import rope.core.*; > imported in the tab Z_R_core.pde
* import rope.vector.*; > imported in the tab Z_R_core.pde
* 
*/


/**
* Flower 
* 2019-2021
* v 0.2.0
*/
/**
* Object Data can be a R_Costume costume, int target, String target
*
* void costume(float x, float y, float sx, float sy, Object data);
* void costume(float x, float y, float sx, float sy, Object data, PGraphics pg);
* void costume(float x, float y, float z, float sx, float sy, Object data);
* void costume(float x, float y, float z, float sx, float sy, Object data, PGraphics pg);
* void costume(float x, float y, float z, float sx, float sy, float sz, Object data);
* void costume(float x, float y, float z, float sx, float sy, float sz, Object data, PGraphics pg);
* void costume(vec pos, int size_int, Object data);
* void costume(vec pos, int size_int, Object data, PGraphics pg);
* void costume(vec pos, vec size, Object data);
* void costume(vec pos, vec size, Object data, PGraphics pg);
* void costume(vec pos, vec size, Float rot, Object data);
* void costume(vec pos, vec size, Float rot, Object data, PGraphics pg);
* void costume(vec pos, vec size, vec rotation, Object data);
* void costume(vec pos, vec size, vec rotation, Object data, PGraphics pg);
*
* void costume_list(); // return the list of costume available, tha name and the index
* void print_list_costume(); like below but with more information
* int get_costume(int target);
* void set_ratio_costume_size(float ratio);
* void costume_text(String arg);
* void costume_rotate_x();
* void costume_rotate_y();
* void costume_rotate_z();
* void costume_rotate(vec rotate);
* void costume_rotate(vec rotate, PGraphics other);
*
* void init_bool_aspect();
* void aspect(int fill, int stroke, float thickness);
* void aspect(int fill, int stroke, float thickness, PGraphics other);
* void aspect(vec fill, vec stroke, float thickness);
* void aspect(vec fill, vec stroke, float thickness, PGraphics other) ;
* int get_fill_rope();
* int get_stroke_rope();
* float get_thickness_rope();
*/
PGraphics pg;
void setup() {
  size(400,400,P2D);
	pg = createGraphics(200,200,P2D);
}



void draw() {
  background(255);
	// when you use this method you can only display costume one by one.
	method_costume_by_index();
	// when you use the R_Costume class
	// by this way you can display as many images you want
  // method_costume_with_class_Costume();
	if(mousePressed) image(pg,0,0);
}

void method_costume_by_index() {
	vec2 pos = vec2(mouseX/4,mouseY/4);
	int diam = width;
	if(mousePressed) {
		// there is bug when this one is activate the regular one is remove, and there is flash... :(
		pg.beginDraw();
		pg.background(255,0,0);
  	costume(pos, vec2(diam), r.FLOWER, pg);
		pg.endDraw();
	} else {
		init_bool_aspect();
		aspect(r.YELLOW, r.PURPLE, 3.0f);
		aspect_is(true, true, false);
  	costume(pos.yx().mult(4),vec2(diam),r.FLOWER, null);
	}
}

void method_costume_with_class_Costume() {
	init_bool_aspect();
  vec2 pos = vec2(mouseX,mouseY);
  int diam = width;
  R_Costume flower = new R_Costume(this, r.FLOWER);
  flower.set_summit(12);
  costume(pos,vec2(diam),flower);
	
	R_Costume flower_2 = new R_Costume(this, r.FLOWER);
	flower_2.set_summit(36);
	costume(pos.div(2),vec2(diam),flower_2);
}
