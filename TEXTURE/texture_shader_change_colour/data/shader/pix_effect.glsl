#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
 
#define PROCESSING_TEXTURE_SHADER
 
uniform sampler2D texture;
 
varying vec4 vertColor;

 
void main(void) {         
    gl_FragColor = vertColor;  
}
