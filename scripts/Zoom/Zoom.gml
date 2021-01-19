// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Zoom(point_x, point_y){
	camera_set_view_pos(view, lerp(camera_get_view_x(view), oCamera.view_width/2, 0.1), lerp(camera_get_view_y(view), oCamera.view_height/2, 0.1))
	
	var _x = point_x - round(camera_get_view_width(view)/2);
	var _y = point_y - round(camera_get_view_height(view)/2);
	
	camera_set_view_pos(view, _x, _y);

}