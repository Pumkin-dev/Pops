// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Draw_Portrait(){
	switch (speaker)
	{
		case "Pops":
			instance_create_layer(global.view_width, global.view_height, "Chatterbox", oPopsFace);
			break;
		default:
			instance_destroy(oFace);
			break;
	}
}
function center_text(str){
	var str_width = str.get_width()*str.get_typewriter_state();
	var str_center = round(str_width/2);
	return global.view_width/2 - str_center;
}
function draw_test(_x, _y, scribble_element){
	var width = scribble_element.get_width() + string_width("M") * 2;
	var height = scribble_element.get_height() + string_height("M");
	previousWidth = lerp(previousWidth, width, 0.1);
	previousHeight = lerp(previousHeight, height, 0.1);
	if (surface_get_width(surf_growup) != sprite_get_width(sprTail_bulb) + width || surface_get_height(surf_growup) != height)
	{
		surface_resize(surf_growup, sprite_get_width(sprTail_bulb) + previousWidth, previousHeight);
	}
	surface_set_target(surf_growup);
		
	draw_nineslice(sprBox, 0,  0, previousWidth, previousHeight, c_white);
	scribble_element.draw(string_width("M"), string_height("M")/2);
	surface_reset_target();
		
	scale = lerp(scale, 1, 0.1)
	pos_x = lerp(pos_x, _x, 0.4)
	pos_y = lerp(pos_y, _y, 0.4)
		
	draw_surface_ext(surf_growup, pos_x, pos_y, scale, scale, 0, c_white, 1);
}
///@description Chatterbox_Printing()
///@func Chatterbox_Printing
///@param box file yarn read
function Chatterbox_Printing(box){
	// on affiche le contenu du .yarn 

		
	for (var i = 0; i < chatterbox_get_content_count(box); i++)
	{
			
		if (room == rm_menu)
		{
			chatterbox_list[i].draw(center_text(chatterbox_list[i]), 180);
		}
		else
		{
			//chatterbox_list[i].draw(64 + _outlineWidth, 256 + _outlineWidth);
			if (instance_exists(oFace))
			{
				if (pos_x == 0 || pos_y == 0)
				{
						
					pos_x = oFace.bbox_left;
					pos_y = oFace.bbox_bottom;
				}
			}
			else
			{
				if (pos_x == 0 || pos_y == 0)
				{
					pos_x = global.view_width/2;
					pos_y = global.view_height;
				}
			}
			var anchor_x, anchor_y;
			if (instance_exists(oFace))
			{
				with (oFace) anchor_x = bbox_left - surface_get_width(other.surf_growup);
			}
			else
			{
				anchor_x = global.view_width/2 - surface_get_width(surf_growup)/2;
			}
			anchor_y = 288 - surface_get_height(surf_growup)/2;
			draw_test(anchor_x, anchor_y, chatterbox_list[i])
		}
			
	}
	if (chatterbox_is_stopped(box) && scale >= 0.0001)
	{
			draw_surface_ext(surf_growup, pos_x, pos_y, scale, scale, 0, c_white, 1);
	}
	
	
	// s'il y a une question on affiche les réponses
	if (!chatterbox_is_waiting(box) && scribble_done_option)
	{
		var lty, y_buffer;
		y_buffer = 64;
		var _x = global.view_width/2;
		var _y = global.view_height/2;
		if (chatterbox_get_option_count(box) > 1) { _y -= ((chatterbox_get_content_count(box) - 1)/2)*y_buffer; }
		for (var i = 0; i < chatterbox_get_option_count(box); i++)
		{
			lty = _y + (y_buffer*i)
			var c = c_white;
			var bbox = chatterbox_option_list[i].get_bbox(_x, lty);
			if (chat_slot == i) { c = c_yellow; }
			draw_nineslice(sprBox, variable_instance_get(bbox, "x0") - string_width("M"), variable_instance_get(bbox, "y0") - string_height("M")/4, variable_instance_get(bbox, "x3") + string_width("M"), variable_instance_get(bbox, "y3") + string_height("M")/4, c);
			chatterbox_option_list[i].draw(_x, lty);
			
		}
	}
}
function ChatterboxDraw_Interacting(){
	Chatterbox_Printing(box);
	if (!instance_exists(oFace) && scribble_done) {Draw_Portrait()};
	if (state == CHATTERBOXSTATE.FREE) {draw = CHATTERBOXDRAW.FREE};
}