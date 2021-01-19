/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

scale = 2;
var aspect_ratio = display_get_width()/display_get_height();

global.view_width = round(global.view_height*aspect_ratio);

var ideal_w = global.view_width*scale;
var ideal_h = global.view_height*scale;

window_set_size(ideal_w, ideal_h);
display_set_gui_maximize(scale, scale);
alarm[0] = 1;

surface_resize(application_surface, ideal_w, ideal_h);