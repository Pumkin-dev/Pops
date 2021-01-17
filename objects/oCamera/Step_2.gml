/// @description 
#macro view view_camera[0]
camera_set_view_size(view, view_width, view_height);

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

if (room_get_name(room) == "init_room")
{
	room_goto_next();
}
oController.camera_posx = camera_get_view_x(view);
oController.camera_posy = camera_get_view_y(view);
oController.camera_right = oController.camera_posx + view_width;
oController.camera_bottom = oController.camera_posy + view_height;