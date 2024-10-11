/// @description damage enemy
with (other) {
	scr_enemy_hit(other.bullet_damage, other.direction);
}
instance_destroy();