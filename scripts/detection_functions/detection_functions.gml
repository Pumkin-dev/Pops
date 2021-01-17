///@description ObjectDetection()
///@func ObjectDetection
function ObjectDetection() {

	var detection, local_bbox_left, local_bbox_right;
	local_bbox_left = x - sprite_xoffset;
	local_bbox_right = local_bbox_left + sprite_width;
	if (front)
	{
		detection = collision_line(local_bbox_left, bbox_bottom + 1, local_bbox_right, bbox_bottom + 1, oEntity, false, true);
	}
	else if (back)
	{
		detection = collision_line(local_bbox_left, bbox_top - 1, local_bbox_right, bbox_top - 1, oEntity, false, true);
	}
	else if (right)
	{
		detection = collision_line(local_bbox_right + 1, bbox_top, local_bbox_right + 1, bbox_bottom, oEntity, false, true);
	}
	else if (left)
	{
		detection = collision_line(local_bbox_left - 1, bbox_top, local_bbox_left - 1, bbox_bottom, oEntity, false, true);
	}
	return detection;


}

///@description PlayerDetection()
///@func PlayerDetection()
function PlayerDetection() {

	var detection, backh, fronth, righth, lefth;
	with (oPlayer)
	{
		backh = back;
		fronth = front;
		righth = right;
		lefth = left;
	}
	if (backh)
	{
		detection = collision_line(self.bbox_left, self.bbox_bottom + 1, self.bbox_right, self.bbox_bottom + 1, oPlayer, false, false);
	}
	else if (fronth)	
	{
		detection = collision_line(self.bbox_left, self.bbox_top - 1, self.bbox_right, self.bbox_top - 1, oPlayer, false, false);
	}

	else if (righth)
	{
		detection = collision_line(self.bbox_left - 1, self.bbox_top, self.bbox_left - 1, self.bbox_bottom, oPlayer, false, false);
	}

	else if (lefth)
	{
		detection = collision_line(self.bbox_right + 1, self.bbox_top, self.bbox_right + 1, self.bbox_bottom, oPlayer, false, false);
	}
	return detection;
}