/// @description enemy hit
if not array_contains(enemies_hit, other.id) {
	array_push(enemies_hit, other.id);
	with (other.id) {
		scr_enemy_hit(10, set_iso_direction_clamped(point_direction(other.x, other.y, mouse_x, mouse_y))); // 10 is a placeholder for damage done to enemy
	}
}

audio_play_sound(snd_ene_hit,10,false)