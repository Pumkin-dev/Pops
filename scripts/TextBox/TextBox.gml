/// @description TextBox(_x, _y, layer_name, ltext)
/// @func TextBox
/// @param {real} _x coordonnée x de la boîte
/// @param {real} _y coordonnée y
/// @param {string} layer_name nom du calque où afficher la boîte
/// @param {string} ltext le texte qui sera affiché
function TextBox(_x, _y, layer_name, ltext){
	var box = instance_create_layer(_x, _y, layer_name, oBox);
	box.text = ltext 
}