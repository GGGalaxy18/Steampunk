function scr_enemy_state_dead() {
	if not is_dead {
		speed = 0;
		blend = c_black;
		is_dead = true;
		dead_timer = 15;
	}
	dead_timer -= 1;
	if dead_timer < 0 { instance_destroy(); }
}