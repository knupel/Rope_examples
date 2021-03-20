/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2021
* Stan le Punk
* @see https://github.com/StanLepunK
* @see http://stanlepunk.xyz/
guide to code here: 
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*/


/**
* example CROSS_BOX
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
void setup() {
  size(300,300,P3D);
}

float dir_x =0;
float dir_y =0;
float dir_z =0;
float size_x = 0 ;
float size_y = 0 ;
float size_z =0;

void draw() {
  background(0);
  
  size_x = abs(sin(frameCount *.01) *(width/4));
  size_y = abs(sin(frameCount *.02) *(width/4));
  size_z = abs(sin(frameCount *.05) *(width/4));
  vec3 size = vec3(size_x,size_y,size_z);
  

  //vec3 size = vec3(width/10);
  dir_x += .02;
  dir_y += .05;
  dir_z += .01;
  vec3 dir = vec3(dir_x,dir_y,dir_z);
  


  float value = 2*(sin(frameCount *.005));
  set_ratio_costume_size(value);
  costume(vec3(width/2),size,dir,r.CROSS_BOX_3);
  //costume_rope(vec3(width/2),vec3(width/4),dir_z,"TRUC");
}
