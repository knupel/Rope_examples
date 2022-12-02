/**
 * CLASS FX 

 * @author @stanlepunk
 * @see https://github.com/StanLepunK/Shader
 * 2019-2021
  * v 0.4.6
 * Processing 3.5.4
 * class used to create easy setting for shader fx
*/
public class FX {
	// processing parameter
	private int id;
	private int type;
	private String name;
	private ivec2 canvas;
	private String [] name_slider;
	private String [] name_button;
	private String author;
	private String pack;
	private String version;
	private int revision;
	private boolean on_g = true;
	private boolean pg_filter_is = true;


	// glsl parameter
	private int mode; // 0
	private int num; // 1 
	private float quality; // 2
	private float time; // 3

	private vec2 scale; // 10
	private vec2 resolution; // 11

	private vec3 strength; // 20
	private vec3 angle; // 21
	private vec3 threshold; // 22
	private vec3 pos; // 23
	private vec3 size; // 24
	private vec3 offset; // 25
	private vec3 speed; // 26


	private vec4 level_source; // 30
	private vec4 level_layer; // 31
	private vec4 colour; // 32
	private vec4 cardinal; // 33 > north, east, south, west > top, right, bottom, left
	private vec4 min; // 34
	private vec4 max; // 35
	private vec4 gamma; // 36

  private float hue; // 200
	private float saturation; // 201
	private float brightness; // 202

	private float red; // 300
	private float green; // 301
	private float blue; // 302

	private float alpha; // 400

	// modular
	private vec3 [] matrix; // 40 > 42
	private vec2 [] pair; // 50 > 42
	private bvec4 [] event; // 10O-102



  // CONSTRUCTOR
  public FX () {}

  // set
  public void set_canvas(int x, int y) {
  	if(this.canvas == null) {
  		this.canvas = ivec2(x,y);
  	} else {
  		this.canvas.set(x,y);
  	}
  }

  public void set_type(int type) {
  	this.type = type;
  }

  public void set_id(int id) {
  	this.id = id;
  }

  public void set_name(String name) {
  	this.name = name;
  }

  public void set_name_slider(String... name) {
  	name_slider = new String[name.length];
  	for(int i = 0 ; i < name_slider.length ; i++) {
  		this.name_slider[i] = name[i];
  	}
  }

  public void set_name_button(String... name) {
  	name_button = new String[name.length];
  	for(int i = 0 ; i < name_button.length ; i++) {
  		this.name_button[i] = name[i];
  	}
  }

  public void set_author(String author) {
  	this.author = author;
  }

  public void set_pack(String pack) {
  	this.pack = pack;
  }

  public void set_version(String version) {
  	this.version = version;
  }

  public void set_revision(int revision) {
  	this.revision = revision;
  }

  public void set(int which, Object... arg) {
  	if(which == 0) {
  		set_mode((int)arg[0]);
  	} else if(which == 1) {
  		set_num((int)arg[0]);
  	} else if(which == 2) {
  		set_quality((float)arg[0]);
  	} else if(which == 3) {
  		set_time((float)arg[0]);
  	} else if(which == 4) {
  		set_on_g((boolean)arg[0]);
  	} else if(which == 5) {
  		set_pg_filter((boolean)arg[0]);
  	}

  		else if(which == 10) {
  		set_scale(to_float_array(arg));
  	} else if(which == 11) {
  		set_resolution(to_float_array(arg));
  	}

  		else if(which == 20) {
  		set_strength(to_float_array(arg));
  	} else if(which == 21) {
  		set_angle(to_float_array(arg));
  	} else if(which == 22) {
  		set_threshold(to_float_array(arg));
  	} else if(which == 23) {
  		set_pos(to_float_array(arg));
  	} else if(which == 24) {
  		set_size(to_float_array(arg));
  	} else if(which == 25) {
  		set_offset(to_float_array(arg));
  	} else if(which == 26) {
  		set_speed(to_float_array(arg));
  	}

  		else if(which == 30) {
  		set_level_source(to_float_array(arg));
  	} else if(which == 31) {
  		set_level_layer(to_float_array(arg));
  	} else if(which == 32) {
  		set_colour(to_float_array(arg));
  	} else if(which == 33) {
  		set_cardinal(to_float_array(arg));
  	} else if(which == 34) {
  		set_min(to_float_array(arg));
  	} else if(which == 35) {
  		set_max(to_float_array(arg));
  	} else if(which == 36) {
  		set_gamma(to_float_array(arg));
  	}

  		else if(which == 40) {
  		if(matrix == null || matrix.length < 1) matrix = new vec3[1];
  		set_matrix(0,to_float_array(arg));
  	} else if(which == 41) {
  		if(matrix == null || matrix.length < 2) matrix = new vec3[2];
  		set_matrix(1,to_float_array(arg));
  	} else if(which == 42) {
  		if(matrix == null || matrix.length < 3) matrix = new vec3[3];
  		set_matrix(2,to_float_array(arg));
  	}	

  	else if(which == 50) {
  		if(pair == null || pair.length < 1) pair = new vec2[1];
  		set_pair(0,to_float_array(arg));
  	} else if(which == 51) {
  		if(pair == null || pair.length < 2) pair = new vec2[2];
  		set_pair(1,to_float_array(arg));
  	} else if(which == 52) {
  		if(pair == null || pair.length < 3) pair = new vec2[3];
  		set_pair(2,to_float_array(arg));
  	}	

  		else if(which == 100) {
  		if(event == null || event.length < 1) event = new bvec4[1];
  		set_event(0,to_boolean_array(arg));
  	} else if(which == 101) {
  		if(event == null || event.length < 2) event = new bvec4[2];
  		set_event(1,to_boolean_array(arg));
  	} else if(which == 102) {
  		if(event == null || event.length < 3) event = new bvec4[3];
  		set_event(2,to_boolean_array(arg));
  	}
  }

  private float[] to_float_array(Object... arg) {
  	float [] f = new float[arg.length];
  	for(int i = 0 ; i < arg.length ; i++) {
  		if(arg[i] instanceof Float) {
  			f[i] = (float)arg[i];
  		} else {
  			print_err("class FX method to_float_array(): arg",arg,"cannot be cast to float");
  			f[i] = 0;
  		}
  	}
  	return f;
  }


  private boolean[] to_boolean_array(Object... arg) {
  	boolean [] b = new boolean[arg.length];
  	for(int i = 0 ; i < arg.length ; i++) {
  		if(arg[i] instanceof Boolean) {
  			b[i] = (boolean)arg[i];
  		} else {
  			print_err("class FX method to_boolean_array(): arg",arg,"cannot be cast to boolean");
  			b[i] = false;
  		}
  	}
  	return b;
  }



  public void set_on_g(boolean is) {
  	on_g = is;
  }

  public void set_pg_filter(boolean is) {
  	pg_filter_is = is;
  }


  private void set_mode(int mode) {
		this.mode = mode;
	}

	private void set_num(int num) {
		this.num = num;
	}

	private void set_quality(float quality) {
		this.quality = quality;
	}

	private void set_time(float time) {
		this.time = time;
	}

	private void set_scale(float... arg) {
		if(this.scale == null) {
			this.scale = vec2(build_float_2(arg));
		} else {
			this.scale.set(build_float_2(arg));
		}
	}

	private void set_resolution(float... arg) {
		if(this.resolution == null) {
			this.resolution = vec2(build_float_2(arg));
		} else {
			this.resolution.set(build_float_2(arg));
		}
	}

	private void set_strength(float... arg) {
		if(this.strength == null) {
			this.strength = vec3(build_float_3(arg));
		} else {
			this.strength.set(build_float_3(arg));
		}
	}

	private void set_angle(float... arg) {
		if(this.angle == null) {
			this.angle = vec3(build_float_3(arg));
		} else {
			this.angle.set(build_float_3(arg));
		}
	}

	private void set_threshold(float... arg) {
		if(this.threshold == null) {
			this.threshold = vec3(build_float_3(arg));
		} else {
			this.threshold.set(build_float_3(arg));
		}
	}

	private void set_pos(float... arg) {
		if(this.pos == null) {
			this.pos = vec3(build_float_3(arg));
		} else {
			this.pos.set(build_float_3(arg));
		}
	}

	private void set_size(float... arg) {
		if(this.size == null) {
			this.size = vec3(build_float_3(arg));
		} else {
			this.size.set(build_float_3(arg));
		}
	}

	private void set_offset(float... arg) {
		if(this.offset == null) {
			this.offset = vec3(build_float_3(arg));
		} else {
			this.offset.set(build_float_3(arg));
		}
	}

	private void set_speed(float... arg) {
		if(this.speed == null) {
			this.speed = vec3(build_float_3(arg));
		} else {
			this.speed.set(build_float_3(arg));
		}
	}

	private void set_level_source(float... arg) {
		if(this.level_source == null) {
			this.level_source = vec4(build_float_4(arg));
		} else {
			this.level_source.set(build_float_4(arg));
		}
	}

	private void set_level_layer(float... arg) {
		if(this.level_layer == null) {
			this.level_layer = vec4(build_float_4(arg));
		} else {
			this.level_layer.set(build_float_4(arg));
		}
	}

	private void set_colour(float... arg) {
		if(this.colour == null) {
			this.colour = vec4(build_float_4(arg));
		} else {
			this.colour.set(build_float_4(arg));
		}
	}

	private void set_cardinal(float... arg) {
		if(this.cardinal == null) {
			this.cardinal = vec4(build_float_4(arg));
		} else {
			this.cardinal.set(build_float_4(arg));
		}
	}

	private void set_min(float... arg) {
		if(this.min == null) {
			this.min = vec4(build_float_4(arg));
		} else {
			this.min.set(build_float_4(arg));
		}
	}

	private void set_max(float... arg) {
		if(this.max == null) {
			this.max = vec4(build_float_4(arg));
		} else {
			this.max.set(build_float_4(arg));
		}
	}

	private void set_gamma(float... arg) {
		if(this.gamma == null) {
			this.gamma = vec4(build_float_4(arg));
		} else {
			this.gamma.set(build_float_4(arg));
		}
	}


	private void set_hue(float hue) {
		this.hue = hue;
	}

	private void set_saturation(float saturation) {
		this.saturation = saturation;
	}

	private void set_brightness(float brightness) {
		this.brightness = brightness;
	}

	private void set_red(float red) {
		this.red = red;
	}

	private void set_green(float green) {
		this.green = green;
	}

	private void set_blue(float blue) {
		this.blue = blue;
	}

	private void set_alpha(float alpha) {
		this.alpha = alpha;
	}

	private void set_matrix(int which, float... arg) {
		if(this.matrix[which] == null) {
			this.matrix[which] = vec3(build_float_3(arg));
		} else {
			this.matrix[which].set(build_float_3(arg));
		}
	}

	private void set_pair(int which, float... arg) {
		if(this.pair[which] == null) {
			this.pair[which] = vec2(build_float_2(arg));
		} else {
			this.pair[which].set(build_float_2(arg));
		}
	}

	private void set_event(int which, boolean... arg) {
		if(this.event[which] == null) {
			this.event[which] = bvec4(build_boolean_4(arg));
		} else {
			this.event[which].set(build_boolean_4(arg));
		}
	}



	// get
	public boolean on_g() {
		return on_g;
	}

	public boolean pg_filter_is() {
  	return pg_filter_is;
  }

	public String get_name() {
		return name;
	}

	public ivec2 get_canvas() {
		return this.canvas;
	}

	public String [] get_name_slider() {
  	return name_slider;
  }

  public String [] get_name_button() {
  	return name_button;
  }

	public int get_id() {
		return id;
	}

	public String get_author() {
  	 return author;
  }

  public String get_pack() {
  	return pack;
  }

  public String get_version() {
  	return version;
  }

  public  int get_revision() {
  	return revision;
  }

	public int get_type() {
		return type;
	}

	public int get_mode() {
		return mode;
	}

	public int get_num() {
		return num;
	}

	public float get_quality() {
		return quality;
	}

	public float get_time() {
		return time;
	}

	public vec2 get_scale() {
		if(scale == null) {
			scale = vec2(1);
			print_err("class FX method get_scale(): arg",null,"instead set arg and return",scale);
		} 
		return scale;	
	}

	public vec2 get_resolution() {
		if(resolution == null) {
			resolution = vec2(width,height);
			print_err("class FX method get_resolution(): arg",null,"instead set arg and return",resolution);
		} 
		return resolution;
	}

	public vec3 get_strength() {
		if(strength == null) {
			strength = vec3(0);
			print_err("class FX method get_strength(): arg",null,"instead set arg and return",strength);
		}
		return strength;
	}

	public vec3 get_angle() {
		if(angle == null) {
			angle = vec3(0);
			print_err("class FX method get_angle(): arg",null,"instead set arg and return",angle);
		}
		return angle;
	}

	public vec3 get_threshold() {
		if(threshold == null) {
			threshold = vec3(0);
			print_err("class FX method get_threshold(): arg",null,"instead set arg and return",threshold);
		}
		return threshold;
	}

	public vec3 get_pos() {
		if(pos == null) {
			pos = vec3(width/2,height/2,0);
			print_err("class FX method get_pos(): arg",null,"instead set arg and return",pos);
		}
		return pos;
	}

	public vec3 get_size() {
		if(size == null) {
			size = vec3(5);
			print_err("class FX method get_size(): arg",null,"instead set arg and return",size);
		}
		return size;
	}

	public vec3 get_offset() {
		if(offset == null) {
			offset = vec3(0);
			print_err("class FX method get_offset(): arg",null,"instead set arg and return",offset);
		}
		return offset;
	}

	public vec3 get_speed() {
		if(speed == null) {
			speed = vec3(0);
			print_err("class FX method get_offset(): arg",null,"instead set arg and return",speed);
		}
		return speed;
	}

	public vec4 get_level_source() {
		if(level_source == null) {
			level_source = vec4(1);
			print_err("class FX method get_level_source(): arg",null,"instead set arg and return",level_source);
		}
		return level_source;
	}

	public vec4 get_level_layer() {
		if(level_layer == null) {
			level_layer = vec4(1);
			print_err("class FX method get_level_layer(): arg",null,"instead set arg and return",level_layer);
		}
		return level_layer;
	}

	public vec4 get_colour() {
		if(colour == null) {
			colour = vec4(1);
			print_err("class FX method get_colour(): arg",null,"instead set arg and return",colour);
		}
		return colour;
	}

	public vec4 get_cardinal() {
		if(cardinal == null) {
			cardinal = vec4(1);
			print_err("class FX method get_cardinal(): arg",null,"instead set arg and return",cardinal);
		}
		return cardinal;
	}

	public vec4 get_min() {
		if(min == null) {
			min = vec4(1);
			print_err("class FX method get_min(): arg",null,"instead set arg and return",min);
		}
		return min;
	}

	public vec4 get_max() {
		if(max == null) {
			max = vec4(1);
			print_err("class FX method get_max(): arg",null,"instead set arg and return",max);
		}
		return max;
	}

	public vec4 get_gamma() {
		if(gamma == null) {
			gamma = vec4(1);
			print_err("class FX method get_gamma(): arg",null,"instead set arg and return",gamma);
		}
		return max;
	}

	public float get_hue() {
		return hue;
	}

	public float get_saturation() {
		return saturation;
	}

	public float get_brightness() {
		return brightness;
	}

	public float get_red() {
		return red;
	}

	public float get_green() {
		return green;
	}

	public float get_blue() {
		return blue;
	}

	public float get_alpha() {
		return alpha;
	}   

  // matrix
	public vec3 get_matrix(int which) {
		if(matrix != null  && which < matrix.length && which >= 0) {
			if(matrix[which] == null) {
				matrix[which] = vec3(0);
				print_err("class FX method get_matrix(): arg",null,"instead set arg and return",matrix[which]);
			}
			return matrix[which];
		} else if(matrix == null) {
			print_err_tempo(180,"class FX method get_matrix(): matrix list is",null);
			return vec3(0);
		} else {
			if(matrix[0] == null) {
				matrix[0] = vec3(0);
				print_err("class FX method get_matrix(",which,") is out of the list available\nthe first component is used and not this is null too\nmatrix '0' is used");
				return matrix[0];
			} else {
				print_err("class FX method get_matrix(",which,") is out of the list available\nthe first component is used");
				return matrix[0];
			}
		}
	}

	public vec3 [] get_matrix() {
		if(matrix != null) {
			return matrix;
		} else return null;
	}
  
  // pair
	public vec2 get_pair(int which) {
		if(pair != null && which < pair.length && which >= 0) {
			if(pair[which] == null) {
				pair[which] = vec2(0);
				print_err("class FX method get_pair(): arg",null,"instead set arg and return",pair[which]);
			}
			return pair[which];
		} else if(pair == null)  {
			print_err_tempo(180,"class FX method get_pair(): pair list is",null);
			return vec2(0);
		} else {
			if(pair[0] == null) {
				pair[0] = vec2(0);
				print_err("class FX method get_pair(",which,") is out of the list available\nthe first component is used and not this is null too\npair double '0' is used");
				return pair[0];
			} else {
				print_err("class FX method get_pair(",which,") is out of the list available\nthe first component is used");
				return pair[0];
			}
		}
	}

	public vec2 [] get_pair() {
		if(pair != null) {
			return pair;
		} else return null;
	}
  
  // event
  public bvec4 get_event(int which) {
		if(event != null && which < event.length  && which >= 0) {
			return event[which];
		} else if(event == null) {
			print_err_tempo(180,"class FX method get_event(): event list is null\n bvec false is return");
			return bvec4(false);
		} else {
			if(event[0] == null) {
				event[0] = bvec4(false);
				print_err("class FX method get_event(",which,") is out of the list available\nthe first component is used and not this is null too\nevent 'false is used");
				return event[0];
			} else {
				print_err("class FX method get_event(",which,") is out of the list available\nthe first component is used");
				return event[0];
			}
		}
	}

	public bvec4 [] get_event() {
		if(event != null) {
			return event;
		} else {
			return null;
		}
	}

	// util
	private bvec4 build_boolean_4(boolean... arg) {
		if(arg.length == 1 ) {
			return bvec4(arg[0],false,false,false);
		} else if(arg.length == 2) {
			return bvec4(arg[0],arg[1],false,false);
		} else if(arg.length == 3) {
			return bvec4(arg[0],arg[1],arg[2],false);
		} else if(arg.length == 4) {
			return bvec4(arg[0],arg[1],arg[2],arg[3]);
		} else {
			return bvec4(false);
		}
	}


	private vec4 build_float_4(float... arg) {
		if(arg.length == 1 ) {
			return vec4(arg[0],arg[0],arg[0],g.colorModeA);
		} else if(arg.length == 2) {
			return vec4(arg[0],arg[0],arg[0],arg[1]);
		} else if(arg.length == 3) {
			return vec4(arg[0],arg[1],arg[2],g.colorModeA);
		} else if(arg.length == 4) {
			return vec4(arg[0],arg[1],arg[2],arg[3]);
		} else {
			return vec4(g.colorModeX,g.colorModeY,g.colorModeZ,g.colorModeA);
		}
	}

	private vec3 build_float_3(float... arg) {
		if(arg.length == 1 ) {
			return vec3(arg[0],arg[0],arg[0]);
		} else if(arg.length == 2) {
			return vec3(arg[0],arg[1],0);
		} else if(arg.length == 3) {
			return vec3(arg[0],arg[1],arg[2]);
		} else {
			return vec3(0);
		}
	}

	private vec2 build_float_2(float... arg) {
		if(arg.length == 1 ) {
			return vec2(arg[0],arg[0]);
		} else if(arg.length == 2) {
			return vec2(arg[0],arg[1]);
		} else {
			return vec2(0);
		}
	}
}