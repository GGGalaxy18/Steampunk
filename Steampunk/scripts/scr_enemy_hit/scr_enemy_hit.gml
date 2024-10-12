function scr_enemy_hit(_damage, _dir){
	if (can_be_hit) {
		hp -= _damage;
		if (hp > 0) {
			state = ENEMYSTATE.HIT;
			can_be_hit = false;
			is_hit = true;
			direction = _dir;
		} else {
			state = ENEMYSTATE.DEAD;
		}
	}
}