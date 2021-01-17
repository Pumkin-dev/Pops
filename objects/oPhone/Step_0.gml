if(!global.pause) exit;


input_up_p      = keyboard_check_pressed(global.key_up);
input_down_p    = keyboard_check_pressed(global.key_down);
input_enter_p   = keyboard_check_pressed(global.key_enter);

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

if(inputting){

} else {
    var ochange = input_down_p - input_up_p;
    if(ochange != 0){
	   menu_option[page] += ochange;
	   if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
	   if(menu_option[page] < 0) { menu_option[page] = ds_height -1; }
	   //audio_play_sound(snd_select, 5, false);
    }
}

if(PRESSEDZKEY){
	switch(ds_grid[# 1, menu_option[page]]){
		 case menu_element_type.script_runner:
			script_execute(ds_grid[# 2, menu_option[page]]);
			break;
		 case menu_element_type.page_transfert: page = ds_grid[# 2, menu_option[page]]; break
		 case menu_element_type.shift:
		 case menu_element_type.slider:
		 case menu_element_type.toggle:
		 case menu_element_type.input:
		     inputting = !inputting;
			 break;
	}
	
	//audio_play_sound(snd_pickup, 5, false);
}
		
