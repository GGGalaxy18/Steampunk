/// @description go to previous room
if not paused {
	room_goto_previous();
} else {
	instance_activate_all();
	surface_free(paused_surf);
	paused_surf = -1;
	room_goto_previous();
}