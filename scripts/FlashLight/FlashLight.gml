// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FlashLight(){
	var scale_flight = random_range(1.09, 1.1);
	HaloLight();	
	with (oPlayer)
	{
		switch (charaDirection)
		{
			case CHARADIRECTION.RIGHT:
				draw_sprite_ext(sprFLight, 1, x - sprite_xoffset + flight_x , y - sprite_yoffset + flight_y, scale_flight, 1, 0, c_white, 1);
				break;
			case CHARADIRECTION.BACK:
				draw_sprite_ext(sprFLight, 1, x - sprite_xoffset + flight_x , y - sprite_yoffset + flight_y, 1, scale_flight, 90, c_white, 1);
				break;			
			case CHARADIRECTION.LEFT:
				draw_sprite_ext(sprFLight, 1, x - sprite_xoffset + flight_x , y - sprite_yoffset + flight_y, scale_flight, 1, 180, c_white, 1);
				break;
			case CHARADIRECTION.FRONT:
				draw_sprite_ext(sprFLight, 1, x - sprite_xoffset + flight_x , y - sprite_yoffset + flight_y, 1, scale_flight, 270, c_white, 1);
				break;
		}
	}
	gpu_set_blendmode(bm_normal);
}