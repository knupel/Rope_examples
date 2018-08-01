/**
ROPE - Romanesco processing environment – 
* Copyleft (c) 2014-2017 
* Stan le Punk > http://stanlepunk.xyz/
Shader level color from texture
v 0.0.1
*/
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec4 level;       



void main() {
  vec4 rgba = vec4(texture2D(texture,vertTexCoord.st) *level);
  gl_FragColor = rgba;
}