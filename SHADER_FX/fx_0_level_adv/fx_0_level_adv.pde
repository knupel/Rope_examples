/**
* Rope framework
* Copyleft (c) 2014-2021
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* @see https://github.com/StanLepunK/Rope/tree/master/Guide
*
* Processing 4.0.2b
* v 0.0.2
*
*/

PImage img;
PGraphics pg;
void setup() {
  init_rope();
  size(480,750,P2D);
  img = loadImage("petite_puros_girl.jpg");
}


void draw() {
	vec3 min = abs(vec3().sin_wave(frameCount,0.01,0.02,0.03));
	vec3 gamma = abs(vec3().sin_wave(frameCount,0.02,0.02,0.02));
	vec3 max = abs(vec3().sin_wave(frameCount,0.03,0.01,0.01));
	// pg = fx_level_adv(img,false,true,min,gamma,max);
	pg = fx_level_adv(img,false,true,vec3(0),gamma,vec3(1));
	// pg = fx_level_adv(img,false,true,vec3(0),vec3(0.5),max);

	if(pg != null) {
		image(img,0,0);
		image(pg,0,img.height);
	}
}
