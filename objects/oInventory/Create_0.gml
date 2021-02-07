/// @description Insert description here
// You can write your code in this editor

global.item = ds_list_create();

enum item{
	phone,
	flashlight,
	stick
}
enum slot{
	name,
	sprite,
	description,
	get
}

create_item(item.phone, "Phone", sprite147, "Your phone. How did it get here? It looks like it has been reset", false)
create_item(item.flashlight, "Flashlight", sprite148, "A flashlight. It allows you to enlighten the darkness", false);
create_item(item.stick, "Stick", sprite149, "You've hurt a poor plant, you should be ashamed... Naaah, just kidding, you needed it.", false)


#macro ITEM global.item
