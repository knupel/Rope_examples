/**
* Simple shader to change the color of your texture
*/
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;
uniform vec4 colour;       



void main() {
  float r = texture2D(texture,vertTexCoord.st).r *colour.x;
  float g = texture2D(texture,vertTexCoord.st).g *colour.y;
  float b = texture2D(texture,vertTexCoord.st).b *colour.z;  
  float a = texture2D(texture,vertTexCoord.st).a *colour.w;  


  gl_FragColor = vec4(r,g,b,a);
}