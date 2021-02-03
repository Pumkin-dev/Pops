// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scribble_continue(){
	var i = 0; repeat (chatterbox_get_content_count(oChatterbox.box))
	{
		with (oChatterbox)
		{
			chatterbox_list[i].flush();
			// on passe à la prochaine ligne
			chatterbox_continue(box);
			if (speaker != wichspeaker(chatterbox_get_content(box, i)))
			{
				instance_destroy(oFace);
			}	
			scribble_done = false;
		}
		i++;
	}

}