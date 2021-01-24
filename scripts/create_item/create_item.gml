///@description create_item(item, name, sprite, description, get)
///@func create_item
///@param {real} item index for find the item
///@param {string} name name of the item
///@param {sprite} sprite sprite associated to the sprite
///@param {string} description the description of the item
///@param {boolean} get does the player have it?
function create_item(item, name, sprite, description, get){
	if (ds_grid_height(ITEM) <= item) {ds_grid_resize(ITEM, 4, item + 1)};
	ds_grid_set(ITEM, slot.name, item, name);
	ds_grid_set(ITEM, slot.sprite, item, sprite);
	ds_grid_set(ITEM, slot.description, item, description);
	ds_grid_set(ITEM, slot.get, item, get);
}
