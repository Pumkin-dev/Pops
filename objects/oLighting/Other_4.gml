/// @description Insert description here
// You can write your code in this editor
if (!surface_exists(surf_light))
{
	surf_light = surface_create(room_width, room_height);
}
else
{
	surface_resize(surf_light, room_width, room_height);
}
if (!surface_exists(surf_purple))
{
	surf_purple = surface_create(room_width, room_height);
}
else
{
	surface_resize(surf_purple, room_width, room_height);
}

surface_set_target(surf_light);
draw_clear_alpha(c_black, 0);
surface_reset_target();
