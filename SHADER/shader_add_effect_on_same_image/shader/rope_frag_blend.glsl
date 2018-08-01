/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017 
* Stan le Punk > http://stanlepunk.xyz/
Shader blend from incrustation to texture
v 0.0.1
This shader is based on Thomas Diewald shader from PixelFlow
*/
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform sampler2D incrustation;
uniform vec4 ratio_channel;
uniform float blend;      



void main() {
  // vec4 inverse_ratio = 1.0 -ratio;
  vec4 tex = vec4(texture2D(texture,vertTexCoord.st));
  vec4 inc = vec4(texture2D(incrustation,vertTexCoord.st));
  
  tex *= ratio_channel;
  vec4 result = vec4(0);

  // blend effect
  //float blend_temp = blend *inc.a;
  float blend_temp = blend *inc.a ;
  // result = mix(inc, tex, blend_temp);
  result = mix(tex, inc, blend_temp);
  
  /*
  inc *= ratio;
  vec4 result = vec4(0);

  // blend effect
  float blend_temp = blend *inc.a;
  result = mix(tex, inc, blend_temp);
  */

  gl_FragColor = result;
}