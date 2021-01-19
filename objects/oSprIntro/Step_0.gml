/// @description Insert description here
// You can write your code in this editor
image_speed = oChatterbox._speed;
if (!oCutscene.openyoureyes)
{
	switch (oChatterbox._pitch)
	{
		case 1:
			s_heartbeat = snd_heartbeat;
			break;
		case 2:
			s_heartbeat = snd_heartbeat1;
			break;
		case 3:
			s_heartbeat = snd_heartbeat2;
			break;
		case 4:
			s_heartbeat = snd_heartbeat3;
			break;
	}
	switch (floor(image_index))
	{
		case 5:
			if (overlap)
			{
				audio_play_sound(s_heartbeat, false, false);
			}
			else if (!audio_is_playing(s_heartbeat))
			{
				audio_play_sound(s_heartbeat, false, false);
			}	
			overlap = false;
			break;
		default:
			overlap = true;
			break;
	}
}