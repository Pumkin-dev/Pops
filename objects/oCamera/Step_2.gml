/// @description 
#macro view view_camera[0]

var zoom_w = camera_get_view_width(view)
var zoom_h = camera_get_view_height(view)
/*
zoom_w = lerp(zoom_w, view_width/2, 0.001)
zoom_h = lerp(zoom_h, view_height/2, 0.001)
*/
camera_set_view_size(view, zoom_w, zoom_h);

if (instance_exists(oPlayer))
{
	with (oPlayer)
	{
		var _x = x - other.view_width/2;
		var _y = y - other.view_height/2;
		_x = ceil(_x);
		_y = ceil(_y);
	}
	camera_set_view_pos(view, _x, _y);
}
else
{
	var _x = room_width/2 - camera_get_view_width(view);
	var _y = room_height/2 - camera_get_view_height(view);
	_x = round(_x); _y = round(_y);
	camera_set_view_pos(view, _x, _y);
}

Zoom(320, 180)
oController.camera_posx = camera_get_view_x(view);
oController.camera_posy = camera_get_view_y(view);
oController.camera_right = oController.camera_posx + view_width;
oController.camera_bottom = oController.camera_posy + view_height;