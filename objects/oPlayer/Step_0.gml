/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

switch (state)
{
	case PLAYERSTATE.FREE:
		PlayerState_Free();
		break;
	case PLAYERSTATE.INTERACTING:
		PlayerState_Interacting();
		break;
	case PLAYERSTATE.WARPING:
		PlayerState_Warping();
		break;
	case PLAYERSTATE.CUTSCENE:
		PlayerState_Cutscene();
		break;
}