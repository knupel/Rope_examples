/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

/**
* Rope framework
* Copyleft (c) 2014-2022
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

PImage result;
PImage img_a, img_b;

vec2 threshold_mask = new vec2(0,1);
vec4 level_mask = new vec4(1);


void setup() {
	size(400,400,P2D);
	surface.setResizable(true);
	rope_version();
	img_a = loadImage("jpg file/petite_puros_girl.jpg");
	img_b = loadImage("jpg file/damier_petit_gradient.jpg");
	surface.setSize(img_a.width, img_a.height);
}



void draw() {
	background(r.WHITE);

	threshold_mask.set(0,1); // the range where your mask work from 0 to 1, I don't understand well my goal when I code that :)

	float x = map(sin(frameCount * 0.1),-1,1,0,1);
	float y = map(sin(frameCount * 0.01),-1,1,0,1);
	float z = map(sin(frameCount * 0.02),-1,1,0,1);
	float a = map(sin(frameCount * 0.03),-1,1,0,1);
	level_mask.set(x,y,z,a); // the level work for each color argument work rgbA or hsba depend of you space color if I rember well.

	int fx_mask_mode = 0 ; // 0 is gray 1 is RGB


	int num_separation = (int)map(sin(frameCount * 0.1),-1,1,3,30); // the number of layer of colour separation.
	boolean on_g = false; // if you want work on g. Where "g" is a main rendering
	boolean filter_is = true; // I don't remember, what I code that. It's up to you to experiment !

	result = fx_mask(img_a, img_b, 
									on_g, filter_is, 
									fx_mask_mode, 
									num_separation, 
									threshold_mask, level_mask);

	image(result);
}




////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////// WARNING THIS WORK ARE IN PROGRESS ///////////////
////////////////////////////////////////////////////////////
////////// DONT REMOVE OR ERASE ////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

/**
* GUI CROPE EXAMPLE
* dependancies
* Processing 3.5.4
* 2021-2021
*
* Knob example
* v 0.1.0
*/

import rope.gui.button.R_Button;
// import rope.gui.button.R_Knob;
import rope.R_State.State;
import rope.vector.vec2;
import rope.core.Rope;
// import rope.core.Rope;
import rope.gui.R_Mol;


// Rope r = new Rope();
// void setup() {
//   size(200,200);
//   State.init(this);
//   set_knob(); 
// }


// void draw() {
// 	background(255);
// 	State.pointer(mouseX,mouseY);
// 	State.event(mousePressed);
// 	draw_knob();
// 	State.reset_event();
// }

R_Knob knob ;
void set_knob() {
	knob = new R_Knob(new vec2(20),100);
	knob.set_rollover_type(RECT);
	
	knob.set_value(0.45, 0.3);

	knob.set_size_mol(10);
	knob.set_dist_mol(knob.size().x() * 0.5);
	knob.set_type_mol(RECT);

	knob.set_dist_guide(knob.size().x() * 0.65);

	// limit the range knob
	knob.limit(true); // use default value range

  // CLOCKWISE
  // knob.set_limit(0, PI); 
	// knob.set_limit(PI, TAU); 
  // knob.set_limit(r.SOUTH, r.NORTH);
	// knob.set_limit(r.SOUTH + TAU, r.NORTH -TAU); // test on value beyond double PI
	
	// knob.set_limit(r.NORTH_EAST, r.SOUTH_EAST);
	// knob.set_limit(r.EAST, r.SOUTH); 

	// knob.set_limit(r.NORTH_EAST, r.SOUTH); 
	
 	
	// knob.set_limit( r.SOUTH_EAST, r.SOUTH_WEST);

	// knob.set_limit(r.NORTH_WEST, TAU - r.QPI);
	// knob.set_limit(r.NORTH_WEST, r.NORTH_EAST); 

	// knob.set_limit(0, TAU - (PI/2)); // GROS BUG
	// knob.set_limit(0, r.NORTH); // GROS BUG

  // knob.set_limit(r.NORTH_WEST, r.NORTH_EAST);
	// knob.set_limit( r.SOUTH_WEST, r.NORTH_WEST);

	// knob.set_limit(0, r.NORTH_EAST); // GROS BUG
  


  // CLOCKWISE FALSE
	// knob.set_limit(PI, 0); 
	// knob.set_limit(r.NORTH, r.WEST); 
	// knob.set_limit(r.NORTH_EAST, r.NORTH_WEST); 
	// knob.set_limit( r.NORTH_WEST, r.SOUTH_WEST);
	// knob.set_limit( r.SOUTH, r.NORTH_EAST); // BUG
	knob.set_limit(r.NORTH, r.SOUTH); 
  //  knob.set_limit(r.SOUTH_WEST, r.SOUTH_EAST); 

	// colour molette
	knob.set_align_label_name(LEFT);
	knob.set_align_label_value(LEFT);
	knob.set_label("Turn me please");
	float pos_info = 25;

	knob.set_drag_force(0.05);

	R_Mol [] list = knob.get_mol();
	// for(int i = 0 ; i < list.length ; i++) {
	// 	println("mol pos",list[i].pos());
	// }

}


void draw_knob() {
	knob.update();
	// knob.update(mouseX,mouseY);
	// knob.select(mousePressed);
	// knob.select(keyPressed); // by default is mousePressed
	// knob.update(mouseX,mouseY,keyPressed);
	//knob.update(mouseX,mouseY,mousePressed,keyPressed);
	knob.rollover(true);


	knob.show_label();
	knob.show_struc();
	knob.show_struc_pie();
	knob.show_mol();
	knob.show_value();
	knob.show_limit();
	knob.show_guide();
  
  // println("knob value", knob.get());
	// println("knob value", knob.get()%TAU);
}





public class vec1 extends Rope {
	float x = 0;
	bvec4 zone; // east, south, west, north
	bvec4 point; // east, south, west, north

	public vec1(float x, float y) {
		this.x = (float) Math.atan2(y,x);
		init();
		set(this.x);
	}

	public vec1(float x) {
		this.x = x;
		init();
		set(this.x);
	}

	private void init() {
 		zone = new bvec4();
		point = new bvec4();
	}

	public vec1 get() {
		return this;
	}

	public float angle() {
		return this.x;
	}

	public void set(float x) {
		boolean z_east = !all(abs(x) > HPI, x <= PI);
		boolean z_south = all(x < PI, x > 0);
		boolean z_west = !z_east;
		boolean z_north = !z_south;
		zone.set(z_east, z_south, z_west, z_north);

		boolean p_east = any(x == TAU, x == 0);
		boolean p_south = x == HPI;
		boolean p_west = any(x == PI, x == -PI);
		boolean p_north = any(x == -HPI, x == TAU -HPI);
		point.set(p_east, p_south, p_west, p_north);
	}


	public bvec4 point() {
		return this.point;
	}

	public boolean point_east() {
		return this.point.x();
	}

	public boolean point_south() {
		return this.point.y();
	}

	public boolean point_west() {
		return this.point.z();
	}

	public boolean point_north() {
		return this.point.w();
	}

	// zone
	public bvec4 zone() {
		return this.zone;
	}

	// half zone
	public boolean zone_east() {
		return this.zone.x();
	}

	public boolean zone_south() {
		return this.zone.y();
	}

	public boolean zone_west() {
		return this.zone.z();
	}

	public boolean zone_north() {
		return this.zone.w();
	}

	// quarter zone
		public boolean zone_south_east() {
		return all(zone_south(), zone_east());
	}

	public boolean zone_south_west() {
		return all(zone_south(), zone_west());
	}

	public boolean zone_north_west() {
		return all(zone_north(), zone_west());
	}

	public boolean zone_north_east() {
		return all(zone_north(), zone_east());
	}




}


