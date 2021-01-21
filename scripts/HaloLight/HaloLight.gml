// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@desc HaloLight(flight)
///@func HaloLight
///@param {boolean} flight presence of flashlight?
function HaloLight(){
	var scale_light = random_range(1.08, 1.1);
	gpu_set_blendmode(bm_subtract);
	with (oPlayer)
	{
		switch (sprite_index)
		{
			case sprPopsWakingUp:
				var center_x = bbox_left + sprite_width/2; var center_y = bbox_top + sprite_height/2;
				draw_sprite_ext(sprLight, 1, center_x, center_y, scale_light, scale_light, 0, c_white, 1);
				break;
			default:
				draw_sprite_ext(sprLight, 1, x, y, scale_light, scale_light, 0, c_white, 1);
				break;
		}
	}
}