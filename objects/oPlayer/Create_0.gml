/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

sound_played = false
footsteps_nb = 0;

flight_x = 4;
flight_y = 39;

alarm[1] = 1;
alarm[2] = 20;
state = PLAYERSTATE.WARPING;
with (oController)
{
	other.charaDirection = controllerDirection;
}

enum PLAYERSTATE{
	FREE,
	INTERACTING,
	WARPING,
	CUTSCENE
}

enum CLOTHING{
	NORMAL,
	HOSPITAL
}
clothes = CLOTHING.HOSPITAL

audio_listener_orientation(0, 1000, 0, 0, 0, 1);