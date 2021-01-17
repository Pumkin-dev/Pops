// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FlashLight(){
	var scale_flight = random_range(1.09, 1.1);
	HaloLight();	
	with (oPlayer)
	{
		if (right)
		{
			draw_sprite_ext(sprFLight, 1, x - sprite_xoffset + flight_x , y - sprite_yoffset + flight_y, scale_flight, 1, 0, c_white, 1);
			
		}
		else if (back)
		{
			draw_sprite_ext(sprFLight, 1, x - sprite_xoffset + flight_x , y - sprite_yoffset + flight_y, 1, scale_flight, 90, c_white, 1);
		}
		else if (left)
		{
			draw_sprite_ext(sprFLight, 1, x - sprite_xoffset + flight_x , y - sprite_yoffset + flight_y, scale_flight, 1, 180, c_white, 1);
		}
		else if (front)
		{
			draw_sprite_ext(sprFLight, 1, x - sprite_xoffset + flight_x , y - sprite_yoffset + flight_y, 1, scale_flight, 270, c_white, 1);
		}
	}
	gpu_set_blendmode(bm_normal);
}