function scr_player_state_attack_slash() {
	speed = 0;
	
	// Start of attack
	if (sprite_index != spr_playerAttackTemp) {
		sprite_index = spr_playerAttackTemp;
		image_index = 0;
		ds_list_clear(hit_by_attack);
	}
	
	// Set sprite to face left or right
	if lengthdir_x(1, point_direction(x, y, mouse_x, mouse_y)) < 0 {
		image_xscale = -1 * abs(image_xscale);
	} else { image_xscale = 1 * abs(image_xscale); }
	
	// Use attack hitbox and check for hits
	mask_index = spr_playerAttackTempHB;
	var _hit_by_attack_now = ds_list_create(); // List of enemies hit this frame;
	var _hits = instance_place_list(x, y, obj_enemy, _hit_by_attack_now, false);
	if (_hits > 0) {
		for (var i=0; i<_hits; i++) {
			// If this instance has not yet been hit by this attack
			var _hit_id = _hit_by_attack_now[| i];
			if (ds_list_find_index(hit_by_attack, _hit_id) == -1) {
				ds_list_add(hit_by_attack, _hit_id);
				with (_hit_id) {
					scr_enemy_hit(10); // 10 is a placeholder for damage done to enemy
				}
			}
		}
	}
	ds_list_destroy(_hit_by_attack_now);
	mask_index = spr_playerIdleTemp;
	
	if (animation_end()) {
		sprite_index = spr_playerIdleTemp;
		state = PLAYERSTATE.FREE;
	}
}