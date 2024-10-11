function scr_player_state_hit() {
	if is_hit {
		alarm[6] = hit_cooldown;
		alarm[7] = knockback_duration;
		speed = knockback_speed;
		blend = c_red;
		blend_time = knockback_duration - 1;
		effect_create_above(ef_spark, x, y, 20, c_white);
		is_hit = false;
	}
	
	var _x = lengthdir_x(speed+4, direction);
	var _y = lengthdir_y(speed+4, direction);
	if not check_walkable(x + _x, y + _y) { speed = 0; }
	
	if blend_time > 0 {
		blend_time -= 1;
	} else {
		blend = image_blend;
		speed = 0;
	}
	show_debug_message("ONGOING: " + string(blend_time));
}