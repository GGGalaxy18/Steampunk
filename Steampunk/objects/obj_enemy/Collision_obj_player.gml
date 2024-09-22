/// @description player collision

if can_be_hit {
	can_be_hit = false;
	alarm[0] = hit_cooldown;
	hp -= 10;		// Will likely move so that damage is input based on player weapon
	if (hp <= 0) { instance_destroy(); }
}