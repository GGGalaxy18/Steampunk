// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_attack_shoot() {
	if can_shoot{
		if current_magazine <= 0 {
			state = PLAYERSTATE.FREE;
			scr_reload();
		} else {
			speed = 0;
	
			// Start of attack
			if (sprite_index != spr_playerShootTemp) {
				sprite_index = spr_playerShootTemp;
				image_index = 0;
			}
	
			// Set sprite to face left or right
			if lengthdir_x(1, point_direction(x, y, mouse_x, mouse_y)) < 0 {
				image_xscale = -1 * abs(image_xscale);
			} else { image_xscale = 1 * abs(image_xscale); }
	
			alarm[4] = ranged_cooldown;
			can_shoot = false;
			instance_create_layer(x, y, "Instances", obj_plr_bullet);
			current_magazine -= 1;
		}
	}
	
	if (animation_end()) {
		sprite_index = spr_playerIdleTemp;
		state = PLAYERSTATE.FREE;
	}
}