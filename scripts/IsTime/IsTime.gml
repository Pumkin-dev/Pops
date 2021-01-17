///@description IsTime(first_time, time wanted)
///@func IsTime
///@param {real} first_time le marqueur temporel du début de l'événement
///@param {real} time_wanted la durée voulue

// teste, à partir d'un marqueur temporel, si la durée voulue est passée
function IsTime(first_time, time_wanted) {
	time_wanted *= power(10, 3)
	
	if (first_time == 0)
	{
		return true
	}
	else if (current_time - first_time >= time_wanted)
	{
		return true
	}
	else
	{
		return false
	}
}
