/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/
PGraphics pg_1,pg_2;
int size;
void setup() {
	size(300,150);
	size = width/2;
	generate_pattern();
}


void draw() {
	image(pg_1);
	image(pg_2,width/2,0);
}

void mousePressed() {
	generate_pattern();
}


void generate_pattern() {
	pg_1 = pattern_noise(size,size,1./size);
	pg_2 = pattern_noise(size,size,1./size);
}
