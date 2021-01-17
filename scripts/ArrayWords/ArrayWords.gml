/// @description ArrayWords(str)
/// @func ArrayWords
/// @param {string} str string où extirper les mots pour les mettre dans une liste
function ArrayWords(str) {

	var c, lis;
	c = 0;

	for (var i = string_length(str); i > -1; i--)
	{
		if (string_char_at(str, i) == " ")
		{
			lis[c] = string_copy(str, 1, string_pos(" ", str));
			str = string_replace(str, lis[c], "");	
			c += 1
		}
		else if (i == string_length(str))
		{
			lis[c] = str;
		}
	}
	return lis;
}
