/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
*/

// RPE SVG
ROPE_svg svg ;
void setup() {
  size(600,600) ;
  //colorMode(HSB, 360,100,100) ;
  String folder_brick_name = "current" ;
  // String path = "pirate_couleur.svg" ;
  String folder = "svg file/";
  String path = folder +"Pearth_from_CC.svg" ; 
  // String path = folder +"SVG_CC.svg" ;
  // String path = folder +"order_brick_different_type.svg" ;
  // String path = folder +"order_brick_same_type.svg" ;
  // String path = folder +"order_brick_same_type_special.svg" ;
 // String path = folder +"text_cc_scale.svg" ;
  //String path = folder +"text_cc_scale_reverse.svg" ;
  
 // String path = folder +"text_CS6.svg" ;

 // String path = folder +"SVG_CC_shape_raw.svg" ;
 // String path = folder +"CC_rect_rotation.svg" ;
 // String path = folder +"SVG_CC_shape_rotation.svg" ;
 // String path = folder +"text_cc_scale_rotation.svg" ;
 // String path = folder +"text_cc_skew.svg" ;
  // String path = folder +"text_cc_skew_double.svg" ;
  // String path = folder +"text_cc_skew_rotation.svg" ;
 // String path = folder +"text_cc_line.svg" ;

  // svg = new ROPE_svg(path, folder_brick_name) ;
  svg = new ROPE_svg(this, path) ;
 
  svg.build() ;

}




void draw() {
  background_rope(0, 0, 0) ;
  // print_info_by_ID() ;
  // print_info_by_list() ;

  // choice display mode
  svg.mode(CORNER) ;
  // variable common to the 2D and 3D vertex

  /**
  2D VERTEX
  be careful you must start from with an illustor where the coordinate is clean and the (0,0) are the good place, 
  it's better to start from a new illustrator file
  */
  /**
  CLASSIC VERTEX
  */

  vec2 scale = vec2(1) ;
  // vec2 pos = vec2 (width/2, height/2); 
  vec2 pos = vec2 (mouseX -width/2, mouseY -height/2); 
  vec2 jitter = vec2 (100, 5);



  //  full_svg(pos, scale, jitter) ;
  
  //layer_svg() ;
  
  // ID_svg_2D(pos_2D, scale_2D, jitter_2D, ID) ;
  vec3 pos_temp = vec3(pos.x, pos.y, 0) ;
  vec3 value = vec3(30,5,0) ;
  add_value_to_points(pos_temp, value) ;
}





/**
keyPressed
*/
void keyPressed() {
  final int k = keyCode;
  if (k == 'S') {
    if (looping)  {
      noLoop();
    } else {
      loop();
    }
  }
}

/**
FULL SVG
*/
void full_svg(vec2 pos, vec2 scale, vec2 jitter) {
  svg.pos(pos) ;
  svg.scaling(scale) ;
  svg.jitter(jitter) ;
  // svg.stroke(255,0,0) ;
  // svg.noFill() ;
  // svg.fill(255,0,0) ;
  svg.original_style(true, true) ;
  // svg.fill(124) ;
  //svg.stroke(255, 255) ;
  // svg.strokeWeight(.1) ;
  // svg.noStroke() ;
  // 
  svg.draw() ;
}
/**
LAYER NAME
*/
void layer_svg() {
  svg.fill(255, 40) ;
  float scale = abs(sin(frameCount *.01) *2) ;

  svg.start() ;
  svg.scaling(true, scale) ;
  svg.pos(width/2, height/2) ;
  svg.draw("UN") ;
  svg.stop() ;

  svg.start() ;
  svg.pos(width/2, height/2) ;
  svg.draw("UN") ;
  svg.stop() ;


  svg.start() ;
  svg.scaling(true, scale) ;
  svg.pos(width/2, height/2) ;
  svg.draw("DEUX") ;
  svg.stop() ;

  svg.start() ;
  svg.pos(width/2, height/2) ;
  svg.draw("DEUX") ;
  svg.stop() ;

  svg.start() ;
  svg.scaling(true, scale) ;
  svg.pos(width/2, height/2) ;
  svg.draw("TROIS") ;
  svg.stop() ;

  svg.start() ;
  svg.pos(width/2, height/2) ;
  svg.draw("TROIS") ;
  svg.stop() ;

  svg.start() ;
  svg.scaling(true, scale) ;
  svg.pos(width/2, height/2) ;
  svg.draw("DROITE") ;
  svg.stop() ;

  svg.start() ;
  svg.pos(width/2, height/2) ;
  svg.draw("DROITE") ;
  svg.stop() ;
}
















/**
ADD VALUE
*/

void add_value_to_points(vec3 pos, vec3 add_value) {
  for(int ID = 0 ; ID < svg.num_brick() ; ID++ ) {
    int length = svg.list_svg_vec(ID).length ;
    vec3 [] value = new vec3[length] ;
    for(int i = 0 ; i < value.length ; i++) {
      value[i] = new vec3("RANDOM", (int)add_value.x, (int)add_value.y, (int)add_value.z) ;
      value[i].mult(.1) ;
    }
    
    svg.add_def(ID, value) ;
    svg.pos(pos) ;
    // svg.original_style(true, true) ;
   // svg.original_style(false, false) ;
    svg.fill((int)random(255)) ;
    // svg.fill_factor(1,1,1,map(mouseX, 0,width, 0, 1)) ;
    svg.stroke_factor(1,1,1,map(mouseY, 0,height, 1, 0)) ;
    svg.draw(ID) ;
  }

  // rebuild your shape from the original SVG
  if(mousePressed) svg.build() ;
}






void print_info_by_ID() {
  int ID = (int)random(svg.num_brick()) ;
  // println(ID) ;
  // println(svg.name_brick(ID)) ;
  // println(svg.kind_brick(ID)) ;
  // println(svg.list_svg_Vec(ID)) ;
  println(svg.list_svg_PVector(ID)) ;
}

void print_info_by_list(){
  println(svg.brick_name_list()) ; 
  println(svg.family_brick()) ;
  println(svg.kind_brick()) ;
  println(svg.folder_brick_name()) ;

}









/**
ID GROUP LAYER
*/
void ID_svg(vec2 pos_2D, vec2 scale_2D, vec2 jitter_2D, int ID) {
  svg.pos(pos_2D) ;
  svg.scaling(scale_2D) ;
  svg.jitter(jitter_2D) ;
  svg.original_style(true, false) ;
  svg.draw(ID) ;
}


























