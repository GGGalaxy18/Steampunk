function scr_player_state_attack_slash(){
	hspeed = 0;
	vspeed = 0;
	
	// Setting the animation to the attack animation
	if (sprite_index != spr_playerAttackTemp) {
		sprite_index = spr_playerAttackTemp;
		image_index = 0;
		ds_list_clear(hit_by_attack);
	}
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
					scr_enemy_hit(2); // 2 is a placeholder for damage done to enemy
				}
			}
		}
	}
	ds_list_destroy(_hit_by_attack_now);
	mask_index = spr_playerIdleTemp;
	
	
	// Delete late if decided not to use rotating sword obj
	//instance_create_layer(x, y, "Instances", obj_swordHitbox1);
	//obj_swordHitbox1.image_angle = direction
	// TODO have sword stay with player
	// TODO have sword swing in set angles
}