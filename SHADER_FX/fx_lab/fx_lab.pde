/**
* Shader FX laboratory
* v 0.0.1
* Copyleft (c) 2019-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Shader
* 
* Try on multi PGraphics filtering
*/
PGraphics pg_a;
PGraphics pg_b;


void setup() {
	rope_version();
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
  vec2 offset_red = vec2().sin_wave(frameCount,.1,0.2);
  vec2 offset_green = vec2().sin_wave(frameCount,.01,0.05);
  vec2 offset_blue = vec2().sin_wave(frameCount,.2,0.02);

	fx_split_rgb(g, true, true, offset_red, offset_green, offset_blue);
}


void draw_pg_a() {

	beginDraw(pg_a);
	if(pg_a.pixels != null) pg_a.clear();
	fill(r.OUTREMER,pg_a);
	noStroke(pg_a);
	ellipse(mouseX,mouseY,20,20,pg_a);
	endDraw(pg_a);
}


void draw_pg_b() {

	beginDraw(pg_b);
	if(pg_b.pixels != null) pg_b.clear();
	fill(r.VERT,pg_b);
	noStroke(pg_b);
	ellipse(mouseY,mouseX,20,20,pg_b);
	endDraw(pg_b);
}


