// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Cutscene_ACall(){
	if (oPlayer.state != PLAYERSTATE.CUTSCENE)
	{
		oPlayer.state = PLAYERSTATE.CUTSCENE;
	}
	
	if (!audio_emitter_exists(phone_emit))
	{
		phone_emit = audio_emitter_create();
		audio_falloff_set_model(audio_falloff_exponent_distance)
		audio_emitter_falloff(phone_emit, 50, 200, 1)
	}
	if (!audio_is_playing(snd_phone))
	{
		audio_play_sound_on(phone_emit, snd_phone, true, false);
	}
	
	with (oHosDoor)
	{
		if (x > 400)
		{
			audio_emitter_position(oCutscene.phone_emit, x + sprite_width/2, y + sprite_height/2, 0);
		}
	}
	
	if (alarm[0] == -1 && oChatterbox.state == CHATTERBOXSTATE.FREE)
	{
		alarm[0] = 120;
	}
}