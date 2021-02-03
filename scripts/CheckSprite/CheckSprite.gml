// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckSprite(object, ind){
	with (asset_get_index(object))
	{
		if (sprite_index == asset_get_index(ind)) {oChatterbox.checksprite = true;}
		else { oChatterbox.checksprite = false; }
	}
}