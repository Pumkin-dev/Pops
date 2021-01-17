///@desctiption SetDirection(wdirection)
///@func SetDirection
///@param {string} wdirection la direction dans laquelle mettre le personnage
function SetDirection(wdirection) {

	switch (wdirection)
	{
		case "front":
			front = true;
			back = false;
			right = false;
			left = false;
			break;
		case "back":
			front = false;
			back = true;
			right = false;
			left = false;
			break;
		case "left":
			front = false;
			back = false
			left = true;
			right = false;
			break;
		case "right":
			front = false;
			back = false;
			left = false;
			right = true;
			break;
	}
}
