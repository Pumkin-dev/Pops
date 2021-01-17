/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

view_height = 360;
scale = 2;
var aspect_ratio = display_get_width()/display_get_height();

view_width = round(view_height*aspect_ratio);

var ideal_w = view_width*scale;
var ideal_h = view_height*scale;

window_set_size(ideal_w, ideal_h);
display_set_gui_maximize(scale, scale);
alarm[0] = 1;

surface_resize(application_surface, ideal_w, ideal_h);