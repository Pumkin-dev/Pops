/// @description Enable view
view_enabled = true;
view_visible[0] = true;
if (oCutscene.scene == CUTSCENE.FREE)
{
	camera_set_view_size(view, global.view_width, global.view_height);
}
