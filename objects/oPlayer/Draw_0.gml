/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

if (ITEM[# item.flashlight, 3])
{
	if (front)
	{
		angle = 270;
	}
	else if (right)
	{
		angle = 0;
	}
	else if (back)
	{
		angle = 90;
	}
	else if (left)
	{
		angle = 180;
	}
}