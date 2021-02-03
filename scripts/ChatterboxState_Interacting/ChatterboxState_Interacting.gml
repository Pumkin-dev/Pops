// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@desc Chatterbox_Processing(box)
///@func Chatterbox_Processing
///@param box fichier yarn qui sera lu
function Chatterbox_Processing(box){
	var _outlineWidth = 6;
	var limit = sprite_get_width(sprTBox) - _outlineWidth;
	_room = room_get_name(room);
	if (audio_is_playing(snd_phone)) { _sound = true; }
	else { _sound = false; } 
	if (oCutscene.scene == CUTSCENE.INTRO && room == rm_menu)
	{
		scale = 0.0001;
	}
	if (instance_exists(oPlayer))
	{
		_x = oPlayer.x;
	}

	// quand tous les dialogues ont défilé
	if (chatterbox_is_stopped(box) && scale <= 0.0001) 
	{
		state = CHATTERBOXSTATE.FREE;
		surface_free(surf_growup);
		if (instance_exists(oPlayer) && oController.goto == undefined)
		{
			oPlayer.state = PLAYERSTATE.FREE;
		}
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
		
		if (oCutscene.scene = CUTSCENE.INTRO)
		{
			if (!oCutscene.openyoureyes)
			{
				oCutscene.openyoureyes = true;
			}
			if (room == rm_hos_chambre_pops)
			{
				with (oPlayer)
				{
					sprite_index = sprPopsStandingUp;
					image_index = 0;
					image_speed = 1;
				
				}
			}
		}
		if (oCutscene.scene != CUTSCENE.FREE && oCutscene.scene != CUTSCENE.INTRO)
		{
			oCutscene.scene = CUTSCENE.FREE;
		}
		
		if (instance_exists(oBox)) { instance_destroy(oBox); }
		speaker = undefined;
		emotion = undefined;
		pos_x = 0; pos_y = 0;
		fading = false;
		instance_destroy(oFace);
		exit;
	}
	else if (chatterbox_is_stopped(box) && scale >= 0.0001) 
	{
		scale = lerp(scale, 0, 0.3);
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
					chatterbox_list[i].typewriter_sound(snd_pops_talk, 80, 0.99, 1.01);
					break;
				case "Phone Guy":
					chatterbox_list[i].typewriter_sound(snd_phone_guy, 100, 0.99, 1.01)
					break;
				case "Narrateur":
				default:
					chatterbox_list[i].typewriter_sound(snd_narrateur, 80, 1, 1);
					break;
			}
			if (room != rm_menu)
			{
				chatterbox_list[i].wrap(limit);
			}
			chatterbox_list[i].typewriter_in(1, 0);
		}
		scribble_done = true;
	}
	if (!chatterbox_is_waiting(box) && !scribble_done_option)
	{
		for (var i = 0; i < chatterbox_get_option_count(box); i++)
		{
			chatterbox_option_list[i] = scribble(chatterbox_get_option(box, i));
			chatterbox_option_list[i].typewriter_in(1, 0);
			chatterbox_option_list[i].align(fa_center, fa_middle);
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
					chatterbox_list[i].typewriter_skip();
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
		var vmove = PRESSEDDOWNKEY - PRESSEDUPKEY; 
		var nb_option = chatterbox_get_option_count(box) -1
		chat_slot = Wrap(chat_slot + vmove, 0, nb_option);
		
		if (PRESSEDZKEY)
		{
			for (var i = 0; i < chatterbox_get_option_count(box); i++)
			{
				if (chatterbox_option_list[i].get_typewriter_state() < 1)
				{
					chatterbox_option_list[i].typewriter_skip();
				}
				else
				{
					chatterbox_select(box, chat_slot);
					scribble_done = false;
					scribble_done_option = false;
					chatterbox_option_list[i].flush();
				}
			}
		}		
	}
}
function ChatterboxState_Interacting(){
	if (!surface_exists(surf_growup))
	{
		surf_growup = surface_create(1, 1);
	}
	if (box == undefined)
	{
		switch (oCutscene.scene)
		{
			case CUTSCENE.INTRO:
				box = intro_box;
				break;
			case CUTSCENE.ACALL:
				box = phone_guy_box;
				break;
			default:
				box = wichchatterbox(global.obj_det);
				break;
		}
	}
	Chatterbox_Processing(box);
	if (state == CHATTERBOXSTATE.FREE)
	{
		box = undefined;
	}
}