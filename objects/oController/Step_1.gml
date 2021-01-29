/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
delta = (delta_time/1000000)*room_speed;

switch (room)
{
	case rm_hos_chambre_pops:
		break;
}

// Contrôles
global.press_right = keyboard_check(vk_right);
global.press_left = keyboard_check(vk_left);
global.press_down = keyboard_check(vk_down);
global.press_up = keyboard_check(vk_up);

global.press_z_pressed = keyboard_check_pressed(ord("Z"));
global.press_x_pressed = keyboard_check_pressed(ord("X"));

global.press_up_pressed = keyboard_check_pressed(vk_up);
global.press_down_pressed = keyboard_check_pressed(vk_down);
global.press_right_pressed = keyboard_check_pressed(vk_right);
global.press_left_pressed = keyboard_check_pressed(vk_left);