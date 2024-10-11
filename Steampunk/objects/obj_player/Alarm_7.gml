/// @description knockback duration
if state == PLAYERSTATE.HIT {
	state = PLAYERSTATE.FREE;
	speed = 0;
	scr_player_state_free();
}