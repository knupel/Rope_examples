/**
 * BASIC ROPE FRAMEWORK
 * 2021-2021
 * v 0.0.1
 * 
 * It's very import to use the function init_rope() or rope_version() before use the framework
 * If you don't do, you expose you to bad return like "Null pointer exception" when few function are used !!!
 * 
 * */

 void setup() {
	size(300,300);
	init_rope();
	rope_version();
	print_err("r",r);
	print_err("r.ROUGE",r.ROUGE);
}