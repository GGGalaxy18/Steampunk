/// @description player collision

if can_be_hit {
	can_be_hit = false;
	alarm[0] = hit_cooldown;
	enemy_hp -= 10;		// Will likely move so that damage is input based on player weapon
	if (enemy_hp <= 0) { instance_destroy(); }
}