/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if (!walk)
{
	if (right)
	{
		flight_x = 49;
	}
	else if (left)
	{
		flight_x = 0;
	}
	else if (back)
	{
		flight_x = 25;
	}
	else if (front)
	{
		flight_x = 4;
	}

	switch (floor(image_index))
	{
		case 0:
		case 4:
			flight_y = 39;
			break;
		case 1:
		case 3:
			flight_y = 38;
			break;
		case 2:
			flight_y = 37;
			break;
	}
}
else
{
	if (right)
	{
		flight_x = 49;
	}
	else if (left)
	{
		flight_x = 0;
	}
	else if (back)
	{
		flight_x = 25;
	}
	else if (front)
	{
		flight_x = 4;
	}
	switch (floor(image_index))
	{
		case 0:
		case 4:
			flight_y = 37;
			break;
		case 2:
		case 6:
			flight_y = 39;
			break;
		case 1:
		case 3:
		case 5:
		case 7:
			flight_y = 38;
			break;
	}
}

alarm[1] = 1