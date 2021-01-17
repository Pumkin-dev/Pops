/// @description Fading(duration, color, fadeinboo)
/// @function Fading
/// @param {real} duration la durée en secondes à laquelle le fondu se fera
/// @param {color} la couleur du fondu
/// @param {index} wichfade soit le fadeout soit le fadein 

// comme le nom l'indique, il va faire un fondu à une vitesse donnée inférieure à 1
function Fading(duration, color, wichfade){
	// On calcule la vitesse par frame pour que le fondu se fasse pendant la durée
	var lspeed = 1/(duration*room_speed)
	// On change la couleur du fondu
	layer_background_blend(layer_get_id("bground_fade"), color);
	
	// Si c'est un fondu qui apparaît
	if (instance_exists(oFadingout))
	{
		wichfade.alpha -= lspeed;
		wichfade.alpha = clamp(wichfade.alpha, 0, 1);
	}
	
	// Si c'est un fondu qui disparaît
	if (instance_exists(oFadingin))
	{
		wichfade.alpha += lspeed;
		wichfade.alpha = clamp(wichfade.alpha, 0, 1);
	}
	switch (wichfade.alpha)
	{
		// Si l'alpha est égale à 0 on active le fadein
		case 0:
			if (wichfade == fadeout)
			{		
				wichfade.done = true;
			}
			break;
		// de même mais pour le fadeout
		case 1:
			if (fadein)
			{
				wichfade.done = true;
			}
			break;
	}
}

/// @description Fadingout(duration, color, fadeinbool, event, parent_object)
/// @func Fadingout
/// @param {real} duration de même
/// @param {color} color de même
/// @param {real} wait le temps à attendre après le fondu
/// @param {bool} event on devrait incrémenter une variable ?
/// @param {index} parent_object l'objet auquel appliquer le fading

function Fadingout(duration, color, wait, event, parent_object){
	if (!instance_exists(oFadingout))
	{
		fadeout = instance_create_layer(x, y, layer_get_id("fade"), oFadingout)
	}
	fadeout.x = 0;
	fadeout.y = 0;
	if (!fadeout.done)
	{
		Fading(duration, color, fadeout);
		if (fadeout.done)
		{
			oController.fadingin = true;
			oController.fadingout = false;
			oController.fading = false;
			fadeout.alarm[0] = wait;
			if event
			{
				parent_object.alarm[2] = 1;
			}	
		}
	}
}	
/// @description Fadingin(duration, color, fadeinbool, event, parent_object)
/// @func Fadingin
/// @param {real} duration de même
/// @param {color} color de même
/// @param {int} wait de même
/// @param {bool} event on devrait incrémenter une variable ?
/// @param {index} parent_object l'objet auquel appliquer le fading


function Fadingin(duration, color, wait, event, parent_object){
	if (!instance_exists(oFadingin))
	{
		fadein = instance_create_layer(x, y, layer_get_id("fade"), oFadingin);
	}
	fadein.x = 0;
	fadein.y = 0;
	if (!fadein.done)
	{
		Fading(duration, color, fadein)
		if (fadein.done)
		{
			oController.fadingin = false;
			oController.fadingout = true;
			oController.fading = false;
			fadein.alarm[0] = wait;
			if event
			{
				parent_object.alarm[2] = 1;
			}	
		}
	}
}