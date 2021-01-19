/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

// Si on ne marche pas
if (!walk)
{
	if (front && spr_cycle < 3)
	{
		
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_front_flight;
		}
		else
		{
			sprite_index = spr_front;
		}
	}
	else if (front && spr_cycle == 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_front_wink_flight;
		}
		else
		{
			sprite_index = spr_front_wink;
		}
	}
	else if (back)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_back_flight;
		}
		else
		{
			sprite_index = spr_back;
		}
	}
	else if (left && spr_cycle < 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_left_flight;
		}
		else
		{
			sprite_index = spr_left;
		}
	}
	else if (left && spr_cycle == 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_left_wink_flight;
		}
		else
		{
			sprite_index = spr_left_wink;
		}
	}
	else if (right && spr_cycle < 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_right_flight;
		}
		else
		{
			sprite_index = spr_right;
		}
	}
	else if (right && spr_cycle == 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_right_wink_flight
		}
		else
		{
			sprite_index = spr_right_wink;
		}
	}
}
// Sinon si on marche
else
{
	if (front && spr_cycle < 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_front_walk_flight;
		}
		else
		{
			sprite_index = spr_front_walk;
		}
	}
	else if (front && spr_cycle == 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_front_walk_wink_flight;
		}
		else
		{
			sprite_index = spr_front_walk_wink;
		}
	}
	else if (back)
	{
		if (ITEM[# item.flashlight, slot.get])
		{
			sprite_index = spr_back_walk_flight;
		}
		else
		{
			sprite_index = spr_back_walk;
		}
	}
	else if (left && spr_cycle < 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_left_walk_flight;
		}
		else
		{
			sprite_index = spr_left_walk;
		}
	}
	else if (left && spr_cycle == 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_left_walk_wink_flight;
		}
		else
		{
			sprite_index = spr_left_walk_wink;
		}
	}
	else if (right && spr_cycle < 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_right_walk_flight;
		}
		else
		{
			sprite_index = spr_right_walk;
		}
	}
	else if (right && spr_cycle == 3)
	{
		if (ITEM[# item.flashlight, slot.get] )
		{
			sprite_index = spr_right_walk_wink_flight;
		}
		else
		{
			sprite_index = spr_right_walk_wink;
		}
	}
}