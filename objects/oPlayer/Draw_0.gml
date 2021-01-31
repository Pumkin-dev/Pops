/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

if (ITEM[| item.flashlight][? "get"])
{
	switch (charaDirection)
	{
		case CHARADIRECTION.FRONT:
			angle = 270;
			break;
		case CHARADIRECTION.RIGHT:
			angle = 0;
			break;
		case CHARADIRECTION.BACK:
			angle = 90;
			break;
		case CHARADIRECTION.LEFT:
			angle = 180;
			break;
	}
}