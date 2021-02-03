// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GiveItem(item_name){
	var i = 0; repeat(ds_list_size(ITEM))
	{
		var _item = ITEM[| i];
		if (_item[? "name"] == item_name)
		{
			_item[? "get"] = true;
		}
		i++;
	}

}