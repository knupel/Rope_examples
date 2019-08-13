/**
* Line2D echoes
*
* Copyleft (c) 2014-2019
* @author @stanlepunk
* @see https://github.com/StanLepunK/Rope_framework
* 
* work with
* Rope frame Work 1.1.3
* Processing 3.5.3
* Rope library 0.8.4.29
*/

import rope.costume.R_Line2D;

R_Line2D main_line;

void setup() {
  size(400,400);
  background(r.BLANC);
  border(width/4);
}


void draw() {
  background(r.BLANC);
  // line
  vec2 a = new vec2(width/2,height/2);
  vec2 b = new vec2(mouseX,mouseY);
  main_line = new R_Line2D(this,a,b);

  stroke(r.BLACK);
  strokeWeight(5);
  point(a);
  point(b);

  ArrayList<R_Line2D> list = new ArrayList<R_Line2D>();
  line2D_echo(main_line, borders, list);

  // border
  strokeWeight(1);
  stroke(r.BLACK);
  noFill();
  for(R_Line2D line2D : borders) {
    line2D.show();
  }
}




void line2D_echo(R_Line2D line, R_Line2D [] limits, ArrayList<R_Line2D> list) {
  float total_dist = line.dist();
  R_Line2D rest_line = line.copy();
  // offset define the step between each line
  float offset = 2;
  // define if the line make go and return, or restart always from the opposite line
  boolean go_and_return_is = keyPressed;

  while(rest_line.dist() > 0) {
    rest_line = line2D_echo_loop(rest_line,limits,list,offset,go_and_return_is).copy();
  }

  strokeWeight(1);
  stroke(r.PINK);
  // show the last segment
  if(list != null && list.size() > 0) {
    for(R_Line2D l : list) {
      l.show();
    }
  }
}

R_Line2D line2D_echo_loop(R_Line2D line, R_Line2D [] limits, ArrayList<R_Line2D> list, float offset, boolean go_return_is) {
  R_Line2D rest = new R_Line2D(this);
  int count_limit = 0;
  if(go_return_is) offset = -1 *offset;


  for(R_Line2D limit : limits) {
    count_limit ++;
    // add line.a() like exception because this one touch previous border
    vec2 node = limit.intersection(line, line.a());
    if(node != null) {
      R_Line2D line2D = new R_Line2D(this,line.a(),node);
      rest = new R_Line2D(this,node,line.b());

      //offset
      float angle_offset = limit.angle();
      if(offset < 0 ) {
        if(list.size()%2 == 0 && go_return_is) angle_offset += PI;
      } else {
        if(list.size()%2 == 0 && go_return_is) angle_offset -= PI;
      }

      vec2 displacement = projection(angle_offset,offset);
      rest.offset(displacement);
      
      // classic go and return
      if(go_return_is) {
        rest.angle(rest.angle() +PI);
      // go on a same way
      } else {
        float angle = rest.angle() -PI;

        vec2 temp = projection(angle, width+height).add(rest.a());
        R_Line2D max_line = new R_Line2D(this,rest.b(),temp);
        for(R_Line2D limit_opp : limits) {
          vec2 opp_node = limit_opp.intersection(max_line,vec2(node).add(displacement));
          if(opp_node != null) {
            rest.angle(rest.angle());
            vec2 swap = opp_node.sub(node).sub(displacement);
            rest.offset(swap);
            break;
          }
        }
      }
      // add result
      list.add(line2D);
      break;
    } else {
      // to add the last segment of the main line, 
      // because this one cannot match with any borders or limits
      // before add the last element, it's necessary to check all segments borders
      if(count_limit == limits.length) {
        list.add(line);
      } 
    }
  }
  return rest;
}



R_Line2D [] borders = new R_Line2D[4];
void border(int marge) {
  vec2 a = vec2(marge,marge);
  vec2 b = vec2(width-marge, marge);
  vec2 c = vec2(width-marge, height -marge);
  vec2 d = vec2(marge,height-marge);
  borders[0] = new R_Line2D(this,a,b);
  borders[1] = new R_Line2D(this,b,c);
  borders[2] = new R_Line2D(this,c,d);
  borders[3] = new R_Line2D(this,d,a);
}
