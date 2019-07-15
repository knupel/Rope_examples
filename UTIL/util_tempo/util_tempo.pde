/**
* tempo
* few method to define a tempo partition and catch info to use anywhere !
*
* Rope Framework
* v 1.1.3
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* work with
* Processing 3.5.3
* Rope library 0.8.3.28
*/


int [] list= {3,4};
void setup() {
  tempo(3,4,2,10);
}


void draw() {
  println(tempo());
  println("sum tempo",sum_tempo());
  println("tempo pos",get_tempo_pos(frameCount));
  println("tempo value",get_tempo(frameCount));
  
  int target = get_tempo_pos(frameCount)%list.length;
  println("target",target);
}
