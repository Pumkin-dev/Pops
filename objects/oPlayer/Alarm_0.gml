/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
footsteps_nb %= 4
switch (footsteps_nb)
{
	case 0:
		audio_play_sound(snd_footsteps_hos_1, 1, false);
		break;
	case 1:
		audio_play_sound(snd_footsteps_hos_3, 1, false);
		break;
	case 2:
		audio_play_sound(snd_footsteps_hos_4, 1, false);
		break;
	case 3:
		audio_play_sound(snd_footsteps_hos_5, 1, false);
		break;
}
footsteps_nb++;