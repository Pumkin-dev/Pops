///@description Distance(from_x, from_y, to_x, to_y, duration)
///@function Distance
///@param {real} from_x la coordonnée en abscisse du point de départ
///@param {real} from_y la coordonnée en ordonnée du point de départ
///@param {real} to_x  la coordonnée en abscisse du point d'arrivée
///@param {real} to_y la coordonnée en ordonnée du point d'arrivée
///@param {real} duration combien de temps l'objet parent mettra du point de départ, pour atteindre le point  d'arrivée

// Cette fonction sert à calculer une vitesse
// Une vitesse pour laquelle il s'y déplacera d'un point A à un point B pendant duration secondes
function Distance(from_x, from_y, to_x, to_y, duration){
	var dx = to_x - from_x;
	var dy = to_y - from_y;
	var vx = dx/duration;
	var vy = dy/duration;
	var result;
	result[1] = vy;
	result[0] = vx;
	return result
}