function WichLayer(object) {
		
	var yreal, center;

	with (object)
	{
		if (object_index != oWall)
		{
			yreal = y - sprite_yoffset;
			center = yreal + sprite_height/2;
			if (layer != layer_get_id("Walls"))
			{
				if (other.y <= center)
				{
					layer = layer_get_id("Furnitures_up");
				}
				else
				{
					layer = layer_get_id("Furnitures_down");
				}
			}
		}
	}
}
///@description FurnituresUpOrDown()
///@func FurnituresUpOrDown

// détermine sur quel layer ira un objet en fonction de la position du joueur et du centre de l'objet
function FurnituresUpOrDown() {
	WichLayer(oFurniture);
	WichLayer(oPNJ);
}

