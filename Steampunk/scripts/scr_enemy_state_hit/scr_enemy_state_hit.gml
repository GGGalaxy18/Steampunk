function scr_enemy_state_hit() {
	if is_hit {
		if ranged_hit_cooldown == -1 { alarm[0] = hit_cooldown; }
		else { alarm[0] = ranged_hit_cooldown; }
		ranged_hit_cooldown = -1;
		alarm[3] = knockback_duration;
		alarm[4] = attack_cooldown;
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
}