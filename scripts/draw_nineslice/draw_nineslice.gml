// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_nineslice(sprite, x1, y1, x2, y2){
	if (!instance_exists(oBox)) {instance_create_layer(x, y, layer, oBox);}
	var slice_width = sprite_get_width(sprite)/3;
	var slice_height = sprite_get_height(sprite)/3;
	
	var width = abs(x2 - x1);
	var height = abs(y2 - y1);
	
	// Top
	draw_sprite_part_ext(sprite, oBox.image_index, 0, 0, slice_width, slice_height, x1, y1, 1, 1, c_white, 1); //left
	draw_sprite_part_ext(sprite, oBox.image_index, slice_width, 0, slice_width, slice_height, x1 + slice_width, y1, (width - slice_width * 2)/slice_width, 1, c_white, 1); //middle
	draw_sprite_part_ext(sprite, oBox.image_index, slice_width * 2, 0, slice_width, slice_height, x2 - slice_width, y1, 1, 1, c_white, 1); //Right
	
	// Middle
	draw_sprite_part_ext(sprite, oBox.image_index, 0, slice_height, slice_width, slice_height, x1, y1 + slice_height, 1, (height - slice_height * 2)/slice_height, c_white, 1);
	draw_sprite_part_ext(sprite, oBox.image_index, slice_width, slice_height, slice_width, slice_height, x1 + slice_width, y1 + slice_height, (width - slice_width * 2)/slice_width, (height - slice_height * 2)/slice_height, c_white, 1);
	draw_sprite_part_ext(sprite, oBox.image_index, slice_width * 2, slice_height, slice_width, slice_height, x2 - slice_width, y1 + slice_height, 1, (height - slice_height * 2)/slice_height, c_white, 1);
	
	//Bottom
	draw_sprite_part_ext(sprite, oBox.image_index, 0, slice_height * 2, slice_width, slice_height, x1, y2 - slice_height, 1, 1, c_white, 1);
	draw_sprite_part_ext(sprite, oBox.image_index, slice_width, slice_height * 2, slice_width, slice_height, x1 + slice_width, y2 - slice_height, (width - slice_width * 2)/slice_width, 1, c_white, 1);
	draw_sprite_part_ext(sprite, oBox.image_index, slice_width * 2, slice_height * 2, slice_width, slice_height, x2 - slice_width, y2 - slice_height, 1, 1, c_white, 1);
	
	// Tail
	draw_sprite(sprTail_bulb, 0, x2-2, y1 + slice_height)
	
}