/// @description player enemy hit
if hit_by_attack {
	hit_by_attack = false;
	
	if obj_player.state != PLAYERSTATE.DASH {
		with (obj_player) {
			scr_player_hit(other.attack_damage, set_iso_direction_clamped(point_direction(other.parent_enemy.x, other.parent_enemy.y, x, y)));
		}
	}
}
audio_play_sound(snd_player_hurt,10,false)