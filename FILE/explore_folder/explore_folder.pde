/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2019
* Stan le Punk
* https://github.com/StanLepunK
* http://stanlepunk.xyz/
*/


void setup() {
	select_folder();
	
	
	// check_folder(path, false);
}

void draw() {
	String path = folder();
	explore_folder(path, true, "jpg", "JPG");
	if(get_files() != null && get_files().size() > 0 ) {
		showPictures() ;
	}
}



int next = 0 ;
void showPictures() {
  if(next >= get_files().size()) next = 0 ;
  File f = get_files().get(next);
  PImage img = loadImage(f.getAbsolutePath());
  surface.setSize(img.width, img.height);
  image(img, 0, 0);
}


void keyPressed() {
	if(key == 'n') next += 1 ;
}