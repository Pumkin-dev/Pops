/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if (global.pause|| !oController.light)
{
	exit;
}
if (!surface_exists(surf_light)) 
{
	surf_light = surface_create(room_width, room_height);

	surface_set_target(surf_light);
	draw_clear_alpha(c_black, 0)
	surface_reset_target();
}

if (!surface_exists(surf_purple))
{
	surf_purple = surface_create(room_width, room_height);
	
	surface_set_target(surf_purple);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}
// si la surface existe
else
{
	if (!flickering && Chance(0.001))
	{
		flickering = true;
		alarm[0] = 180;
	}
	// On affiche un rectangle de couleur #A3D2A6 sur tous les éléments en le mettant sur la surfac des ombres
	surface_set_target(surf_light);
	draw_clear_alpha(c_black, 0.8);
	if (flickering)
	{
		flicker_light = Chance(0.1);
	}
	else
	{
		flicker_light = false;
	}
	if (!flicker_light && ITEM[| item.flashlight][? "get"])
	{
		FlashLight();
	}
	else
	{
		HaloLight();
	}
	surface_reset_target();
}	
surface_set_target(surf_purple);
draw_clear_alpha(make_color_rgb(42,11,128), 0.31);
surface_reset_target();

