/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

// Inherit the parent event
event_inherited();

spr_mid_down = sprite_duplicate(sprite_index);
sprite_collision_mask(spr_mid_down, false, 2, 0, sprite_height/2, sprite_width, sprite_height, 1, 0);