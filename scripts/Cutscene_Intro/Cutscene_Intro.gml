// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Cutscene_Intro(){
	switch (room)
	{
		case rm_menu:
			if (!openyoureyes)
			{
				oChatterbox.state = CHATTERBOXSTATE.INTERACTING;
			}
			else
			{
				if (oSprIntro.sprite_index != sprIntroEyes)
				{
					if (!audio_is_playing(snd_flatline))
					{
						audio_play_sound(snd_flatline, false, false);
					}
					with (oSprIntro)
					{
						sprite_index = sprIntroEyes;
						image_index = 0;
					}
				}
			}
			break;
		case rm_hos_chambre_pops:
			switch (oPlayer.state)
			{
				case PLAYERSTATE.WARPING:
					if (oPlayer.sprite_index != sprPopsWakingUp) {oPlayer.sprite_index = sprPopsWakingUp}
					oPlayer.image_speed = 0;
					oChatterbox.zoom_width = global.view_width/4; oChatterbox.zoom_height = global.view_height/4;
					oChatterbox.zoom = 1;
					break;
					
				case PLAYERSTATE.FREE:
					oPlayer.state = PLAYERSTATE.CUTSCENE;
					image_index = image_number-1;
					
				case PLAYERSTATE.CUTSCENE:
					if (oPlayer.sprite_index == sprPopsWakingUp)
					{
						oChatterbox.zoom_width = global.view_width; oChatterbox.zoom_height = global.view_height;
						oChatterbox.zoom = 0.1
						if (alarm[0] == -1 && oChatterbox.state == CHATTERBOXDRAW.FREE)
						{
							alarm[0] = 30;
						}
						exit;
					}
					with (oPlayer){
						if (animation_end(sprPopsStandingUp))
						{
							oCutscene.scene = CUTSCENE.FREE;
							state = PLAYERSTATE.FREE
							x = x - sprite_xoffset + 42; y = y - sprite_yoffset + 60;
							oChatterbox.obj_zoom = oPlayer;
							ds_list_add(oCutscene.scene_visited, CUTSCENE.INTRO);
						}
					}
					break;
			}
			break;
			
	}
}
