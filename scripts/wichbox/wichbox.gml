
///@description wichchatterbox(obj)
///@func wichchatterbox
///@param {object_index} obj object to analyze to know wich box to assign it
function wichchatterbox(obj)
{
	var _box;
	switch (obj)
	{
		case oHBed:
			_box = hbed_box;
			break;
		case oStaffDoor:
			_box = staffdoor_box;
			break;
		case oHosDoor:
			_box = hosdoor_box;
			break;
		default:
			_box = undefined;
			break;
	}
	return _box;
	
}