/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
global.delta_factor = 1;
global.lang = "en"
#macro LANG global.lang 
#macro delta global.delta_factor

sound_door_played = false;

#macro UPKEY global.press_up
#macro DOWNKEY global.press_down
#macro RIGHTKEY global.press_right
#macro LEFTKEY global.press_left
#macro PRESSEDZKEY global.press_z_pressed
#macro PRESSEDXKEY global.press_x_pressed
#macro PRESSEDUPKEY global.press_up_pressed
#macro PRESSEDDOWNKEY global.press_down_pressed
#macro PRESSEDRIGHTKEY global.press_right_pressed
#macro PRESSEDLEFTKEY global.press_left_pressed 


globalvar pause;
global.pause = false;
state = CONTROLLERSTATE.WARPING
warp_x = 96;
warp_y = 160;

ctrller_front = true;
ctrller_back = false;
ctrller_right = false;
ctrller_left = false;

fadingin = false;
fadingout = true;
fading = false;
change_rooms = false
light = false;
launching_game = false;

enum CONTROLLERSTATE{
	FREE,
	WARPING
}
scribble_typewriter_add_character_delay(".", 200);
alarm[0] = 20;

global.view_width = 640; global.view_height = 360;
audio_group_load(audio_sfx);
audio_group_load(audio_bgm);