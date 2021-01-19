///@description create_item(item, name, sprite, description, get)
///@func create_item
///@param {constant} item index for find the item
///@param {string} name name of the item
///@param {sprite} sprite sprite associated to the sprite
///@param {string} description the description of the item
///@param {boolean} get does the player have it?
function create_item(item, name, sprite, description, get){
	if (item >= ds_grid_height(ITEM))
	{
		ds_grid_resize(ITEM, 4, item);
	}
	
	ds_grid_add(ITEM, slot.name, item, name);
	ds_grid_add(ITEM, slot.sprite, item, sprite);
	ds_grid_add(ITEM, slot.description, item, description);
	ds_grid_add(ITEM, slot.get, item, get);
}
