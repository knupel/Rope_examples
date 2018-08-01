/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017 
* Stan le Punk > http://stanlepunk.xyz/

Shader mix from incrustation to texture
v 0.0.2
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
	vec4 inverse_ratio = 1.0 -ratio;
  vec4 a = vec4(texture2D(texture,vertTexCoord.st) *ratio);
  vec4 b = vec4(texture2D(incrustation,vertTexCoord.st) *inverse_ratio);
  vec4 rgba = a+b;
  gl_FragColor = rgba;
}