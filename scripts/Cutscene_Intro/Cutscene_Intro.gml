// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Cutscene_Intro(){
	if (!openyoureyes)
	{
		oChatterbox.state = CHATTERBOXSTATE.CUTSCENE;
		oChatterbox.draw = CHATTERBOXDRAW.CUTSCENE;
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
}