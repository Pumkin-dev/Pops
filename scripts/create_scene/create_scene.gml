// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_scene(cutscene, name, _function){
	var _map = ds_map_create();
	_map[? "cutscene"] = cutscene
	_map[? "name"] = name;
	_map[? "function"] = _function;
	
	ds_list_add(cutscenes, _map);
	ds_list_mark_as_map(cutscenes, ds_list_size(cutscenes) - 1);

}