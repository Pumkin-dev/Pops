// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@desc goTo_Room(room_name)
///@func goTo_Room
///@param {string} room_name
function goTo_Room(room_name, _x, _y){
	oController.goto = room_name;
	oController.warp_x = _x; oController.warp_y = _y;

}