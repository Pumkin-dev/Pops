// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EndScene(scene_name){
	with (oCutscene)
	{
		var i = 0; repeat (ds_list_size(cutscenes))
		{
			var _scene = cutscenes[| i]
			if (_scene[? "name"] == scene_name)
			{
				ds_list_add(scene_visited, _scene);
				ds_list_mark_as_map(scene_visited, ds_list_size(scene_visited) - 1);
			}
			i++;
		}
	}

}