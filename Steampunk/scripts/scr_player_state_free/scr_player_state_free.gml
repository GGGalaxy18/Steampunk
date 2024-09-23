function scr_player_state_free(){
	if ((xdir != 0) or (ydir != 0)) {
		direction = point_direction(0, 0, xdir, ydir);	// Sets direction of player
		x += lengthdir_x(move_speed, direction);
		y += lengthdir_y(move_speed, direction);
	}

	// Dash mechanic
	if dash { state = PLAYERSTATE.DASH; }
	
	// Melee attack mechanic
	if attack { state = PLAYERSTATE.ATTACK_SLASH; }
		
}