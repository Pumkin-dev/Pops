/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

if (oCutscene.scene != CUTSCENE.INTRO)
{
	switch (charaState)
	{
		case CHARASTATE.IDLE:
			switch (spr_cycle)
			{
				case 0:
				case 1:
				case 2:
					switch (charaDirection)
					{
						case CHARADIRECTION.FRONT:
							sprite_index = spr_front;
							break;
						case CHARADIRECTION.BACK:
							sprite_index = spr_back;
							break;
						case CHARADIRECTION.RIGHT:
							sprite_index = spr_right;
							break;
						case CHARADIRECTION.LEFT:
							sprite_index = spr_left;
							break;
					}
					break;
				case 3:
					switch (charaDirection)
					{
						case CHARADIRECTION.FRONT:
							sprite_index = spr_front_wink;
							break;
						case CHARADIRECTION.BACK:
							sprite_index = spr_back;
							break;
						case CHARADIRECTION.RIGHT:
							sprite_index = spr_right_wink;
							break;
						case CHARADIRECTION.LEFT:
							sprite_index = spr_left_wink;
							break;
					}
					break;
			}
			break;
		case CHARASTATE.WALKING:
			switch (spr_cycle)
			{
				case 0:
				case 1:
				case 2:
					switch (charaDirection)
					{
						case CHARADIRECTION.FRONT:
							sprite_index = spr_front_walk;
							break;
						case CHARADIRECTION.BACK:
							sprite_index = spr_back_walk;
							break;
						case CHARADIRECTION.RIGHT:
							sprite_index = spr_right_walk;
							break;
						case CHARADIRECTION.LEFT:
							sprite_index = spr_left_walk;
							break;
					}
					break;
				case 3:
					switch (charaDirection)
					{
						case CHARADIRECTION.FRONT:
							sprite_index = spr_front_walk_wink;
							break;
						case CHARADIRECTION.BACK:
							sprite_index = spr_back_walk;
							break;
						case CHARADIRECTION.RIGHT:
							sprite_index = spr_right_walk_wink;
							break;
						case CHARADIRECTION.LEFT:
							sprite_index = spr_left_walk_wink;
							break;
					}
					break;
			}
			break
	}
					
						
}