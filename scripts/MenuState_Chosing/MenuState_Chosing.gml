// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MenuState_Chosing(){
	if(!global.pause) exit;

	if (!instance_exists(oSprIntro))
	{
		instance_create_layer(0, 0, layer, oSprIntro);
	}
	var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);

	if(inputting){
		switch(ds_grid[# 1, menu_option[page]]){
			 case menu_element_type.shift:
				var hinput = PRESSEDRIGHTKEY - PRESSEDLEFTKEY;
				
				if (hinput != 0)
				{
					//audio
					ds_grid[# 3, menu_option[page]] += hinput;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length(ds_grid[# 4, menu_option[page]])) 
				}
				break;
			 case menu_element_type.slider:
				var hinput = RIGHTKEY - LEFTKEY;
				switch (menu_option[page])
				{
					case 0:
					case 1:
						if (!audio_is_playing(snd_door)) { audio_play_sound(snd_door, false, false); }
						break;
				}
				
				if (hinput != 0)
				{
					//audio
					ds_grid[# 3, menu_option[page]] += hinput * 0.01;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1) 
				}
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); 
				break;
			 case menu_element_type.toggle:
				var hinput = PRESSEDRIGHTKEY - PRESSEDLEFTKEY;
				
				if (hinput != 0)
				{
					//audio
					ds_grid[# 3, menu_option[page]] += hinput;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1); 
				}
				break;
			 case menu_element_type.input:
				
				 break;
		}

	} 
	else {
	    var ochange = PRESSEDDOWNKEY - PRESSEDUPKEY;
	    if(ochange != 0){
		   menu_option[page] = Wrap(menu_option[page] + ochange, 0, ds_height - 1);
	    }
	}

	if(PRESSEDZKEY){
		switch(ds_grid[# 1, menu_option[page]]){
			 case menu_element_type.script_runner:
				script_execute(ds_grid[# 2, menu_option[page]]);
				break;
			 case menu_element_type.page_transfert: 
				 page = ds_grid[# 2, menu_option[page]];
				 break;
			 case menu_element_type.shift:
			 case menu_element_type.slider:
			 case menu_element_type.toggle:
				if (inputting) { script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
			 case menu_element_type.input:
			     inputting = !inputting;
				 break;
		}
	
		//audio_play_sound(snd_pickup, 5, false);
	}
	if (PRESSEDXKEY)
	{
		if (ds_grid[# 1, ds_height - 1] == menu_element_type.page_transfert)
		{
			page = ds_grid[# 2, ds_height - 1];
		}
	}

}