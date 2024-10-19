/// @description pause setup
if dialog_pause and dialog_id != noone {
	paused = true;
} else if keyboard_check_pressed(vk_escape) {
	paused = !paused;
	if paused == false {
		instance_activate_all();
		surface_free(paused_surf);
		paused_surf = -1;
	}
}