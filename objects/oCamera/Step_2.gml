/// @description 
#macro view view_camera[0]

var zoom_w = camera_get_view_width(view)
var zoom_h = camera_get_view_height(view)


zoom_w = lerp(zoom_w, oChatterbox.zoom_width, oChatterbox.zoom);
zoom_h = lerp(zoom_h, oChatterbox.zoom_height, oChatterbox.zoom);
camera_set_view_size(view, zoom_w, zoom_h);

if (instance_exists(oChatterbox.obj_zoom))
{
	with (oChatterbox.obj_zoom)
	{
		var _x = x - zoom_w/2;
		var _y = y - zoom_h/2;
		_x = ceil(_x);
		_y = ceil(_y);
		_x = clamp(_x, 0, room_width);
		_y = clamp(_y, 0, room_height);
	}
	camera_set_view_pos(view, _x, _y);
}


oController.camera_posx = camera_get_view_x(view);
oController.camera_posy = camera_get_view_y(view);
oController.camera_right = oController.camera_posx + camera_get_view_width(view);
oController.camera_bottom = oController.camera_posy + camera_get_view_height(view);