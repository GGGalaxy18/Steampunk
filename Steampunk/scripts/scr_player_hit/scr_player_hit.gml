function scr_player_hit(_damage, _dir){
	show_debug_message("RAN");
	if (can_be_hit) {
		hp -= _damage;
		if (hp > 0) {
			state = PLAYERSTATE.HIT;
			can_be_hit = false;
			is_hit = true;
			direction = _dir;
			scr_player_state_hit();
		} else {
			state = PLAYERSTATE.DEAD;
			scr_player_state_dead();
		}
	}
}