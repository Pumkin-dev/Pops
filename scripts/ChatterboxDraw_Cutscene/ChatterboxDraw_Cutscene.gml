// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function center_text(str){
	var str_width = str.get_width()*str.get_typewriter_state();
	var str_center = round(str_width/2);
	return global.view_width/2 - str_center;
}
	
///@description Chatterbox_Printing()
///@func Chatterbox_Printing
///@param box file yarn read
function Chatterbox_Printing_Cutscene(box){
	var _outlineWidth = 6;
	// on affiche le contenu du .yarn 
	if (draw_content)
	{
		for (var i = 0; i < chatterbox_get_content_count(box); i++)
		{
			chatterbox_list[i].draw(center_text(chatterbox_list[i]), global.view_height/2);
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
function ChatterboxDraw_Cutscene(){
	Chatterbox_Printing_Cutscene(box)
	if (!instance_exists(oFace) && scribble_done) {Draw_Portrait()};
	if (state == CHATTERBOXSTATE.FREE) {draw = CHATTERBOXDRAW.FREE};
}