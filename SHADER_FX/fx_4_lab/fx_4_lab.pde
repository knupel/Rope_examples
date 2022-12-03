/**
* Shader FX laboratory
* v 0.1.0
* Copyleft (c) 2019-2022
* @author @knupel
* @see https://github.com/knupel/Shader
* 
* Try on multi PGraphics filtering
* Processing 4.0.2b
*/

import rope.vector.*;
import rope.core.Rope;
Rope r = new Rope();


PGraphics pg_a;
PGraphics pg_b;


void setup() {
	size(640,480,P3D);
	pg_a = createGraphics(width,height,P3D);
	pg_b = createGraphics(width,height,P3D);
}



void draw() {
	background(r.VERMILLON);
	draw_pg_a();
	draw_pg_b();
	g.image(pg_a, 0, 0);
	g.image(pg_b, 0, 0);

	//  float strength = 30;
	// fx_blur_gaussian(g, true, true, true, ivec2(width,height),strength);
	// fx_blur_gaussian(g, true, true, true, ivec2(width,height),strength);
	vec2 offset_red = new vec2().sin_wave(frameCount,.1,0.2);
	vec2 offset_green = new vec2().sin_wave(frameCount,.01,0.05);
	vec2 offset_blue = new vec2().sin_wave(frameCount,.2,0.02);

	fx_split_rgb(g, true, true, offset_red, offset_green, offset_blue);
}


void draw_pg_a() {
	pg_a.beginDraw();
	if(pg_a.pixels != null) pg_a.clear();
	pg_a.fill(r.OUTREMER);
	pg_a.noStroke();
	pg_a.ellipse(mouseX,mouseY,20,20);
	pg_a.endDraw();
}


void draw_pg_b() {
	pg_b.beginDraw();
	if(pg_b.pixels != null) pg_b.clear();
	pg_b.fill(r.VERT);
	pg_b.noStroke();
	pg_b.ellipse(mouseY,mouseX,20,20);
	pg_b.endDraw();
}


