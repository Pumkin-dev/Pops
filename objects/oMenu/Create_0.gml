draw_set_font(ConfusedHeart);
global.pause = true;


enum menu_page {
	 main,
	 settings,
	 audio,
	 difficulty,
	 graphics,
	 controls,
	 height
}

enum menu_element_type{
	script_runner,
	page_transfert,
	slider,
	shift,
	toggle,
    input 
}

enum MENUSTATE{
	LAUNCHING,
	CHOSING,
	FADING,
	FREE
}

enum MENUDRAW{
	LAUNCHING,
	CHOSING,
	FADING,
	FREE
}
draw_state = MENUDRAW.CHOSING
state = MENUSTATE.CHOSING;

//CREATE MENU PAGES
ds_menu_main = create_menu_page(
	["Start", menu_element_type.script_runner, resume_game],
    ["Resume",      menu_element_type.script_runner,   resume_game],
	["Settings",    menu_element_type.page_transfert,   menu_page.settings],
	["Exit",       menu_element_type.script_runner,   exit_game]
);

ds_settings = create_menu_page(
    ["Audio",       menu_element_type.page_transfert,   menu_page.audio],
	["Difficulty",  menu_element_type.page_transfert,   menu_page.difficulty],
	["Graphics",    menu_element_type.page_transfert,   menu_page.graphics],
	["Controls",    menu_element_type.page_transfert,   menu_page.controls],
	["Back",        menu_element_type.page_transfert,   menu_page.main],
);

ds_menu_audio = create_menu_page(
   ["Master",       menu_element_type.slider,          change_volume,         1,   [0,1]],
   ["Sound",        menu_element_type.slider,          change_volume,         1,   [0,1]],
   ["Music",	    menu_element_type.slider,          change_volume,         1,   [0,1]],
   ["Back",		    menu_element_type.page_transfert,   menu_page.settings],
);

ds_menu_difficulty = create_menu_page(
   ["Ennemies",      menu_element_type.shift,                 change_difficulty,     0,   ["HARMLESS","NORMAL","TERRIBLE"]],
   ["Allies",        menu_element_type.shift,                 change_difficulty,     0,   ["DIM-WITTED","NORMAL","HELPFUL"]],
   ["Back",          menu_element_type.page_transfert,  menu_page.settings],
);

ds_menu_graphics =  create_menu_page(
    ["Resolution",  menu_element_type.shift,          change_resolution,      0,   ["384 x 216", "768 x 432", "1152 x 648" , "1536 x 874", "1920 x 1080"]],
	["Window Mode", menu_element_type.toggle,         change_window_mode,     true,   ["FULLSCREEN", "WINDOWED"]],
	["Back",        menu_element_type.page_transfert, menu_page.settings],
);

ds_menu_controls = create_menu_page(													  
   ["Up",			menu_element_type.input,			  "key_up",              vk_up],
   ["Left", 		menu_element_type.input,			  "key_left",            vk_left],
   ["Right",        menu_element_type.input, 		      "key_right",           vk_right],
   ["Down",	        menu_element_type.input,			  "key_down",             vk_down],
   ["Back",         menu_element_type.page_transfert,  menu_page.settings],
);

page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_difficulty, ds_menu_graphics, ds_menu_controls]

var i = 0, array_len = array_length(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++
}
opacity = 1;
inputting = false;