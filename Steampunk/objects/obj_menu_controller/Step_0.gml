/// @description pause setup
if keyboard_check_pressed(ord("P")) {
	paused = !paused;
	if paused == false {
		instance_activate_all();
		surface_free(paused_surf);
		paused_surf = -1;
	}
}