/// @description draw instances while paused
if paused {
	if !surface_exists(paused_surf) {
		if instance_exists(obj_render) {
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
		} else { instance_activate_all(); }
	} else {
		draw_surface(paused_surf, 0, 0);
		draw_set_alpha(0.5);
		draw_rectangle_colour(0, 0, camera_get_view_width(0), camera_get_view_height(0), c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		if not dialog_pause {
			draw_set_color(c_gray);
			var buttonx1 = view_wport[0]/2-64;
			var buttony1 = view_hport[0]/2-16;
			var buttonx2 = view_wport[0]/2+64;
			var buttony2 = view_hport[0]/2+16;
			draw_rectangle(buttonx1, buttony1, buttonx2, buttony2, true);
			draw_set_color(c_white);
			draw_text(view_wport[0]/2 - string_width("EXIT")/2, view_hport[0]/2 - string_height("EXIT")/2, "EXIT");
			if mouse_check_button_released(mb_left) {
				if (device_mouse_x_to_gui(0) > buttonx1 and device_mouse_x_to_gui(0) < buttonx2
				and device_mouse_y_to_gui(0) > buttony1 and device_mouse_y_to_gui(0) < buttony2) {
					game_end();
				}
			}
		}
	}
}