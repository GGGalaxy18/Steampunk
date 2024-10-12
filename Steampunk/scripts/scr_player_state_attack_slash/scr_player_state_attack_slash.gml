function scr_player_state_attack_slash() {
	speed = 0;
	
	// Start of attack
	if (sprite_index != spr_player_s) {
		sprite_index = spr_player_s;
		image_index = 0;
		ds_list_clear(hit_by_attack);
	}
	
	// Set sprite to face left or right
	if lengthdir_x(1, point_direction(x, y, mouse_x, mouse_y)) < 0 {
		image_xscale = -1 * abs(image_xscale);
	} else { image_xscale = 1 * abs(image_xscale); }
	
	var _sword = noone;
	if can_attack {
		var _attack_struct = { base_image_angle: set_iso_direction_clamped(point_direction(other.x, other.y, mouse_x, mouse_y)) };
		_sword = instance_create_depth(x, y, 4, obj_plr_sword, _attack_struct);
		can_attack = false;
		alarm[2] = max(melee_cooldown + 3, _sword.slash_speed + 3);
	}
}