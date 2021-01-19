// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@description wichspeaker(line)
///@func wichspeaker
///@param {string} line the line to analyze for the speaker
function wichspeaker(line){
	var speaker, char_two_points;
	char_two_points = string_pos(":", line);
	speaker = string_delete(line, char_two_points, string_length(line) + 1 - char_two_points);
	return speaker
}
///@description wichspeakerwithoutemotion(line)
///@func wichspeakerwithoutemotion
///@param {string} line the line to analyze for the speaker
function wichspeakerwithoutemotion(line){
	var speaker, char_two_points;
	char_two_points = string_pos(":", line);
	speaker = string_delete(line, char_two_points, string_length(line) + 1 - char_two_points);
	var char_op_bracket = string_pos("(", speaker);
	var char_clos_bracket = string_pos(")", speaker);
	if (char_op_bracket != 0 && char_clos_bracket != 0)
	{
		speaker = string_delete(speaker, char_op_bracket, char_clos_bracket);
	}
	return speaker
}
///@description linewithoutspeaker(line)
///@func linewithoutspeaker
///@param {string} line the line to analyze for the speaker
function linewithoutspeaker(line){
	var speaker, char_two_points;
	char_two_points = string_pos(":", line);
	speaker = string_delete(line, 1, char_two_points+1);
	return speaker
}
///@description wichemotion(line)
///@func wichemotion
///@param {string} line the line to analyze for the speaker
function wichemotion(line)
{
	var speaker = wichspeaker(line);
	var char_op_bracket = string_pos("(", speaker);
	var char_clos_bracket = string_pos(")", speaker);
	if (char_op_bracket != 0 && char_clos_bracket != 0)
	{
		var emotion = string_delete(speaker, char_clos_bracket, 1);
		var emotion = string_delete(emotion, 1, char_op_bracket);
		return emotion;
	}
	else {return undefined}
}