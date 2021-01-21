/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (room == rm_hos_couloir && x > 400)
{
	if (!audio_is_playing(snd_phone))
	{
		audio_play_sound_on(phone_emit, snd_phone, true, false);
	}
	audio_emitter_position(phone_emit, x + sprite_width/2, y + sprite_height/2, 0);
}
