/// @description follow enemy
if (instance_exists(enemy_instance)) {
	x = enemy_instance.x;
	y = enemy_instance.y;
} else instance_destroy();