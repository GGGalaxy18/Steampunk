/// @description draw instances while paused
if paused {
	if !surface_exists(paused_surf) {
		if paused_surf == -1 {
			playerx = obj_player.x;
			playery = obj_player.y;
			instance_deactivate_all(true);
		}
		paused_surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
		surface_set_target(paused_surf);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
	} else {
		draw_surface_stretched(paused_surf, 0, 0, display_get_gui_width(), display_get_gui_height());
		draw_set_alpha(0.5);
		draw_rectangle_colour(playerx - camera_get_view_width(0)/2, playery - camera_get_view_height(0)/2, playerx + camera_get_view_width(0)/2, playery + camera_get_view_height(0)/2, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		draw_text_transformed_colour(playerx, playery, "PAUSED", 2, 2, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
		draw_set_halign(fa_left);
	}
}