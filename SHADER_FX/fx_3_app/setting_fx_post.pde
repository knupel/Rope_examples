/**
* SETTING FX POST method
* v 0.2.6
* 2019-2019
*/


// INCRUSTATION
// mix
/*
* 1 multiply
* 2 screen
* 3 exclusion
* 4 overlay
* 5 hard_light
* 6 soft_light
* 7 color_dodge
* 8 color_burn
* 9 linear_dodge
* 10 linear_burn
* 11 vivid_light
* 12 linear_light
* 13 pin_light
* 14 hard_mix
* 15 subtract
* 16 divide
* 17 addition
* 18 difference
* 19 darken
* 20 lighten
* 21 invert
* 22 invert_rgb
* 23 main
* 24 layer
*/
int mode = 1;
void fx_inc(PImage src) {
  boolean on_g = true;
  boolean filter_is = true;
  if(mousePressed) {
    mode = ceil(random(22));
    println("mode",mode);
  }
  
  // int mode = 2;
  // vec3 level_source = vec3(1);
  vec3 level_source = abs(vec3().sin_wave(frameCount,.01,.02,.03));
  vec3 level_layer = abs(vec3().cos_wave(frameCount,.02,.04,.01));
  if(src.width == inc_fx.width && src.height == inc_fx.height) {
    fx_mix(src,inc_fx,on_g,filter_is,mode,level_source,level_layer);
  }
}












// CLASSIC POST FX
void setting_fx_post(ArrayList<R_FX> fx_list, boolean on_g) {
  setting_blur_circular(fx_list,on_g);
  setting_blur_gaussian(fx_list,on_g);
  setting_blur_radial(fx_list,on_g);

  setting_colour_change_a(fx_list,on_g);
  setting_colour_change_b(fx_list,on_g);
  
  setting_datamosh(fx_list,on_g);
  setting_dither_bayer_8(fx_list,on_g);

  setting_flip(fx_list,on_g);

  setting_grain(fx_list,on_g);
  setting_grain_scatter(fx_list,on_g);

  setting_haltone_dot(fx_list,on_g);
  setting_haltone_line(fx_list,on_g);
  setting_haltone_multi(fx_list,on_g);

  setting_image(fx_list,on_g);

  setting_level(fx_list,on_g);

  setting_mask(fx_list,on_g);
  setting_mix(fx_list,on_g);

  setting_pixel(fx_list,on_g);

  setting_reac_diff(fx_list,on_g);

  setting_split(fx_list,on_g);

  setting_threshold(fx_list,on_g);

  setting_warp_proc(fx_list,on_g);
  setting_warp_tex_a(fx_list,on_g);
  setting_warp_tex_b(fx_list,on_g);
}



// blur circular
String set_blur_circular = "blur circular";
void setting_blur_circular(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_blur_circular,FX_BLUR_CIRCULAR);
  fx_set_on_g(fx_list,set_blur_circular,on_g);
  fx_set_pg_filter(fx_list,set_blur_circular,true);
  fx_set_num(fx_list,set_blur_circular,36);
  float strength = map(mouseX,0,width,0,100);
  fx_set_strength(fx_list,set_blur_circular,strength);
}


// blur gaussian
String set_blur_gaussian = "blur gaussian";
void setting_blur_gaussian(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_blur_gaussian,FX_BLUR_GAUSSIAN);
  fx_set_on_g(fx_list,set_blur_gaussian,on_g);
  fx_set_pg_filter(fx_list,set_blur_gaussian,true);
  float x = mouseX -(width/2);
  int max_blur = 40;
  float size = map(abs(x),0,width/2,0,max_blur);
  fx_set_strength(fx_list,set_blur_gaussian,size);
}


// blur radial
String set_blur_radial = "blur radial";
float current_scale_blur_radial;
void setting_blur_radial(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_blur_radial,FX_BLUR_RADIAL);
  fx_set_on_g(fx_list,set_blur_radial,on_g);
  fx_set_pg_filter(fx_list,set_blur_radial,true);
  
  vec2 pos = vec2();
  if(get_fx(fx_list,set_blur_radial).get_pos() != null) pos = vec2(get_fx(fx_list,set_blur_radial).get_pos()).copy();
  if(mousePressed) {
    pos.x(map(mouseX,0,width,0,1));
    pos.y(map(mouseY,0,height,0,1));
  }
  fx_set_pos(fx_list,set_blur_radial,pos.x,pos.y);

  // scale
  float arg = get_wheel_scale();
  int range_blur = 10;
  current_scale_blur_radial += arg *.01;
  if(current_scale_blur_radial < -range_blur) {
    current_scale_blur_radial = -range_blur;
  } else if(current_scale_blur_radial > range_blur) {
    current_scale_blur_radial = range_blur;
  }
  fx_set_scale(fx_list,set_blur_radial,current_scale_blur_radial);

  float strength = map(sin(frameCount *.01),-1,1,5,100);
  fx_set_strength(fx_list,set_blur_radial,strength);
}









// colour change
String set_colour_change_a = "colour change A";
void setting_colour_change_a(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_colour_change_a,FX_COLOUR_CHANGE_A);
  fx_set_on_g(fx_list,set_colour_change_a,on_g);
  fx_set_pg_filter(fx_list,set_colour_change_a,true);
  
  if(mousePressed) {
    vec3 m0 = vec3().sin_wave(frameCount,.001,.02,.005).mult(10);
    vec3 m1 = vec3().cos_wave(frameCount,.001,.02,.005).mult(10);
    vec3 m2 = vec3().sin_wave(frameCount,.01,.002,.002).mult(10);
    // vec3 m0 = vec3(-1,0,1);
    // vec3 m1 = vec3(1,0,-1);
    // vec3 m2 = vec3(-1,0,1); 
    fx_set_matrix(fx_list,set_colour_change_a,0,m0.array());
    fx_set_matrix(fx_list,set_colour_change_a,1,m1.array());
    fx_set_matrix(fx_list,set_colour_change_a,2,m2.array());
    
    int num = (int)map(mouseX,0,width,1,32);
    fx_set_num(fx_list,set_colour_change_a,num);
  }
}


// line
String set_colour_change_b = "colour change B";
void setting_colour_change_b(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_colour_change_b,FX_COLOUR_CHANGE_B);
  fx_set_on_g(fx_list,set_colour_change_b,on_g);
  fx_set_pg_filter(fx_list,set_colour_change_b,true);
  if(mousePressed) {
    float angle = map(mouseX,0,width,-PI,PI);
    fx_set_angle(fx_list,set_colour_change_b,angle);
    float strength = map(mouseY,0,height,1,10);
    fx_set_strength(fx_list,set_colour_change_b,strength);
  }
}






// dither bayer 8
String set_datamosh = "datamosh";
void setting_datamosh(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_datamosh,FX_DATAMOSH);
  fx_set_on_g(fx_list,set_datamosh,on_g);
  fx_set_pg_filter(fx_list,set_datamosh,true);

  if(mousePressed) {
    float threshold = abs(sin(frameCount *.01)) *0.1;
   // println("threshold",threshold);
    fx_set_threshold(fx_list,set_datamosh,threshold);
    vec2 offset_red = vec2().sin_wave(frameCount,.01,.02).mult(.1);
    vec2 offset_green = vec2().cos_wave(frameCount,.001,.01).mult(.1);
    vec2 offset_blue = vec2().sin_wave(frameCount,.005,.002).mult(.1);
    fx_set_pair(fx_list,set_datamosh,0,offset_red.array());
    fx_set_pair(fx_list,set_datamosh,1,offset_green.array());
    fx_set_pair(fx_list,set_datamosh,2,offset_blue.array());

    float strength = map(mouseX,0,width,-100,100);
    fx_set_strength(fx_list,set_datamosh,strength);
  }
}





// dither bayer 8
String set_dither_bayer_8 = "dither bayer 8";
void setting_dither_bayer_8(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_dither_bayer_8,FX_DITHER_BAYER_8);
  fx_set_on_g(fx_list,set_dither_bayer_8,on_g);
  fx_set_pg_filter(fx_list,set_dither_bayer_8,true);

  if(keyPressed) {
    fx_set_mode(fx_list,set_dither_bayer_8,0); // gray dither
  } else {
    fx_set_mode(fx_list,set_dither_bayer_8,1); // rgb dither
  }

  if(mousePressed) {
    float level_x = abs(sin(frameCount*.002)); // for gray and rgb model
    float level_y = abs(sin(frameCount*.001)); // for the rgb model
    float level_z = abs(sin(frameCount*.005)); // for the rgb model
    fx_set_level_source(fx_list,set_dither_bayer_8,level_x,level_y,level_z);
  }
}




// grain
String set_flip = "flip";
void setting_flip(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_flip,FX_FLIP);
  fx_set_on_g(fx_list,set_flip,on_g);
  fx_set_pg_filter(fx_list,set_flip,true);
  fx_set_event(fx_list,set_flip,0,mousePressed,keyPressed);
}







// grain
String set_grain = "grain";
void setting_grain(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_grain,FX_GRAIN);
  fx_set_on_g(fx_list,set_grain,on_g);
  fx_set_pg_filter(fx_list,set_grain,true);
  float grain = random(1);
  fx_set_offset(fx_list,set_grain,grain);
  int mode = 1;
  fx_set_mode(fx_list,set_grain,mode);
 
}






// grain scatter
String set_grain_scatter = "grain scatter";
void setting_grain_scatter(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_grain_scatter,FX_GRAIN_SCATTER);
  fx_set_on_g(fx_list,set_grain_scatter,on_g);
  fx_set_pg_filter(fx_list,set_grain_scatter,true);
  if(mousePressed) {
    float strength = map(mouseX,0,width,-100,100);
    fx_set_strength(fx_list,set_grain_scatter,strength);
  }
}






// halftone dot
String set_halftone_dot = "haltone dot";
void setting_haltone_dot(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_halftone_dot,FX_HALFTONE_DOT);
  fx_set_on_g(fx_list,set_halftone_dot,on_g);
  fx_set_pg_filter(fx_list,set_halftone_dot,true);

  if(mousePressed) {
    fx_set_threshold(fx_list,set_halftone_dot,sin(frameCount *.01));
    fx_set_pos(fx_list,set_halftone_dot,mouseX,mouseY);
    fx_set_size(fx_list,set_halftone_dot,(abs(sin(frameCount *.01))) *30 +1);
    fx_set_angle(fx_list,set_halftone_dot,sin(frameCount *.001) *TAU);
  }
}






// halftone line
String set_halftone_line = "halftone line";
void setting_haltone_line(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_halftone_line,FX_HALFTONE_LINE);
  fx_set_on_g(fx_list,set_halftone_line,on_g);
  fx_set_pg_filter(fx_list,set_halftone_line,true);

  if(mousePressed) {
    fx_set_mode(fx_list,set_halftone_line,0); 
    int num_line = (int)map(mouseY,0,height,20,100); 
    fx_set_num(fx_list,set_halftone_line,num_line);  
    fx_set_quality(fx_list,set_halftone_line,.2);

    float threshold = map(mouseY,0,height,0,1);
    fx_set_threshold(fx_list,set_halftone_line,threshold);
    // float angle = sin(frameCount *.001) * PI;

    float angle = map(mouseX,0,width,-TAU,TAU);
    fx_set_angle(fx_list,set_halftone_line,angle);

    float px = map(width/2,0,width,0,1); // normal position
    float py = map(height/2,0,height,0,1); // normal position
    fx_set_pos(fx_list,set_halftone_line,px,py);
  }
}





// halftone multi
String set_halftone_multi = "halftone multi";
void setting_haltone_multi(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_halftone_multi,FX_HALFTONE_MULTI);
  fx_set_on_g(fx_list,set_halftone_multi,on_g);
  fx_set_pg_filter(fx_list,set_halftone_multi,true);

  if(mousePressed) {
    float px = map(mouseX,0,width,0,1);
    float py = map(mouseY,0,height,0,1);
    fx_set_pos(fx_list,set_halftone_multi,px,py); // 0 to 1
    float quality = 2;
    // float quality = map(mouseX,0,width,0,32);
    fx_set_quality(fx_list,set_halftone_multi,quality); // 1 to 16++

    // float size =.9;
    float size = 1 + abs(sin(frameCount *.01))*1;
    fx_set_size(fx_list,set_halftone_multi,size); // 0 to 2++

    // float angle = 0;
    float angle = sin(frameCount *.001) *TAU;
    fx_set_angle(fx_list,set_halftone_multi,angle); // in radians
    
    float threshold = .2;
    // float threshold = map(mouseY,0,height,0,2);
    fx_set_threshold(fx_list,set_halftone_multi,threshold); // from 0 to 2++
    
    float saturation = abs(sin(frameCount *.01));
    // float saturation = .5;
    fx_set_saturation(fx_list,set_halftone_multi,saturation); // from 0 to 1
    // fx_set_pos(fx_list,set_halftone_multi,mouseX,mouseY);
    fx_set_mode(fx_list,set_halftone_multi,0); // from 0 to 2
  }
}








// image
String set_image = "image";
void setting_image(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_image,FX_IMAGE);
  fx_set_on_g(fx_list,set_image,on_g);
  fx_set_pg_filter(fx_list,set_image,true);

  if(mousePressed) {
    float px = map(mouseX,0,width,0,1);
    float py = map(mouseY,0,height,0,1);
    fx_set_pos(fx_list,set_image,px,py);

    vec3 rgb = abs(vec3().sin_wave(frameCount,.01,.02,.03));
    fx_set_colour(fx_list,set_image,rgb.red(),rgb.blu(),rgb.gre());

    // float size =.9;
    float scale = abs(sin(frameCount *.02))*3;
    fx_set_size(fx_list,set_image,scale,scale); // 0 to 2++

    float curtain_pos = abs(sin(frameCount *.05)) *.5;
    fx_set_cardinal(fx_list,set_image,curtain_pos,curtain_pos,curtain_pos,curtain_pos); // 0 to 2++
  }

  fx_set_mode(fx_list,set_image,r.SCALE);
}







// level
String set_level = "level";
void setting_level(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_level,FX_LEVEL);
  fx_set_on_g(fx_list,set_level,on_g);
  fx_set_pg_filter(fx_list,set_level,true);
  fx_set_mode(fx_list,set_level,0);
  if(mousePressed) {
    vec3 level = abs(vec3().sin_wave(frameCount,.01,.02,.04));
    fx_set_level_source(fx_list,set_level,level.array());
  }
}



// mask
String set_mask = "mask";
void setting_mask(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_mask,FX_MASK);
  fx_set_on_g(fx_list,set_mask,on_g);
  fx_set_pg_filter(fx_list,set_mask,true);
  fx_set_mode(fx_list,set_mask,0);
  fx_set_num(fx_list,set_mask,12);
}



// mix
/*
* 1 multiply
* 2 screen
* 3 exclusion
* 4 overlay
* 5 hard_light
* 6 soft_light
* 7 color_dodge
* 8 color_burn
* 9 linear_dodge
* 10 linear_burn
* 11 vivid_light
* 12 linear_light
* 13 pin_light
* 14 hard_mix
* 15 subtract
* 16 divide
* 17 addition
* 18 difference
* 19 darken
* 20 lighten
* 21 invert
* 22 invert_rgb
* 23 main
* 24 layer
*/
String set_mix = "mix";
void setting_mix(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_mix,FX_MIX);
  fx_set_on_g(fx_list,set_mix,on_g);
  fx_set_pg_filter(fx_list,set_mix,true);
  // fx_set_mode(set_mix,1); // produit - multiply
  fx_set_mode(fx_list,set_mix,8); 

  vec3 level_source = abs(vec3().sin_wave(frameCount,.001,.003,.005));
  vec3 level_layer = abs(vec3().cos_wave(frameCount,.002,.001,.001));
  fx_set_level_source(fx_list,set_mix,level_source.array());
  fx_set_level_layer(fx_list,set_mix,level_layer.array());

}









// pixel
String set_pixel = "pixel";
boolean effect_pixel_is;
void setting_pixel(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_pixel,FX_PIXEL);
  fx_set_on_g(fx_list,set_pixel,on_g);
  fx_set_pg_filter(fx_list,set_pixel,true);

  if(reset_is()) {
    effect_pixel_is = !!((effect_pixel_is == false));
  }
  fx_set_event(fx_list,set_pixel,0,effect_pixel_is);

  if(mousePressed) {
    if(frameCount%10 == 0) {
      vec2 pix_size = vec2().rand(new vec2(1,width/10), new vec2(1,height/10));
      fx_set_size(fx_list,set_pixel,pix_size.array());
      int num = ceil(random(2,16));
      fx_set_num(fx_list,set_pixel,num);
    }
    
    float h = abs(sin(frameCount *.01)); // from 0 to 1 where
    float s = map(mouseY,0,height,0,1); // from 0 to 1 where
    float b = map(mouseX,0,width,0,1); // from 0 to 1 where
    if(s < 0) s = 0; else if (s > 1) s = 1;
    if(b < 0) b = 0; else if (b > 1) s = 1;
    fx_set_level_source(fx_list,set_pixel,h,s,b);
  }
}








String set_reac_diff = "reaction diffusion";
void setting_reac_diff(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_reac_diff,FX_REAC_DIFF);
  fx_set_on_g(fx_list,set_reac_diff,on_g);
  fx_set_pg_filter(fx_list,set_reac_diff,true);

    float ru = 0.25f;
  float rv = 0.04f;
  fx_set_pair(fx_list,set_reac_diff,0,ru,rv);
  
  float k = 0.047f;
  float f = 0.1f;
  fx_set_pair(fx_list,set_reac_diff,1,k,f);
  
  // color part not use now
  float r = 0;
  float g = 0;
  float b = 0;
  fx_set_colour(fx_list,set_reac_diff,r,g,b);

  boolean event = mousePressed;
  fx_set_event(fx_list,set_reac_diff,0,event);

   vec2 scale = new vec2(.6);
   fx_set_scale(fx_list,set_reac_diff,scale.array());

  int rd_iteration = 20;
  fx_set_num(fx_list,set_reac_diff,rd_iteration);
  
}









String set_split = "split rgb";
void setting_split(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_split,FX_SPLIT_RGB);
  fx_set_on_g(fx_list,set_split,on_g);
  fx_set_pg_filter(fx_list,set_split,true);

  if(mousePressed) {
    /*
    float ox_red = map(mouseX,0,width,0,1);
    float oy_red = map(mouseY,0,height,0,1);
    */
    vec2 offset_red = new vec2().cos_wave(frameCount,.01,.02);
    vec2 offset_green = new vec2().sin_wave(frameCount,.01,.02);
    vec2 offset_blue = new vec2().cos_wave(frameCount,.004,.01);
    fx_set_pair(fx_list,set_split,0,offset_red.array());
    fx_set_pair(fx_list,set_split,1,offset_green.array());
    fx_set_pair(fx_list,set_split,2,offset_blue.array());
  }
}



// dither
String set_threshold = "threshold";
void setting_threshold(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_threshold,FX_THRESHOLD);
  fx_set_on_g(fx_list,set_threshold,on_g);
  fx_set_pg_filter(fx_list,set_threshold,true);

  if(keyPressed) {
    fx_set_mode(fx_list,set_threshold,0); // gray threshold
  } else {
    fx_set_mode(fx_list,set_threshold,1); // rgb threshold
  }

  if(mousePressed) {
    float level_x = map(mouseX,0,width,0,1); // for gray and rgb model
    float level_y = abs(sin(frameCount*.01)); // for the rgb model
    float level_z = abs(sin(frameCount*.004)); // for the rgb model
    fx_set_level_source(fx_list,set_threshold,level_x,level_y,level_z);
  }
}



// WARP setting
String set_warp_proc = "warp procedural";
void setting_warp_proc(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_warp_proc,FX_WARP_PROC);
  fx_set_on_g(fx_list,set_warp_proc,on_g);
  fx_set_pg_filter(fx_list,set_warp_proc,true);
  if(mousePressed) {
    fx_set_strength(fx_list,set_warp_proc,map(mouseX,0,width,5,20));
  }
}


String set_warp_tex_a = "warp textural A";
void setting_warp_tex_a(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_warp_tex_a,FX_WARP_TEX_A);
  fx_set_on_g(fx_list,set_warp_tex_a,on_g);
  fx_set_pg_filter(fx_list,set_warp_tex_a,true);

  fx_set_mode(fx_list,set_warp_tex_a,0);
  if(mousePressed) {
    fx_set_strength(fx_list,set_warp_tex_a,map(mouseX,0,width,-1,1));
  }
}





String set_warp_tex_b = "warp textural B";
void setting_warp_tex_b(ArrayList<R_FX> fx_list, boolean on_g) {
  init_fx(fx_list,set_warp_tex_b,FX_WARP_TEX_B);
  fx_set_on_g(fx_list,set_warp_tex_b,on_g);
  fx_set_pg_filter(fx_list,set_warp_tex_b,true);
  
  if(mousePressed) {
    float strength = map(mouseX,0,width,-.2,.2);
    fx_set_strength(fx_list,set_warp_tex_b,strength);
  }
}
