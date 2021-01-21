/// @description Insert description here
// You can write your code in this editor
if (room == rm_hos_couloir && x > 400)
{
	phone_emit = audio_emitter_create();
	audio_falloff_set_model(audio_falloff_exponent_distance)
	audio_emitter_falloff(phone_emit, 50, 200, 1)
	audio_play_sound_on(phone_emit, snd_phone, true, false)
}