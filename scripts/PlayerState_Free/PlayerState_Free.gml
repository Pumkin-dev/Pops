// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free(){
	/// Mouvements de Pops
// Variables qui me permettent de déterminer la direction du perso
	if (!global.pause)
	{
		var hmove = RIGHTKEY - LEFTKEY;
		var vmove = DOWNKEY - UPKEY;
	
		/// Détermination de l'orientation du sprite
		if (hmove != 0 || vmove != 0)
		{
			walk = true
		}
		else
		{
			walk = false;
		}
		if (walk)
		{
			// Si le perso va vers le bas qu'il y a un mouvement horizontale
			if (vmove == 1 && hmove != 0)
			{
				// on active seulement le sprite de face
				SetDirection("front");
			};
			// De même vers le haut
			else if (vmove == -1 && hmove != 0)
			{
				SetDirection("back");
			};
			// Sinon s'il n'y a seulement qu'un mouvement dans un axe
			else
			{	
				// Mouvement verticale
				switch (vmove)
				{
					// Si vers le bas
					case 1:
						// on active de face
						SetDirection("front")
						break;
					// De même ici
					case -1:
						SetDirection("back")
						break;
				};
				// De même horizontalement
				switch (hmove)
				{
					case 1:
						SetDirection("right")
						break;
					case -1:
						SetDirection("left")
						break;
				};
			};
		}

		// Cela permet d'adapter les directions avec la vitesse de marche
		hspd = hmove * walkspd;
		vspd = vmove * walkspd;
		var bbox_side;
		if (hspd > 0) {bbox_side = bbox_right};
		else {bbox_side = bbox_left};

		if (tilemap_get_at_pixel(oController.tilemap, bbox_side + hspd, bbox_top) || tilemap_get_at_pixel(oController.tilemap, bbox_side + hspd , bbox_bottom ))
		{
			if (hspd > 0)
			{
				x = x - x%32 + 31 - (bbox_right - x);
			}
			else
			{
				x = x - x%32 - (bbox_left - x)
			}
				
			if (x == xprevious && vspd == 0) {walk = false}
			hspd = 0;
		}
		
		if (vspd > 0) {bbox_side = bbox_bottom};
		else {bbox_side = bbox_top};
		
		if (tilemap_get_at_pixel(oController.tilemap, bbox_left, bbox_side + vspd) || tilemap_get_at_pixel(oController.tilemap, bbox_right, bbox_side + vspd))
		{
			if (vspd > 0)
			{
				y = y - y%32 + 31 - (bbox_bottom - y);
			}
			if (y == yprevious && hspd == 0) {walk = false}
			vspd = 0;
		}
		

		// Si le perso est proche d'un meuble
		if (place_meeting(x + hspd, y, oEntity))
		{
			// tant que le perso n'est pas proche du meuble au pixel près
			while (!place_meeting(x + sign(hspd), y, oEntity))
			{
				// on le rapproche
				x += sign(hspd);
			};
	
			// Puis on bloque les déplacements horizontales
			hspd = 0;
			if (vmove == 0) {walk = false};
		}
		// Puis on incrémente à x s'il y a déplacement ou collisions

		x += hspd;

		// de même verticalement
		if (place_meeting(x, y + vspd, oEntity))
		{
			while (!place_meeting(x, y + sign(vspd), oEntity))
			{
				y += sign(vspd)
			};
	
			vspd = 0;
			if (hmove == 0) {walk = false};
		}

		// de même
		y += vspd;
		
		audio_listener_position(x, y, 0);

		FurnituresUpOrDown();
		

		var detection = ObjectDetection();

		if (PRESSEDZKEY && detection)
		{
			state = PLAYERSTATE.INTERACTING;
		}
		if (place_meeting(x, y, oWarp))
		{
			state = PLAYERSTATE.WARPING;
		}

		if (walk)
		{
			switch (floor(image_index))
			{
				case 1:
				case 5:
					if (!sound_played)
					{
						sound_played = true;
						alarm[0] = 1;
					}
					break;
				default:
					sound_played = false;
					break;
			}
		}
	}
}