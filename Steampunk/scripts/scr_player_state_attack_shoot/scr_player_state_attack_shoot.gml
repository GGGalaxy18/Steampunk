// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_state_attack_shoot() {
	
	// Movement management
	if ((xdir != 0) or (ydir != 0)) {
		direction = set_iso_direction(point_direction(0, 0, xdir, ydir));	// Sets direction of player
		var _x = lengthdir_x(move_speed, direction);
		var _y = lengthdir_y(move_speed, direction);
		with (obj_boundary_collision) {
			if (check_walkable(x + _x, y + _y)) {	// TODO: Check sprite width for collision too
				other.x += _x;
				other.y += _y;
				set_player_z();
			}
		}
	}
	
	if can_shoot{
		if current_magazine <= 0 {
			if num_scrap > 0 {
				state = PLAYERSTATE.RELOAD;
				scr_player_state_reload();
			}
		} else {
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
			instance_create_layer(x, y - sprite_height/2, "Instances", obj_plr_bullet);
			current_magazine -= 1;
			audio_play_sound(snd_shoot,10,false)
		}
	}
	
	if (animation_end() and state != PLAYERSTATE.RELOAD) {
		sprite_index = spr_player_idle_s;
		state = PLAYERSTATE.FREE;
	}
}