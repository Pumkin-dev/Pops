/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if (window_get_fullscreen())
{
	scale = display_get_width()/view_width;
	display_set_gui_maximize(scale, scale);
}
else
{
	scale = window_get_width()/view_width;
	display_set_gui_maximize(scale, scale);
}