/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
*
* R_Bloc example
* example : create bloc
* v 0.0.1
* 2019-2019
*/
void setup() {
	size(400,400,P2D);
	rope_version();
}

R_Bloc bloc;

void draw() {
	background(r.SANG);
	vec2 [] list = {vec2(10,10), vec2(width/2,height/2), vec2(250,50), vec2(10,10)};
	if(bloc == null) {
		bloc = create_bloc(list);		
	} else {
		bloc.show();
	}
	
}


