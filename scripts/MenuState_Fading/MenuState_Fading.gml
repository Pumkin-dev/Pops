// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MenuState_Fading(){
	opacity -= 1/(1*room_speed);
	if (opacity <= 0)
	{
		state = MENUSTATE.FREE;
		draw_state = MENUDRAW.FREE;
		global.pause = false;
		opacity = 1;
		oCutscene.scene = CUTSCENE.INTRO;
	}
}