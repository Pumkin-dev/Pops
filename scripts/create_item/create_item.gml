///@description create_item(item, name, sprite, description, get)
///@func create_item
///@param {real} item index for find the item
///@param {string} name name of the item
///@param {sprite} sprite sprite associated to the sprite
///@param {string} description the description of the item
///@param {boolean} get does the player have it?
function create_item(item, name, sprite, description, get){
	var _map = ds_map_create();
	
	_map[? "item"] = item;
	_map[? "name"] = name;
	_map[? "sprite"] = sprite;
	_map[? "description"] = description;
	_map[? "get"] = get;
	
	ds_list_add(ITEM, _map)
	ds_list_mark_as_map(ITEM, ds_list_size(ITEM) - 1);
}
