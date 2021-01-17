/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
// crée une surface pour ajouter des ombres
surf_light = surface_create(room_width, room_height);
surf_purple = surface_create(room_width, room_height);

surface_set_target(surf_light);
draw_clear_alpha(c_black, 0)
surface_reset_target();

surface_set_target(surf_purple);
draw_clear_alpha(c_black, 0);
surface_reset_target();

flickering = false;