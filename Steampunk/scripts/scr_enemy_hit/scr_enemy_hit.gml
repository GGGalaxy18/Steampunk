function scr_enemy_hit(_damage){
	hp -= _damage;
	if (hp > 0) {
		state = ENEMYSTATE.HIT;
		hit_now = true;
	} else {
		state = ENEMYSTATE.DEAD;
	}
}