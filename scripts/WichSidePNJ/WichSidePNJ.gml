///@desctiption WichSidePNJ();
///@func WichSidePNJ;
function WichSidePNJ() {

	// S'il discute et si c'est avec lui qu'il parle
	if (oPlayer.state = PLAYERSTATE.INTERACTING && global.obj_det == object_index)
	{
		// On vérifie la direction où regarde le joueur
		switch (oPlayer.charaDirection)
		{
			// Puis on lui fait faire face au joueur
			case CHARADIRECTION.BACK:
				charaDirection = CHARADIRECTION.FRONT;
				break;
			case CHARADIRECTION.FRONT:
				charaDirection = CHARADIRECTION.BACK;
				break;
			case CHARADIRECTION.RIGHT:
				charaDirection = CHARADIRECTION.LEFT;
				break;
			case CHARADIRECTION.LEFT:
				charaDirection = CHARADIRECTION.RIGHT
				break;
		}
	}


}
