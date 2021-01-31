// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Setting_Chatterbox(){
	chatterbox_add_function("StopSound", stop_sound)
	chatterbox_add_function("RoomGoTo", goTo_Room);
	chatterbox_load_from_file("intro.yarn")
	chatterbox_load_from_file("hbed.yarn")
	chatterbox_load_from_file("staffdoor.yarn")
	chatterbox_load_from_file("phone_guy.yarn")
	chatterbox_load_from_file("hosdoor.yarn")
	chatterbox_load_from_file("cardiogram.yarn");
	chatterbox_load_from_file("caca.yarn");
	caca_box = chatterbox_create("caca.yarn")
	intro_box = chatterbox_create("intro.yarn")
	hbed_box = chatterbox_create("hbed.yarn")
	staffdoor_box = chatterbox_create("staffdoor.yarn")
	hosdoor_box = chatterbox_create("hosdoor.yarn");
	phone_guy_box = chatterbox_create("phone_guy.yarn");
	cardiogram_box = chatterbox_create("cardiogram.yarn")

	list = [hbed_box, staffdoor_box, hosdoor_box, intro_box, phone_guy_box, cardiogram_box, caca_box];
	
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