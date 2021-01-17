/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
draw_flush();

tilemap = layer_tilemap_get_id("Collision");

switch (room)
{
	// Si on est dans la salle pour initialiser le contrôleur
	case rm_controller:
		// Faut aller dans le menu
		room_goto(rm_menu);
		break;
	case rm_menu:
		camera_posx = 0;
		camera_posy = 0;
		camera_right = room_width;
		camera_bottom = room_height;
		break;
	case rm_hos_chambre_pops:
		light = true;
		with (oPlayer) alarm[1] = 1;
		break;
}

if (light && !instance_exists(oLighting))
{
	instance_create_layer(x, y, "Lighting", oLighting);
}

if (room != rm_controller && room != rm_menu)
{
	if (!instance_exists(oPlayer))
	{
		instance_create_layer(warp_x, warp_y, "Character", oPops)
		oPlayer.xstart = oPlayer.x;
		oPlayer.ystart = oPlayer.y;
		oPlayer.warp = true;
		fading = true;
	}
}
