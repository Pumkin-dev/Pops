///@desctiption WichSidePNJ();
///@func WichSidePNJ;
function WichSidePNJ() {

	var backh, fronth, righth, lefth, sides;
	// On prend les côtés du joueur
	with (oPlayer)
	{
		backh = back;
		fronth = front;
		righth = right;
		lefth = left;
	}

	// On met ça dans une liste 
	sides[3] = lefth;
	sides[2] = righth;
	sides[1] = fronth;
	sides[0] = backh;

	// Puis on verifie dans quelle direction il regarde puis on assigne ce côté à une variable
	for (var i = 0; i < 4; i++)
	{
		if (sides[i])
		{
			var g_side = sides[i];
		}
	}

	// S'il discute et si c'est avec lui qu'il parle
	if (global.dialogue && global.obj_det == object_index)
	{
		// On vérifie la direction où regarde le joueur
		switch (g_side)
		{
			// Puis on lui fait faire face au joueur
			case backh:
				SetDirection("front")
				break;
			case fronth:
				SetDirection("back")
				break;
			case righth:
				SetDirection("left")
				break;
			case lefth:
				SetDirection("right")
				break;
		}
	}
	else
	{
		SetDirection("front")
	}


}
