/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if (instance_exists(oPlayer) && cutscene && oPlayer.x < 500)
{
	with (oPlayer)
	{
		if (!right)
		{
			SetDirection("right");
		}
		x += walkspd;
		if (x >= 500)
		{
			other.cutscene = false;
		}
	}
}