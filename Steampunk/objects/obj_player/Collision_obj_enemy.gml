/// @description Insert description here
// You can write your code in this editor


if can_be_hit
{
	can_be_hit = false;
	alarm[2] = 30;
	other.enemyHP -= 10
if (other.enemyHP <= 0)
{
	instance_destroy(obj_enemy)
}
}