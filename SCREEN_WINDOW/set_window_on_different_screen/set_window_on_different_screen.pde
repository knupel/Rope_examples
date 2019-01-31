/**
WINDOW MOVE :)
* @see https://github.com/StanLepunK/Rope_examples
2018-2019
*/

int x, y;
int target_screen = 0;
void setup() {
  x = 0 ;
  y = 20;
	size(500,500);
  int num = get_screen_num();
  println("screen:", num);
  for(int i = 0 ; i < num ; i++) {
    println("screen:",i);
    println("size:",get_screen_size(i));
    println("location:",get_screen_location(i));
  }
  set_window(ivec2(x,y), ivec2(600,400), target_screen);
}


void draw() {
  x++;
  y++;
  set_window(x,y,600,400,1);
  // set_window(iVec2(x,y), iVec2(600,400));
  //set_window(iVec2(x,y), iVec2(600,400), target_screen);
  if(x > get_screen_size(target_screen).x - width) x = 0 ;
  if(y > get_screen_size(target_screen).y - height) y = 20;
}







