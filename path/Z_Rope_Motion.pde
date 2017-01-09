/**
Class Motion 3.0.4
Rope – Romanesco Processing Environment – 2015 – 2017
* @author Stan le Punk
* @see https://github.com/StanLepunK/Motion
*/

class Motion {
  float velocity = 1. ;
  float acceleration ;
  float deceleration ;
  

  Motion() {
  }


  void stop_inertia() {
    inertia(Vec3(), 0, 0) ;
  }

  // apply_intertia
  Vec3 mouse_ref_apply_in ; 

  Vec2 apply_inertia(Vec2 current_pos, Vec2 my_pos, float braking, float max_speed) {
    Vec3 current_pos_3D = Vec3(current_pos) ;
    Vec3 my_pos_3D = Vec3(my_pos) ;
    Vec3 apply = apply_inertia(current_pos_3D, my_pos_3D, braking, max_speed) ;
    return Vec2(apply.x, apply.y) ;
  }

  Vec3 apply_inertia(Vec3 current_pos, Vec3 my_pos, float braking, float max_speed) {
    if(mouse_ref_apply_in == null) mouse_ref_apply_in = Vec3(my_pos) ;

    Vec3 inertia = inertia(current_pos, braking, max_speed) ;
    if(inertia.equals(Vec3(0))) {
      my_pos.sub(sub(mouse_ref_apply_in, current_pos)) ; ;
    } else {
      my_pos.add(inertia) ;
    }
    mouse_ref_apply_in.set(current_pos) ;
    return my_pos ;
  }



  // intertia
  float vel_in ;
  Vec3 dir_in  ;
  Vec3 for_vel_in ;
  Vec3 for_dir_in ;
  Vec3 mouse_in ;

  Vec2 inertia(Vec2 current_pos, float braking, float max_speed) {
    Vec3 current_pos_3D = Vec3(current_pos) ;
    Vec3 inertia = inertia(current_pos_3D, braking, max_speed) ;
    return Vec2(inertia.x, inertia.y) ;
  }

  Vec3 inertia(Vec3 current_pos, float braking, float max_speed) {
    // init var
    if(dir_in == null) dir_in = Vec3() ;
    if(for_vel_in == null) for_vel_in = Vec3() ;
    if(for_dir_in == null) for_dir_in = Vec3() ;
    if(mouse_in == null) mouse_in = Vec3() ;


    Vec3 inertia = Vec3() ;
    mouse_in.set(current_pos) ;

    if(for_vel_in.equals(mouse_in)) {
      // limit speed
      if (abs(vel_in) > max_speed) {
        if(vel_in < 0) {
          vel_in = -max_speed ;
        } else {
          vel_in = max_speed ;
        }
      }
       // braking
      if(vel_in > 0) {
        vel_in -= braking ;
        if(vel_in < 0) vel_in = 0 ;
      } else if(vel_in < 0 ) {
        vel_in += braking ;
        if(vel_in > 0) vel_in = 0 ;
      }

      // update pos
      inertia = mult(dir_in, vel_in) ;
    } else {
      vel_in = dist(mouse_in, for_vel_in) ;
      dir_in = sub(mouse_in,for_dir_in) ;
      dir_in.normalize() ;
    }
    for_vel_in.set(current_pos) ;
    println("inertia vel", vel_in) ;
    if(frameCount%15 == 0) for_dir_in.set(current_pos) ;
    //
    return inertia ;
  }
}







/**
PATH
*/
class Path extends Motion {
  // list of the keypoint, use super_class Path
  ArrayList<Vec3> path ;
  // distance between the keypoint and the position of the translation shape
  float dist_from_start = 0 ;
  float dist_a_b = 0 ;

  // a & b are points to calculate the direction and position of the translation to give at the shape
  // Vec3 origin, target ;
  // speed ratio to adjust the speed xy according to position target
  Vec3 ratio  ;
  //keypoint 
  Vec3 pos ;
  

  // find a good keypoint in the ArrayList
  int n = 0 ;
  int m = 1 ;

  Path() {
    // super() ;
    path = new ArrayList<Vec3>() ;
    pos = Vec3(MAX_INT) ;
  }
   // set
   void set_velocity(float velocity) {
    if(velocity < 0) {
      System.err.println("negative value, class Path use the abslolute value of") ;
      System.err.println(velocity) ;
    }
    this.velocity = abs(velocity) ;
   }

  

  // next
  public void previous() {
    Vec3 origin, target ;
    if (path.size() > 1 ) {
      Vec3 key_a = Vec3() ;
      Vec3 key_b = Vec3() ;
      int origin_rank = path.size() - n -1 ;
      int target_rank = path.size() - m -1 ;
      key_a = (Vec3) path.get(origin_rank) ;
      key_b = (Vec3) path.get(target_rank) ;

      origin = Vec3(key_a) ;
      target = Vec3(key_b) ;
      go(origin, target) ;

    } else if (path.size() == 1) {
      Vec3 key_a = (Vec3) path.get(0) ;
      origin = Vec3(key_a) ;
      pos.set(origin) ;
    } else {
      pos.set(-100) ;
    }
  }






  // next
  public void next() {
    Vec3 origin, target ;
    if (path.size() > 1 ) {
      Vec3 key_a = Vec3() ;
      Vec3 key_b = Vec3() ;
      key_a = (Vec3) path.get(n) ;
      key_b = (Vec3) path.get(m) ;

      origin = Vec3(key_a) ;
      target = Vec3(key_b) ;
      go(origin, target) ;

    } else if (path.size() == 1) {
      Vec3 key_a = (Vec3) path.get(n) ;
      origin = Vec3(key_a) ;
      pos.set(origin) ;
    } else {
      pos.set(-100) ;
    }
  }




  // private method of class
  private void go(Vec3 origin, Vec3 target) {
    if(pos.equals(Vec3(MAX_INT))) {
      pos.set(origin) ;
    }
    // distance between the keypoint a & b and the position of the translation shape
    dist_a_b = origin.dist(target) ;
    dist_from_start = pos.dist(origin) ;
    //update the position
    if (dist_from_start < dist_a_b) {
      // calcul speed ratio
      Vec3 speed_ratio = sub(origin,target) ;

      // final calcul ratio
      if(ratio == null) {
        ratio = Vec3() ;
      }
      ratio.x = speed_ratio.x / speed_ratio.y ;
      ratio.y = speed_ratio.y / speed_ratio.x ;
      if(abs(ratio.x) > abs(ratio.y) ) { 
        ratio.x = 1.0 ; ratio.y = abs(ratio.y) ; 
      } else { 
        ratio.x = abs(ratio.x) ; ratio.y = 1.0 ; 
      }
      
      // Give the good direction to the translation
      if (speed_ratio.x == 0) {
        pos.x += 0 ;
        if (origin.y - target.y < 0 )  {
          pos.y += velocity ; 
        } else {
          pos.y -= velocity ;
        }
      } 
      if (speed_ratio.y == 0) {
        pos.y += 0 ;
        if (origin.x - target.x < 0 ) {
          pos.x += velocity ; 
        } else {
          pos.x -= velocity ;
        }     
      }

      if (speed_ratio.x != 0 && speed_ratio.y != 0  )  {
        if (origin.x - target.x < 0 ) {
          pos.x += (velocity *ratio.x) ; 
        } else {
          pos.x -= (velocity *ratio.x) ;
        }
        if (origin.y - target.y < 0 ) {
          pos.y += (velocity *ratio.y) ; 
        } else {
          pos.y -= (velocity *ratio.y) ;
        }
      }
    } else {
      n++ ; 
      m++ ;
    }
    //change to the next keypoint 
    if (target.equals(pos)) {  
      m++ ; 
      n++ ; 
    }
    
    if (n != path.size() && m == 1) { 
      m = 1 ; 
      n = 0 ; 
    }
    
    if (m == path.size()) { 
      m = 0 ; 
    }
    
    if (n == path.size()) { 
      n = 0 ; 
    } 
  }









  // get
  Vec3 get_pos() {
    return pos ;
  }

  int path_size() {
    return path.size() ;
  }

  Vec3 [] path() {
    Vec3 [] list = new Vec3[path.size()] ;
    for(int i = 0 ; i < path.size() ; i++) {
      list[i] = path.get(i).copy() ;
    }
    return list ;
  }

  ArrayList<Vec3> path_ArrayList() {
    return path ;
  }
  

  // add point to the list to make the path
  void add(Vec coord) {
    path.add(Vec3(coord.x,coord.y,coord.z)) ;
  }
  void add(int x, int y, int z) {
    path.add(Vec3(x,y,z)) ;
  }

  void add(int x, int y) {
    path.add(Vec3(x,y,0)) ;
  }
}