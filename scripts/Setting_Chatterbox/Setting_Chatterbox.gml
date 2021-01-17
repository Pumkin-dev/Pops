// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Setting_Chatterbox(){
	chatterbox_load("hbed.yarn")
	chatterbox_load("staffdoor.yarn")
	chatterbox_load("hosdoor.yarn")
	hbed_box = chatterbox_create("hbed.yarn")
	staffdoor_box = chatterbox_create("staffdoor.yarn")
	hosdoor_box = chatterbox_create("hosdoor.yarn");

	list = [hbed_box, staffdoor_box, hosdoor_box];

	switch (LANG)
	{
		case "fr":
			chatterbox_goto(hbed_box, "Debut");
			chatterbox_goto(staffdoor_box, "Debut");
			chatterbox_goto(hosdoor_box, "Debut")
			break;
		case "en":
			chatterbox_goto(hbed_box, "Start")
			chatterbox_goto(staffdoor_box, "Start");
			chatterbox_goto(hosdoor_box, "Start")
			break;
	}
}