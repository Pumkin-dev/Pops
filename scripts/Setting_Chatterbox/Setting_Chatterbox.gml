// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Setting_Chatterbox(){
	with (oChatterbox)
	{
		if (!chatterbox_is_loaded("intro.yarn"))
		{
			chatterbox_add_function("StopSound", stop_sound)
			chatterbox_add_function("RoomGoTo", goTo_Room);
			chatterbox_add_function("GiveItem", GiveItem);
			chatterbox_add_function("CheckItem", CheckItem);
			chatterbox_add_function("CheckSprite", CheckSprite);
			chatterbox_add_function("BoxGoTo", goTo_Box);
			chatterbox_add_function("EndScene", EndScene);
			chatterbox_load_from_file("intro.yarn")
			chatterbox_load_from_file("hbed.yarn")
			chatterbox_load_from_file("staffdoor.yarn")
			chatterbox_load_from_file("phone_guy.yarn")
			chatterbox_load_from_file("hosdoor.yarn")
			chatterbox_load_from_file("cardiogram.yarn");
			chatterbox_load_from_file("bookshelf.yarn");
			chatterbox_load_from_file("plant.yarn");
			chatterbox_load_from_file("hfrontbed.yarn")
			intro_box = chatterbox_create("intro.yarn")
			hbed_box = chatterbox_create("hbed.yarn")
			staffdoor_box = chatterbox_create("staffdoor.yarn")
			hosdoor_box = chatterbox_create("hosdoor.yarn");
			phone_guy_box = chatterbox_create("phone_guy.yarn");
			cardiogram_box = chatterbox_create("cardiogram.yarn");
			bookshelf_box = chatterbox_create("bookshelf.yarn");
			plant_box = chatterbox_create("plant.yarn");
			hfrontbed_box = chatterbox_create("hfrontbed.yarn")
		}

		list = [hbed_box, staffdoor_box, hosdoor_box, intro_box, phone_guy_box, cardiogram_box,
		bookshelf_box, plant_box, hfrontbed_box];
	
		for (var i = 0; i < array_length(list); i++)
		{
			switch (LANG)
			{
				case "fr":
					chatterbox_goto(list[i], "Debut");
					break;
				case "en":
					chatterbox_goto(list[i], "Start")
					break;
			}
		}
	}
}