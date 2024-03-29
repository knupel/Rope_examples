/**
* Rope framework
* Copyleft (c) 2014-2023
* @author @knupel
* @see https://github.com/knupel/Rope_framework
*
*/

/**
* FOLDER EXPLORATION
* V 0.2.1
* 2019-2021

* void explore_folder(String path, String... extension);
* void explore_folder(String path, boolean check_sub_folder, String... extension);
* String folder();
* ArrayList<File> get_files();
* void select_folder();
* void select_folder(String message);
* boolean folder_input_default_is() ;
*/
void setup() {
	size(300,300);
	rope_version();
	String callback_function = "rope_select_folder";
	select_folder(callback_function);
}


void draw() {
	boolean explore_sub_folder = true;
	String [] ext = {"jpg", "jpeg"};
	explore_folder(folder(),explore_sub_folder,ext); 

	if(get_files() != null && get_files().size() > 0) {
		println("size",get_files().size());
		for(File f : get_files()) {
			println(f);
		}
		exit();
	}
}
