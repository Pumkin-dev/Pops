// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ControllerState_Warping(){
	if (launching_game)
	{
		fading = true;
	}
	// Si le joueur a marché sur une warp
	if (instance_exists(oPlayer) && oPlayer.state == PLAYERSTATE.WARPING)
	{
		// On active le fading
		fading = true;
	}

	// Si le joueur apparaît dans la salle
	if (fading)
	{
		if (instance_exists(oPlayer) && fadingout && oPlayer.state == PLAYERSTATE.WARPING)
		{
			// activez le fadingout
			if (oCutscene.scene == CUTSCENE.INTRO)
			{
				Fadingout(2, c_white, 1, false, oController);
			}
			else
			{
				Fadingout(0.5, c_black, 1, false, oController);
			}
			if (!fading)
			{
				oPlayer.state = PLAYERSTATE.FREE;
			}
		}
		// Si le joueur a marché sur une warp et que le fadingin ne s'est pas effectué
		else if (instance_exists(oPlayer) && oPlayer.state == PLAYERSTATE.WARPING && fadingin)
		{
			// Activez le fading
			Fadingin(0.5, c_black, 1, false, oController);
			if (!fading)
			{
				change_rooms = true;
			}
		}
		else if (launching_game && oCutscene.scene == CUTSCENE.INTRO)
		{
			Fadingin(1, c_white, 1, false, oController);
			if (!fading) {change_rooms = true};
		}
	}
	if (change_rooms)
	{
		if (!audio_is_playing(snd_door) && !sound_door_played && room != rm_menu)
		{
			audio_play_sound(snd_door, false, false);
			sound_door_played = true;
		}
		// Si le joueur a marché sur une warp et que le fadingin s'est effectué
		if (instance_exists(oPlayer) && oPlayer.state == PLAYERSTATE.WARPING || launching_game)
		{
			// Selon la salle on change les coordonées de warp et on va dans la salle dédié
			switch (room)
			{
				case rm_menu:
					room_goto(rm_hos_chambre_pops);
					launching_game = false
					break;
				case rm_hos_chambre_pops:
					warp_x = 128;
					warp_y = 574;
					room_goto(rm_hos_couloir);
					break;
				case rm_hos_couloir:
					if (oPlayer.x < 400)
					{
						warp_x = 512;
						warp_y = 222;
						room_goto(rm_hos_chambre_pops);
					}
					else
					{
						warp_x = 142;
						warp_y = 1024;
						room_goto(rm_hos_center);
					}
					break;
				case rm_hos_center:
					if (oPlayer.x <= 500 && oPlayer.y > 100)
					{
						warp_x = 1312;
						warp_y = 256;
						room_goto(rm_hos_couloir);
					}
					else if (oPlayer.x > 500 && oPlayer.y > 100)
					{
						warp_x = 128;
						warp_y = 256;
						room_goto(rm_hos_couloir1);
					}
					else if (oPlayer.y < 200)
					{
						warp_x = 668;
						warp_y = 732;
						room_goto(rm_hos_reception);
					}
					break;
					case rm_hos_reception:
						if (oPlayer.y > 700)
						{
							warp_x = 1438;
							warp_y = 62;
							room_goto(rm_hos_center);
						}
						else
						{
							warp_x = 926;
							warp_y = 224;
							room_goto(rm_hos_couloir_sortie);
						}
						break;
					case rm_hos_couloir1:
						if (oPlayer.x < 500)
						{
							warp_x = 2752;
							warp_y = 1024;
							room_goto(rm_hos_center);
						}
						else
						{
							warp_x = 144;
							warp_y = 190;
							room_goto(rm_hos_couloir2);
						}
						break;
					case rm_hos_couloir2:
						warp_x = 1372;
						warp_y = 576;
						room_goto(rm_hos_couloir1);
						break;
					case rm_hos_couloir_sortie:
						warp_x = 106;
						warp_y = 288;
						room_goto(rm_hos_reception);
						break;
			}
			// on stocke les directions du joueur dans le contrôleur
			with (oPlayer)
			{
				other.ctrller_front = front;
				other.ctrller_back = back;
				other.ctrller_right = right;
				other.ctrller_left = left;
			}
		}
		change_rooms = false;
		sound_door_played = false;
	}

}