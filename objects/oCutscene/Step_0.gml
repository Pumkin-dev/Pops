/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if (room = rm_hos_couloir && oPlayer.x >= 400 && !audio_is_playing(snd_phone))
{
	
	scene = CUTSCENE.ACALL;
}


switch (scene)
{
	case CUTSCENE.INTRO:
		Cutscene_Intro();
		break;
	case CUTSCENE.ACALL:
		Cutscene_ACall();
		break;
	case CUTSCENE.FREE:
	default:
		break;
}