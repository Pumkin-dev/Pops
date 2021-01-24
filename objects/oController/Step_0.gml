/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
var _room = rm_hos_couloir2;
var _f2 = keyboard_check_pressed(vk_f2);
switch (state)
{
	case CONTROLLERSTATE.FREE:
		ControllerState_Free();
		break;
	case CONTROLLERSTATE.WARPING:
		ControllerState_Warping();
		break;
}

if _f2{room_goto(_room)} 

if (PRESSEDXKEY)
{
	global.pause = !global.pause;
	if global.pause
	{
		if (!instance_exists(oPhone))
		{
			instance_create_layer(0, 0, "Chatterbox", oPhone);
		}
	}
	else
	{
		instance_destroy(oPhone)
	}
}

