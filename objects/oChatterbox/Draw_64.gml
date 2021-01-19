/// @description Insert description here
// You can write your code in this editor
switch (draw)
{
	case CHATTERBOXDRAW.FREE:
		ChatterboxDraw_Free();
		break;
	case CHATTERBOXDRAW.INTERACTING:
		ChatterboxDraw_Interacting();
		break;
	case CHATTERBOXDRAW.CUTSCENE:
		ChatterboxDraw_Cutscene();
		break;

}