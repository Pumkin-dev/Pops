// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function resume_game(){
	//room_goto(rm_hos_chambre_pops)
	oController.state = CONTROLLERSTATE.WARPING;
	state = MENUSTATE.FADING;
	draw_state = MENUDRAW.FADING;
}