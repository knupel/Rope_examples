/**
* Rope framework
* Copyleft (c) 2014-2022
* @author @knupel
* @see https://github.com/knupel/Rope_framework
*
* Processing 4.0.2b
* v 0.1.0
*
*/
import rope.vector.*;
import rope.core.Rope;
Rope r = new Rope();

PImage img;
PGraphics pg;

void setup() {
  size(480,750,P2D);
  img = loadImage("petite_puros_girl.jpg");
}


void draw() {
	vec3 min = r.abs(new vec3().sin_wave(frameCount,0.01,0.02,0.03));
	vec3 gamma = r.abs(new vec3().sin_wave(frameCount,0.02,0.02,0.02));
	vec3 max = r.abs(new vec3().sin_wave(frameCount,0.03,0.01,0.01));
	// pg = fx_level_adv(img,false,true,min,gamma,max);
	pg = fx_level_adv(img,false,true, new vec3(0),gamma, new vec3(1));
	// pg = fx_level_adv(img,false,true,vec3(0),vec3(0.5),max);

	if(pg != null) {
		image(img,0,0);
		image(pg,0,img.height);
	}
}
