///@description Attributs du personnage
event_inherited();

hspd = 0;
vspd = 0;


spr_cycle = 0;

charaState = CHARASTATE.IDLE;
charaDirection = CHARADIRECTION.FRONT;

enum CHARASTATE{
	IDLE,
	WALKING,
	RUNNING
}

enum CHARADIRECTION{
	RIGHT,
	LEFT,
	FRONT,
	BACK
}