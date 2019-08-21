/**
* Rope framework
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 25K lines
* work with

* Processing 3.5.3.269
* Rope library 0.8.5.30
* Rope frame Work 1.1.5.51
*
* image collection with select folder
* v 0.0.1
* 2017-2019
*/


R_Image_Manager collection;
PGraphics buffer;

void setup() {
  size(300,300,P2D);
  rope_version();
  collection = new R_Image_Manager();
  select_folder();
}

void draw() {
  // manage collection
  if(folder_is()) {
    explore_folder(folder(),"jpg");
    collection.clear();
    collection.load(get_files_sort());
  }
  
  // show
  if(collection.size() > 0) {
    if(mousePressed) {
      R_Image img = collection.rand();
      println(img.get_id(),img.get_name());
      background(img.get_image(),CENTER);
    } else {
      background(collection.get(0),CENTER);
    }
  }
}
