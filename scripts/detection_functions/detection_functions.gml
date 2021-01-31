///@description ObjectDetection()
///@func ObjectDetection
function ObjectDetection() {

	var detection, local_bbox_left, local_bbox_right;
	local_bbox_left = x - sprite_xoffset;
	local_bbox_right = local_bbox_left + sprite_width;
	switch (charaDirection)
	{
		case CHARADIRECTION.FRONT:
			detection = collision_line(local_bbox_left, bbox_bottom + 1, local_bbox_right, bbox_bottom + 1, oEntity, false, true);
			break;
		case CHARADIRECTION.BACK:
			detection = collision_line(local_bbox_left, bbox_top - 1, local_bbox_right, bbox_top - 1, oEntity, false, true);
			break;
		case CHARADIRECTION.RIGHT:
			detection = collision_line(local_bbox_right + 1, bbox_top, local_bbox_right + 1, bbox_bottom, oEntity, false, true);
			break;
		case CHARADIRECTION.LEFT:
			detection = collision_line(local_bbox_left - 1, bbox_top, local_bbox_left - 1, bbox_bottom, oEntity, false, true);
			break;
	}
	return detection;


}

///@description PlayerDetection()
///@func PlayerDetection()
function PlayerDetection() {

	switch (oPlayer.charaDirection)
	{
		case CHARADIRECTION.BACK:
			detection = collision_line(self.bbox_left, self.bbox_bottom + 1, self.bbox_right, self.bbox_bottom + 1, oPlayer, false, false);
			break;
		case CHARADIRECTION.FRONT:	
			detection = collision_line(self.bbox_left, self.bbox_top - 1, self.bbox_right, self.bbox_top - 1, oPlayer, false, false);
			break;
		case CHARADIRECTION.RIGHT:	
			detection = collision_line(self.bbox_left - 1, self.bbox_top, self.bbox_left - 1, self.bbox_bottom, oPlayer, false, false);
			break;
		case CHARADIRECTION.LEFT:
			detection = collision_line(self.bbox_right + 1, self.bbox_top, self.bbox_right + 1, self.bbox_bottom, oPlayer, false, false);
			break;
	}
	return detection;
}