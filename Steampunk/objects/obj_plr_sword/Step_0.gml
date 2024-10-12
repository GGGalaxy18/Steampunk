/// @description keep attack fixed on player
x = obj_player.x;
y = obj_player.y - y_offset + sprite_height/2;

if image_angle < base_image_angle + attack_angle_range {
	image_angle += (attack_angle_range*2) / slash_speed;
} else {
	if obj_player.state == PLAYERSTATE.ATTACK_SLASH {
		obj_player.state = PLAYERSTATE.FREE;
		with (obj_player) scr_player_state_free();
	}
	instance_destroy();
}