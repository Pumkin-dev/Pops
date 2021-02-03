/// @description Insert description here
// You can write your code in this editor
var i = 0; repeat(chatterbox_get_content_count(oChatterbox.box))
{
	with (oChatterbox)
	{
		if (chatterbox_list[i].get_typewriter_state() < 1)
		{
			switch (other.spr_cycle)
			{
				case 0:
				case 1:
				case 2:
					other.faceState = FACESTATE.NORMAL;
					break;
				case 3:
					other.faceState = FACESTATE.WINK;
					break;
			}
		}
		else
		{
			other.faceState = FACESTATE.TALK;
			
		}
	}
	i++;
}



switch (emotion)
{
	case "doubt":
		sprite_index = spr_doubt
	case "happy":
		sprite_index = spr_happy;
		break;
	case "neutral":
	default:
		switch (faceState)
		{
			case FACESTATE.NORMAL:
				sprite_index = spr_neutral;
				break;
			case FACESTATE.TALK:
				sprite_index = spr_neutral_talk;
				break;
			case FACESTATE.WINK:
				sprite_index = spr_neutral_wink;
				break;
		}
		break;
}