/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
draw_flush();

tilemap = layer_tilemap_get_id("Collision");
switch (room)
{
	case rm_hos_couloir:
	case rm_hos_patient_room:
		with (oBookShelf)
		{
			if (audio_is_playing(snd_phone))
			{
				audio_emitter_position(oCutscene.phone_emit, x + 27, y + 9, 0);
			}
		}
		with (oHosDoor)
		{
			var visited = false;
			var i = 0; repeat (ds_list_size(oCutscene.scene_visited))
			{
				var _scene = oCutscene.scene_visited[| i];
				if ( _scene[? "cutscene" == CUTSCENE.ACALL]) { visited = true}
				i++;
			}
			if (visited && !audio_is_playing(snd_phone) && x > 400)
			{
				audio_emitter_position(oCutscene.phone_emit, x + sprite_width/2, y + sprite_height/2, 0);
				audio_play_sound_on(oCutscene.phone_emit, snd_phone, true, false);
			}
		}
		break;
	default:
		if (audio_is_playing(snd_phone))
		{
			audio_stop_sound(snd_phone);
		}
		break;
}

switch (room)
{
	// Si on est dans la salle pour initialiser le contrôleur
	case rm_controller:
		// Faut aller dans le menu
		room_goto(rm_menu);
		break;
	case rm_hos_chambre_pops:
	case rm_hos_center:
	case rm_hos_couloir:
	case rm_hos_couloir_sortie:
	case rm_hos_couloir1:
	case rm_hos_couloir2:
	case rm_hos_reception:
	case rm_hos_staff_room:
		light = true;
		with (oPlayer) alarm[1] = 1;
		break;
	default:
		
		break;
}

if (room != rm_controller && room != rm_menu)
{
	if (!instance_exists(oPlayer))
	{
		instance_create_layer(warp_x, warp_y, "Character", oPops)
		oPlayer.xstart = oPlayer.x;
		oPlayer.ystart = oPlayer.y;
		oPlayer.state = PLAYERSTATE.WARPING;
		fading = true;
	}
}