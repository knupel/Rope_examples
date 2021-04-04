/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
*/

/**
* Gradient sheder
* Processing 3.5.4
* v 0.1.0
* 2021-2021
*/


PShader shader;
PGraphics pg;
int px;
int py;
int sx;
int sy;

void setup() {
  px = 30;
  py = 30;
  sx = width - 2 *px;
  sy = height - 2 *py;
  size(400, 400, P2D);
  pg = createGraphics(sx, sy, P2D);
  shader = loadShader("shader/fx_color/gradient.glsl");

}


void draw() {
  background(0);
  // three exemple
  // spectrum();
  // hue_spectrum_basic();
  hue_spectrum_adv();

  // change direction of the gradient
  shader.set("vert_is",false);
  // show gradient
  pg.shader(shader);
  pg.beginDraw();
  pg.rect(0,0,sx,sy,10);
  pg.endDraw();
  image(pg,px,py);
  ellipse(mouseX,mouseY, 10,10);
}


void spectrum() {
  shader.set("min_hue",0.5);
  shader.set("max_hue",1.0);
}

void hue_spectrum_basic() {
  float arg = constrain(map(mouseX,0,width,0,1),0,1);
  shader.set("hue",arg);
  shader.set("start_sat",0.8);
  shader.set("start_bri",0.5);
}

void hue_spectrum_adv() {
  float arg = constrain(map(mouseX,0,width,0,1),0,1);
  shader.set("hue",arg);
  // here basic setting use under hood in void hue_spectrum_basic()
  // shader.set("start_sat",0.5);
  // shader.set("min_sat",0.0);
  // shader.set("max_sat",1.0);

  // shader.set("start_bri",0.5);
  // shader.set("min_bri",0.0);
  // shader.set("max_bri",1.0);

  shader.set("start_bri",1.0);
  shader.set("min_bri",0.2);
  shader.set("max_bri",0.8);


  shader.set("start_sat",0.0);
  shader.set("min_sat",0.2);
  shader.set("max_sat",0.3);
}




