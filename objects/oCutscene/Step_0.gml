/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if (room = rm_hos_couloir && oPlayer.x >= 400 && !audio_is_playing(snd_phone) && !ITEM[| item.phone][? "get"])
{
	
	scene = CUTSCENE.ACALL;
}
var i = 0; repeat (ds_list_size(cutscenes))
{
	var _scene = cutscenes[| i]
	if (_scene[? "cutscene"] == scene)
	{
		if (ds_list_find_index(scene_visited, _scene) >= 0) { scene = CUTSCENE.FREE; }
		if (scene == CUTSCENE.FREE) { exit; }
		script_execute(_scene[? "function"])
	}
	i++;
}