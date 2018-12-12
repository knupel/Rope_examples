import processing.video.Movie;
Movie movie;
void setup() {
	select_input();
}


void draw() {
	set_movie();
}



iVec2 window_ref;
void set_movie() {
	if(movie == null && input() != null) {
		println(input());
		movie = new Movie(this,input());
		movie.loop();

	} else if(movie != null) {
	  if(window_ref == null || !window_ref.equals(iVec2(movie.width,movie.height))) {
	  	surface.setSize(movie.width,movie.height);
	  	window_ref = iVec2(movie.width,movie.height);
	  }
		image(movie,0,0,width,height);
	}

}


void movieEvent(Movie m) {
	m.read();
}