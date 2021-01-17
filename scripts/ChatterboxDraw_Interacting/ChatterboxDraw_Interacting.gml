// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Draw_Portrait(){
	switch (speaker)
	{
		case "Pops":
			instance_create_layer(64 + sprite_get_width(sprTBox) - 6, 256 + sprite_get_height(sprTBox) - 6, "Chatterbox", oPopsFace);
			break;
		default:
			instance_destroy(oFace);
			break;
	}
}
///@description Chatterbox_Printing()
///@func Chatterbox_Printing
///@param box file yarn read
function Chatterbox_Printing(box){
	var _outlineWidth = 6;
	draw_sprite(sprTBox, 0, 64, 256);
	// on affiche le contenu du .yarn 
	if (draw_content)
	{
		for (var i = 0; i < chatterbox_get_content_count(box); i++)
		{
			chatterbox_list[i].draw(64 + _outlineWidth, 256 + _outlineWidth);
		}
	}
	
	// s'il y a une question on affiche les réponses
	if (!chatterbox_is_waiting(box) && scribble_done_option && draw_options)
	{
		var _x = 80 + _outlineWidth;
		var _y = 256 + _outlineWidth;
		for (var i = 0; i < chatterbox_get_option_count(box); i++;)
		{
			chatterbox_option_list[i].draw(_x, _y);
			if (slot == i) {draw_sprite(sprdialogue_cursor, 0, _x, _y + _outlineWidth)}
			_y += 36;
		}
	}
}
function ChatterboxDraw_Interacting(){
	Chatterbox_Printing(box);
	if (!instance_exists(oFace) && scribble_done) {Draw_Portrait()};
	if (state == CHATTERBOXSTATE.FREE) {draw = CHATTERBOXDRAW.FREE};
}