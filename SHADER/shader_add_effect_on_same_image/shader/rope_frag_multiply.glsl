/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017 
* Stan le Punk > http://stanlepunk.xyz/
Shader mix from incrustation to texture
Multiply effect
v 0.0.1
*/
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform sampler2D incrustation;
uniform vec4 ratio;   
   



void main() {
  vec4 a = vec4(texture2D(texture,vertTexCoord.st));
  vec4 b = vec4(texture2D(incrustation,vertTexCoord.st) *ratio);
  vec4 rgba = a*b;
  gl_FragColor = rgba;
}