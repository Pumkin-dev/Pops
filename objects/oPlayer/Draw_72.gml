/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if (instance_exists(oLighting))
{
	surface_set_target(oLighting.surf_light);
	gpu_set_blendmode(bm_subtract);
	with (oPlayer) draw_sprite(sprite_index, image_index, x, y);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}