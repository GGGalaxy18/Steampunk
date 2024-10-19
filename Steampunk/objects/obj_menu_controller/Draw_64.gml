/// @description draw instances while paused
if paused {
	if !surface_exists(paused_surf) {
		if paused_surf == -1 {
			instance_deactivate_all(true);
			if id != noone {
				instance_activate_object(dialog_id);
			}
		}
		paused_surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
		surface_set_target(paused_surf);
		shader_set(sh_shader);
		draw_surface(application_surface, 0, 0);
		shader_reset();
		surface_reset_target();
	} else {
		draw_surface(paused_surf, 0, 0);
		draw_set_alpha(0.5);
		draw_rectangle_colour(0, 0, camera_get_view_width(0), camera_get_view_height(0), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
}