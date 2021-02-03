
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
		case oCardiogramme:
			_box = cardiogram_box;
			break;
		case oBookShelf:
			_box = bookshelf_box;
			break;
		case oPlant:
			_box = plant_box;
			break;
		case oHFrontBed:
			_box = hfrontbed_box;
			break;
		default:
			_box = undefined;
			break;
	}
	return _box;
	
}