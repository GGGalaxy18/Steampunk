/// @description knockback duration
if state == ENEMYSTATE.HIT {
	state = ENEMYSTATE.PURSUIT;
	scr_enemy_state_pursuit();
}