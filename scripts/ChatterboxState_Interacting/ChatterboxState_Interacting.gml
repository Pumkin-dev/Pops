// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@desc Chatterbox_Processing(box)
///@func Chatterbox_Processing
///@param box fichier yarn qui sera lu
function Chatterbox_Processing(box){
	var _outlineWidth = 6;
	var limit = sprite_get_width(sprTBox) - _outlineWidth;
	
	var vmove = PRESSEDUPKEY - PRESSEDDOWNKEY; 
	slot = Wrap(slot + vmove, 0, 1);
	
	// quand tous les dialogues ont défilé
	if (chatterbox_is_stopped(box)) 
	{
		state = CHATTERBOXSTATE.FREE;
		oPlayer.state = PLAYERSTATE.FREE;
		for (var i = 0; i < chatterbox_get_content_count(box); i++)
		{
			chatterbox_list[i].flush();
		}
		for (var i = 0; i < chatterbox_get_option_count(box); i++)
		{
			chatterbox_option_list[i].flush();
		}
		switch (LANG)
		{
			case "fr":
				chatterbox_goto(box, "Debut");
				break;
			case "en":
				chatterbox_goto(box, "Start");
				break;
		}
		speaker = undefined;
		emotion = undefined;
		instance_destroy(oFace);
		exit;
	}
	
	if (!scribble_done)
	{
		for (var i = 0; i < chatterbox_get_content_count(box); i++)
		{
			speaker = wichspeakerwithoutemotion(chatterbox_get_content(box, i));
			emotion = wichemotion(chatterbox_get_content(box, i));
			var _line = linewithoutspeaker(chatterbox_get_content(box, i));
			chatterbox_list[i] = scribble(_line);
			switch (speaker)
			{
				case "Pops":
					limit -= sprite_get_width(sprFacePopsNeutral);
					break;
			}
			chatterbox_list[i].wrap(limit);
			chatterbox_list[i].typewriter_sound(snd_narrateur, 80, 1, 1)
			chatterbox_list[i].typewriter_in(1, 0);
		}
		scribble_done = true;
		draw_content = true;
	}
	if (!chatterbox_is_waiting(box) && !scribble_done_option)
	{
		for (var i = 0; i < chatterbox_get_option_count(box); i++)
		{
			chatterbox_option_list[i] = scribble(chatterbox_get_option(box, i));
			chatterbox_option_list[i].typewriter_in(1, 0);
		}
		scribble_done_option = true;
	}

	// quand il n'y a pas de choix
	if (chatterbox_is_waiting(box))
	{
		// si on appuie sur z
		if (PRESSEDZKEY)
		{
			// on vérifie si le typewriter effect est en cours
			var _typewriter = false;
			for (var i = 0; i < chatterbox_get_content_count(box); i++)
			{
				if (chatterbox_list[i].get_typewriter_state() >= 1)
				{
					// s'il l'est on active le déclecheur
					_typewriter = true;
				}
				else
				{
					// sinon on force l'arrêt de l'effet
					chatterbox_list[i] = chatterbox_list[i].typewriter_skip();
				}
			}
			// si le déclencheur est activé
			if (_typewriter)
			{
				for (var i = 0; i < chatterbox_get_content_count(box); i++)
				{
					chatterbox_list[i].flush();
				}
				// on passe à la prochaine ligne
				chatterbox_continue(box);
				for (var i = 0; i < chatterbox_get_content_count(box); i++)
				{
					if (speaker != wichspeaker(chatterbox_get_content(box, i)))
					{
						instance_destroy(oFace);
					}
				}
				scribble_done = false;
			}
		}
	}
	else
	{
		
		if (PRESSEDZKEY)
		{
			for (var i = 0; i < chatterbox_get_content_count(box); i++)
			{
				
				if (chatterbox_list[i].get_typewriter_state() < 1 && draw_content)
				{
					chatterbox_list[i].typewriter_skip();
				}
				else if (chatterbox_list[i] >= 1 && draw_content)
				{
					draw_options = true;
					draw_content = false;
				}
				else
				{
					for (var i = 0; i < chatterbox_get_option_count(box); i++)
					{
						if (chatterbox_option_list[i].get_typewriter_state() < 1)
						{
							chatterbox_option_list[i].typewriter_skip();
						}
						else
						{
							chatterbox_select(box, slot);
							scribble_done = false;
							draw_options = false;
							scribble_done_option = false;
							chatterbox_option_list[i].flush();
					    }
					}
				}
			}
		}		
	}
}
function ChatterboxState_Interacting(){
	if (box == undefined)
	{
		box = wichchatterbox(global.obj_det);
	}
	Chatterbox_Processing(box);
	if (state == CHATTERBOXSTATE.FREE)
	{
		box = undefined;
	}
}