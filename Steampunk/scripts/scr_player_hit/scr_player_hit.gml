function scr_player_hit(_damage, _dir){
	if (can_be_hit) {
		hp -= _damage;
		if (hp > 0) {
			state = PLAYERSTATE.HIT;
			can_be_hit = false;
			is_hit = true;
			direction = _dir;
		} else {
			state = PLAYERSTATE.DEAD
		}
	}
}