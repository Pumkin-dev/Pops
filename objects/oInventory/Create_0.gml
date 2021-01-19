/// @description Insert description here
// You can write your code in this editor

global.item = ds_grid_create(4, 0);

enum item{
	flashlight,
	stick,
}
enum slot{
	name,
	sprite,
	description,
	get,
}
	
create_item(item.flashlight, "flashlight", undefined, "A flashlight. It allows you to enlighten the darkness", false);
create_item(item.stick, "stick", undefined, "You've hurt a poor plant, you should be ashamed... Naaah, just kidding, you needed it.", false)


#macro ITEM global.item
