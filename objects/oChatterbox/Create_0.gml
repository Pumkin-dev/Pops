/// @description Insert description here
// You can write your code in this editor

scribble_font_add("ConfusedHeart", "font/ConfusedHeart.yy");
scribble_done = false;
scribble_done_option = false;
draw_options = false;
draw_content = true;
slot = 0;

chatterbox_list = undefined;
chatterbox_option_list = undefined;
box = undefined;
Setting_Chatterbox();
state = CHATTERBOXSTATE.FREE;
draw = CHATTERBOXDRAW.FREE;
speaker = undefined;
emotion = undefined;

enum CHATTERBOXSTATE{
	FREE,
	INTERACTING,
	CUTSCENE,
}
enum CHATTERBOXDRAW{
	FREE,
	INTERACTING,
	CUTSCENE
}
offset = 1;
fxspeed = 1;
_speed = 1;
_pitch = 1;
zoom = 1;
_room = room_get_name(room)
zoom_width = global.view_width;
zoom_height = global.view_height;
obj_zoom = oPointZoom;

surf_growup = surface_create(1, 1)
previousWidth = 1;
previousHeight = 1;
scale = 0.0001;