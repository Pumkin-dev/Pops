/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if (charaState != CHARASTATE.WALKING)
{
	switch (charaDirection)
	{
		case CHARADIRECTION.RIGHT:
			flight_x = 49;
			break;
		case CHARADIRECTION.LEFT:
			flight_x = 0;
			break;
		case CHARADIRECTION.BACK:
			flight_x = 25;
			break;
		case CHARADIRECTION.FRONT:
			flight_x = 4;
			break;
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
	switch (charaDirection)
	{
		case CHARADIRECTION.RIGHT:
			flight_x = 49;
			break;
		case CHARADIRECTION.LEFT:
			flight_x = 0;
			break;
		case CHARADIRECTION.BACK:
			flight_x = 25;
			break;
		case CHARADIRECTION.FRONT:
			flight_x = 4;
			break;
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