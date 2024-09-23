/// @description player collision

if can_be_hit {
	can_be_hit = false;
	alarm[0] = hit_cooldown;
	speed = 0;
	if (hp <= 0) { instance_destroy(); }
}