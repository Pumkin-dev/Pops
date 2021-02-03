// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckItem(item_name){
	var i = 0; repeat(ds_list_size(ITEM))
	{
		var item_tested = ITEM[| i];
		if (item_tested[? "name"] == item_name)
		{
			_item = item_tested[? "get"];
		}
		i++;
	}
}