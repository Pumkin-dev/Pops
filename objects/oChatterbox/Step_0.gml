/// @description Insert description here
// You can write your code in this editor

switch (state)
{
	case CHATTERBOXSTATE.FREE:
		ChatterboxState_Free();
		break;
	case CHATTERBOXSTATE.INTERACTING:
		ChatterboxState_Interacting();
		break;
}
	